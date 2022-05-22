import 'package:flutter_carousel_sample_app/model/carousel_conatiner_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// カルーセル出力コンテンツ格納用プロバイダー
final carouselContentsProvider = StateNotifierProvider<
    CarouselContainerModelNotifier, List<CarouselContainerModel>>(
  (ref) => CarouselContainerModelNotifier([]),
);
