import 'package:flutter/material.dart';
import 'package:flutter_carousel_sample_app/views/detail/detail.dart';

// カルーセルのアイテム表示用Widget
Widget ImageContainer(String path, BuildContext context) {
  return SizedBox(
    width: 200,
    child: InkWell(
      child: Container(
        child: Column(children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(path)),
                borderRadius: BorderRadius.circular(5),
              ),
              margin: const EdgeInsets.only(left: 15, top: 15),
              // child: const Text('Carousel Sample'),
            ),
          ),
          // Expanded(
          //   child: Container(
          //     margin: const EdgeInsets.only(left: 15, top: 15),
          //     // child: const Text('Carousel Sample'),
          //   ),
          // ),
        ]),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => Detail(),
          ),
        );
      },
    ),
  );
}
