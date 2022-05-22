import 'package:flutter_riverpod/flutter_riverpod.dart';

// カルーセルコンテナmodel
class CarouselContainerModel {
  String url;
  String title;
  String subTitle;
  bool isFavorite;

  CarouselContainerModel(
    this.url,
    this.title,
    this.subTitle,
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
      _state = [..._state, _model];
    }
    state = _state;
  }
}