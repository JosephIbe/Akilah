import 'package:flutter/material.dart';

class PopularCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Container(
        height: 150.0,
        width: width,
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          children: [
            Container(
              width: width * 0.22,
              height: 150.0,
              color: Colors.blueAccent,
            ),
            Container(
              width: width * 0.66,
              height: 150.0,
              color: Colors.brown,
            )
          ],
        ),
    );
  }
}
