import 'package:flutter/material.dart';
import 'package:flutter_carousel_sample_app/model/carousel_conatiner_model.dart';
import 'package:flutter_carousel_sample_app/widget/image_container/image_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size _size = MediaQuery.of(context).size;
    final _carouselContentsProvider = ref.watch(carouselContentsProvider);
    final _carouselContentsProviderNotifier =
        ref.watch(carouselContentsProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ヘッダ
              Container(
                margin: const EdgeInsets.only(left: 10, top: 20, bottom: 10),
                child: const Text('検索結果',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              // カルーセルコンテナ
              SizedBox(
                height: _size.height / 3.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Expanded(
                            child: carouselContainer(
                              index,
                              'assets/image/IMG_1.jpg',
                              _size.height / 5.0,
                              _size.width / 1.5,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
