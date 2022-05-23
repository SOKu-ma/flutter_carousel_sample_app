import 'package:flutter/material.dart';
import 'package:flutter_carousel_sample_app/model/carousel_conatiner_model.dart';
import 'package:flutter_carousel_sample_app/views/detail/detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// カルーセルのアイテム表示用Widget
class carouselContainer extends ConsumerWidget {
  final int index;
  final double heightSize;
  final double widthSize;

  const carouselContainer(this.index, this.heightSize, this.widthSize,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // カルーセルコンテンツmodelプロバイダ
    final _carouselContentsProvider = ref.watch(carouselContentsProvider);
    final _carouselContentsProviderNotifier =
        ref.watch(carouselContentsProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            // 画像
            InkWell(
              child: Container(
                height: heightSize,
                width: widthSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(_carouselContentsProvider[index].url),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              onTap: () {
                // 詳細画面へ遷移
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => Detail(index),
                  ),
                );
              },
            ),
            // お気に入りボタン
            InkWell(
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                margin: EdgeInsets.only(left: widthSize - 40, top: 5),
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
                    !_carouselContentsProvider[index].isFavorite, index);
              },
            ),
          ],
        ),
        // カルーセルのフッダー
        Container(
          margin: const EdgeInsets.only(left: 10, top: 20),
          child: Text(
            _carouselContentsProvider[index].title,
            // 'タイトル',
            style: const TextStyle(fontSize: 20),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, top: 10),
          child: Text(
            _carouselContentsProvider[index].subTitle,
            // 'サブタイトル',
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
