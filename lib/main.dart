import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Carousel App')),
      body: SizedBox(
        height: size.width / 2.5,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return _imageContainer('assets/image/IMG_1.jpg');
          },
        ),
      ),
    );
  }

  // カルーセルのアイテム表示用Widget
  Widget _imageContainer(String path) {
    return SizedBox(
      width: 200,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(path)),
          borderRadius: BorderRadius.circular(5),
        ),
        margin: const EdgeInsets.only(left: 15, top: 15),
        child: const Text('Carousel Sample'),
      ),
    );
  }
}
