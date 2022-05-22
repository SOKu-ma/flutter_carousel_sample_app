import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Detail extends ConsumerWidget {
  final String url;
  final String title;
  final String subTitle;
  const Detail(this.url, this.title, this.subTitle, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // サムネイル
            SizedBox(
              height: 220,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity / 3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(url),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                    ),
                  ),
                ],
              ),
            ),
            // タイトル
            Container(
              margin: const EdgeInsets.only(left: 10, top: 20),
              width: double.infinity,
              color: Colors.white,
              child: Text(
                title,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            // サブタイトル
            Container(
              margin: const EdgeInsets.only(left: 10, top: 10),
              width: double.infinity,
              color: Colors.white,
              child: Text(
                title,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
