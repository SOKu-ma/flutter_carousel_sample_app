import 'package:flutter/material.dart';
import 'package:flutter_carousel_sample_app/views/detail/detail.dart';

// カルーセルのアイテム表示用Widget
Widget imageContainer(String path, BuildContext context, double heightSize) {
  // return
  // SizedBox(
  //   width: 200,
  //   child:
  return InkWell(
    child: Column(
      children: [
        Stack(
          children: [
            Container(
              height: heightSize,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(path),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Text(
              'aaa',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    ),
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => Detail(),
        ),
      );
    },
  );
}
