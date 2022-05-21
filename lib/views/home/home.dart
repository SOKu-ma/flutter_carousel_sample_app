import 'package:flutter/material.dart';
// import 'package:flutter_carousel_sample_app/views/home/home_view_model.dart';
import 'package:flutter_carousel_sample_app/widget/image_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size _size = MediaQuery.of(context).size;
    // final _carouselContentsProvider = ref.watch(carouselContentsProvider);
    // final _carouselContentsProviderNotifier =
    // ref.watch(carouselContentsProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Carousel App')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 第1カルーセルのヘッダ
              Container(
                margin: const EdgeInsets.only(left: 10, top: 20),
                child: const Text('検索結果', style: TextStyle(fontSize: 16)),
              ),
              // 第1領域
              SizedBox(
                height: _size.height / 4.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Expanded(
                            child: imageContainer('assets/image/IMG_1.jpg',
                                context, _size.height / 4.0),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // 第1カルーセルのフッタ
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  children: const [
                    Text('検索結果', style: TextStyle(fontSize: 16)),
                    Text('検索結果', style: TextStyle(fontSize: 16)),
                    Text('検索結果', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              // 第2領域
            ],
          ),
        ),
      ),
    );
  }
}
