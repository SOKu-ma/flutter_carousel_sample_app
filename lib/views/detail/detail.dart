import 'package:flutter/material.dart';
import 'package:flutter_carousel_sample_app/model/carousel_conatiner_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Detail extends ConsumerWidget {
  final int index;
  const Detail(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // カルーセルコンテンツmodelプロバイダ
    final _carouselContentsProvider = ref.watch(carouselContentsProvider);
    final _carouselContentsProviderNotifier =
        ref.watch(carouselContentsProvider.notifier);
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // サムネイル
            SizedBox(
              height: 220,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity / 3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(_carouselContentsProvider[index].url),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                    ),
                    body: GestureDetector(
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        margin:
                            EdgeInsets.only(left: _size.width - 50, top: 100),
                        child: Icon(
                          _carouselContentsProvider[index].isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: _carouselContentsProvider[index].isFavorite
                              ? Colors.red
                              : Colors.white,
                          size: 30,
                        ),
                      ),
                      onTap: () {
                        // お気に入りフラグのON/OFF
                        _carouselContentsProviderNotifier.cheaked(
                          !_carouselContentsProvider[index].isFavorite,
                          index,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // タイトル
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
              width: double.infinity,
              color: Colors.white,
              child: Text(
                _carouselContentsProvider[index].title,
                // title,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            // サブタイトル
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
              width: double.infinity,
              color: Colors.white,
              child: Text(
                _carouselContentsProvider[index].subTitle,
                // subTitle,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            // 詳細テキスト
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
              width: double.infinity,
              color: Colors.white,
              child: Text(
                _carouselContentsProvider[index].detailText,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
