import 'package:flutter/material.dart';
import 'package:flutter_carousel_sample_app/views/detail/detail.dart';
import 'package:flutter_carousel_sample_app/widget/image_container/image_container_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// カルーセルのアイテム表示用Widget
class carouselContainer extends ConsumerWidget {
  final path;
  final heightSize;
  final widthSize;

  const carouselContainer(this.path, this.heightSize, this.widthSize,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _isFavoriteProvider = ref.watch(isFavoriteProvider);
    final _isFavoriteProviderNotifier = ref.watch(isFavoriteProvider.notifier);

    final _favoriteSizeProvider = ref.watch(favoriteSizeProvider);
    final _favoriteSizeProviderNotifier =
        ref.watch(favoriteSizeProvider.notifier);

    return Column(
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
                        'assets/image/IMG_1.jpg', '検索結果1 タイトル', '検索結果1 サブタイトル'),
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
                  _isFavoriteProvider ? Icons.favorite : Icons.favorite_border,
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
      ],
    );
  }
}
