import 'package:flutter/material.dart';
import 'package:flutter_carousel_sample_app/widget/image_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Carousel App')),
      body: SizedBox(
        height: size.width / 2.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return ImageContainer('assets/image/IMG_1.jpg', context);
          },
        ),
      ),
    );
  }
}
