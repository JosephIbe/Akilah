import 'package:akilah/utils/constants.dart';
import 'package:akilah/utils/strings.dart';
import 'package:flutter/material.dart';

class PopularCourses extends StatelessWidget {

  final double rating = 3.8;
  final int numVideos = 20;

  final String title = 'Gordon Ramsay';
  final String description = 'Teaches Cooking 1: Cooking is not easy, ask Mr Ramsay,';

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: ()=> Navigator.pushNamed(context, courseOverviewRoute),
      child: Container(
          height: 140.0,
          width: width,
          margin: EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 2.0),
          child: Card(
            child: Row(
              children: [
                Container(
                  width: width * 0.2,
                  height: 140.0,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      image: DecorationImage(
                          image: NetworkImage('https://picsum.photos/200'),
                          fit: BoxFit.cover)
                  ),
                ),
                Expanded(
                  child: Container(
                    width: width * 0.7,
                    height: 140.0,
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                        children: [
                          SizedBox(height: 8.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: kCourseInstructorNameTextStyle,
                              ),
                              Text(
                                '\$49.99',
                                style: kCoursePriceTextStyle,
                              )
                            ],
                          ),
                          SizedBox(height: 8.0,),
                          Text(
                            description,
                            style: kCourseDescTextStyle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 8.0,),
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
                )
              ],
            ),
          ),
      ),
    );
  }
}
