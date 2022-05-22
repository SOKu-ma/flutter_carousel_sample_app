import 'package:flutter/material.dart';
import 'package:flutter_carousel_sample_app/model/carousel_conatiner_model.dart';
import 'package:flutter_carousel_sample_app/views/detail/detail.dart';
import 'package:flutter_carousel_sample_app/widget/image_container/image_container_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// カルーセルのアイテム表示用Widget
class carouselContainer extends ConsumerWidget {
  final int index;
  final String path;
  final double heightSize;
  final double widthSize;

  const carouselContainer(
      this.index, this.path, this.heightSize, this.widthSize,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // カルーセルコンテンツmodelプロバイダ
    final _carouselContentsProvider = ref.watch(carouselContentsProvider);
    final _carouselContentsProviderNotifier =
        ref.watch(carouselContentsProvider.notifier);

    final _isFavoriteProvider = ref.watch(isFavoriteProvider);
    final _isFavoriteProviderNotifier = ref.watch(isFavoriteProvider.notifier);

    final _favoriteSizeProvider = ref.watch(favoriteSizeProvider);
    final _favoriteSizeProviderNotifier =
        ref.watch(favoriteSizeProvider.notifier);

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
                    image: AssetImage(path),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              onTap: () {
                // 詳細画面へ遷移
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => Detail(
                      'assets/image/IMG_1.jpg',
                      'タイトル', 'サブタイトル',
                      // _carouselContentsProvider[index].url,
                      // _carouselContentsProvider[index].title,
                      // _carouselContentsProvider[index].subTitle,
                    ),
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
                  // _carouselContentsProvider[index].isFavorite
                  _isFavoriteProvider ? Icons.favorite : Icons.favorite_border,
                  // color: _carouselContentsProvider[index].isFavorite
                  color: _isFavoriteProvider ? Colors.red : Colors.white,
                  size: _favoriteSizeProvider,
                ),
              ),
              onTap: () {
                // お気に入りフラグのON/OFF
                _isFavoriteProviderNotifier
                    .update((state) => !_isFavoriteProvider);
              },
            ),
          ],
        ),
        // カルーセルのフッダー
        Container(
          margin: const EdgeInsets.only(left: 10, top: 20),
          child: Text(
            // _carouselContentsProvider[index].title,
            'タイトル',
            style: const TextStyle(fontSize: 20),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, top: 10),
          child: Text(
            // _carouselContentsProvider[index].subTitle,
            'サブタイトル',
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
