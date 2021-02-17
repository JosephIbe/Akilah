import 'package:akilah/presentation/widgets/home_banner.dart';
import 'package:akilah/presentation/widgets/popular_courses_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
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
                  child: Swiper(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    autoplay: false,
                    pagination: SwiperPagination(alignment: Alignment.bottomCenter),
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        height: 185.0,
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: "https://picsum.photos/200",
                          placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
                          errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
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