import 'package:akilah/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Lessons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: 100.0,
      child: Padding(
        padding: const EdgeInsets.all(4.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: width * 0.4,
              height: 90.0,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(imageUrl: 'https://picsum.photos/200', fit: BoxFit.cover,)
                ],
              ),
            ),
            Container(
              width: width * 0.5,
              height: 90.0,
              constraints: BoxConstraints(
                maxHeight: 90.0
              ),
              child: Column(
                children: [
                  Text('01. Kitchen & Food Safety Lesson Plans', style: kPurchaseStatusTextStyle,),
                  SizedBox(height: 5.0,),
                  Text('The basic terms used when cooking', ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
