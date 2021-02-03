import 'package:flutter/material.dart';

import 'package:akilah/presentation/widgets/CTAButton.dart';
import 'package:akilah/presentation/widgets/top_banner.dart';
import 'package:akilah/utils/constants.dart';
import 'package:akilah/utils/strings.dart';

import 'package:google_fonts/google_fonts.dart';

var width, height;
var _favoritesList = [];

class Favorites extends StatelessWidget {
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
              TopBanner(height: height * 0.16, title: 'Favorites', hasBackButton: false, onBackPressed: (){},),
              _favoritesList.length <= 0 || _favoritesList.isEmpty ? EmptyFavorites() : Container()
            ],
          ),
        ),
      ),
    );
  }
}

class EmptyFavorites extends StatelessWidget {

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
                  'Your Favorite Courses Will Appear Here',
                  style: kBannerTextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0,),
                Text(
                  'Tap the \uF516 bookmark button to have your most preferred courses appear here',
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