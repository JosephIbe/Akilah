import 'package:akilah/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CourseInCategory extends StatelessWidget {

  final double rating = 3.8;
  final int numVideos = 20;

  final String title = 'Gordon Ramsay';
  final String description = 'Teaches Cooking 1: Cooking is not easy, ask Mr Ramsay,';

  double width, height;

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.3,
      width: width,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), topLeft: Radius.circular(10.0)),
              child: CachedNetworkImage(imageUrl: 'https://picsum.photos/200', fit: BoxFit.cover, height: height * 0.15, width: width,)
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: kCourseInstructorNameTextStyle,
                ),
                SizedBox(height: 4.0,),
                Text(
                  '\$49.99',
                  style: kCoursePriceTextStyle,
                ),
                Text(
                  description,
                  style: kCourseDescTextStyle,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
                SizedBox(height: 4.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Rating:\t $rating', style: kCourseRatingTextStyle,),
                    Text('$numVideos videos', style: kCourseNumVideosTextStyle,)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
