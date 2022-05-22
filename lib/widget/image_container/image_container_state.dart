import 'package:flutter_riverpod/flutter_riverpod.dart';

// お気に入りフラグ
final isFavoriteProvider = StateProvider(
  (ref) => false,
);
// お気に入りフラグのサイズ
final favoriteSizeProvider = StateProvider<double>(
  (ref) => 30,
);
