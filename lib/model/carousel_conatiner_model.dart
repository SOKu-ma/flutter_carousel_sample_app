import 'package:flutter_carousel_sample_app/db/test_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// カルーセル出力コンテンツ格納用プロバイダー
final carouselContentsProvider = StateNotifierProvider<
    CarouselContainerModelNotifier, List<CarouselContainerModel>>(
  (ref) => CarouselContainerModelNotifier([
    // テストデータ
    CarouselContainerModel(1, img1_url, img1_title, img1_subTitle,
        img1_detailText, img1_isFavorite),
    CarouselContainerModel(2, img2_url, img2_title, img2_subTitle,
        img2_detailText, img2_isFavorite),
    CarouselContainerModel(3, img3_url, img3_title, img3_subTitle,
        img3_detailText, img3_isFavorite),
  ]),
);

// カルーセルコンテナmodel
class CarouselContainerModel {
  int id;
  String url;
  String title;
  String subTitle;
  String detailText;
  bool isFavorite;

  CarouselContainerModel(
    this.id,
    this.url,
    this.title,
    this.subTitle,
    this.detailText,
    this.isFavorite,
  );
}

class CarouselContainerModelNotifier
    extends StateNotifier<List<CarouselContainerModel>> {
  CarouselContainerModelNotifier(List<CarouselContainerModel> state)
      : super(state);

  // お気に入りフラグの切替メソッド
  void cheaked(bool value, int index) {
    List<CarouselContainerModel> _state = [];
    for (final _model in state) {
      if (_model.id - 1 == index) {
        _model.isFavorite = value;
      }
      _state = [..._state, _model];
    }
    state = _state;
  }
}
