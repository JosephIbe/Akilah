import 'package:akilah/presentation/widgets/home_banner.dart';
import 'package:akilah/presentation/widgets/sample_course_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeMain extends StatelessWidget {
  double width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

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
                Container(
                  height: height * 0.3,
                  width: width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: Swiper(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      autoplay: false,
                      pagination: SwiperPagination(alignment: Alignment.bottomCenter),
                      itemBuilder: (BuildContext context, int index){
                        return Container(
                          height: 185.0,
                          margin: EdgeInsets.all(10.0),
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
                ),
                // SizedBox(height: 30.0,),
                SampleCourseCard(),
                SampleCourseCard(),
                SampleCourseCard(),
                SampleCourseCard(),
                SampleCourseCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
