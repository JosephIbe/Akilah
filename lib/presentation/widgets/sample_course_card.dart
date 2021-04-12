import 'package:akilah/utils/constants.dart';
import 'package:akilah/utils/strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SampleCourseCard extends StatelessWidget {

  final double rating = 3.8;
  final int numVideos = 20;

  final String title = 'Gordon Ramsay';
  final String description = 'Teaches Cooking 1: Cooking is not easy, ask Mr Ramsay,';

  double width, height;

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: ()=> Navigator.pushNamed(context, courseOverviewRoute),
      child: Container(
        height: height * 0.42,
        margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0),
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.07),
              child: Material(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (context, index) => Card(
                      child: Container(
                        height: height * 0.3,
                        width: width * 0.75,
                        margin: EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(
                            // color: Colors.blue,
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
                        ),
                    ),
                    ),
              ),
            ),
            Positioned(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildSectionHeader(title: 'Popular Courses', viewAll: 'View All'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildSectionHeader({String title, String viewAll}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.3,
                    color: Colors.black54)),
          ),
          Text(
            viewAll,
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.3,
                    color: Colors.black54)),
          ),
        ],
      ),
    );
  }

}