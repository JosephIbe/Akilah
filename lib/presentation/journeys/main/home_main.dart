import 'package:akilah/presentation/widgets/home_banner.dart';
import 'package:akilah/presentation/widgets/popular_courses_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeBanner(),
                SizedBox(height: 30.0,),
                _buildSectionHeader(title: 'New Additions'),
                Container(
                  height: 200.0,
                  width: width,
                  color: Colors.white10,
                ),
                SizedBox(height: 30.0,),
                _buildSectionHeader(title: 'Popular Courses'),
                PopularCourses(),
                PopularCourses(),
                PopularCourses(),
                PopularCourses(),
                PopularCourses(),
                SizedBox(height: 30.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildSectionHeader({String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
      child: Text(
        title,
        style: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.3,
              color: Colors.black
          )
        ),
      ),
    );
  }

}