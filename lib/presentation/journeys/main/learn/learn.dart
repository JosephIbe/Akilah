import 'package:akilah/presentation/journeys/main/learn/ongoing_courses.dart';
import 'package:akilah/presentation/widgets/CTAButton.dart';
import 'package:akilah/utils/constants.dart';
import 'package:akilah/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var width, height;
var _coursesList = [];

class Learn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          child: Column(
            children: [
              LearnBanner(),
              _coursesList.length <= 0 || _coursesList.isEmpty ? EmptyMyCoursesPage() : OnGoingCourses()
            ],
          ),
        ),
      ),
    );
  }
}

class LearnBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          height: MediaQuery.of(context).size.height * 0.16,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  stops: [0, 0.5, 0.75],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xffffc226), Color(0xffEDB423), Color(0xffFFCF54)],
                  tileMode: TileMode.clamp)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                SizedBox(height: 15.0,),
                GestureDetector(
                  onTap: ()=> Navigator.pushNamed(context, topicsRoute),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Topics',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0
                            )
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black45,),
                    ],
                  ),
                ),
              SizedBox(height: 15.0,),
              Text("My Akilah", style: kBannerTextStyle,)
            ],
          ),
        ));
  }
}

class EmptyMyCoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.all(15.0),
          width: width,
          height: height * 0.82,
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You Haven\'t Enrolled in any Courses (Yet)',
                  style: kBannerTextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15.0,),
                Text(
                  'Start by enrolling in a course and learn something new now',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0
                      )
                  ),
                ),
                SizedBox(height: 15.0,),
                CTAButton(
                  width: width,
                  isEnabled: true,
                  title: 'Explore Courses',
                  onPressed: ()=> Navigator.pushNamed(context, homeRoute),
                )
              ],
            ),
          ),
        )
    );
  }
}
