import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/**
 *  Font Styles
 * **/

var kWelcomeTextStyle = GoogleFonts.openSans(
    textStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w300,
      fontSize: 25.0,
      letterSpacing: 0.5,
    )
);

var kBannerTextStyle = GoogleFonts.lato(
    textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26.0,
        color: Colors.black
    )
);

var kAppbarTextStyle = GoogleFonts.lato(
    textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        color: Colors.black
    )
);

var kCTAButtonTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        color: Colors.black
    )
);

var kAuthOptionsTextStyle = GoogleFonts.lato(
    textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15.0,
        color: Color(0xff7981db)
    )
);

var kVerificationCodePromptTextStyle = GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.3,
        color: Color(0xffADADAD)
    )
);

var kSettingsTileTextStyle = GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
        color: Colors.black
    )
);

var kLogOutTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: Colors.red,
    )
);

var kCourseInstructorNameTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    )
);

var kCoursePriceTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.bold,
      color: Colors.redAccent,
    )
);

var kCourseDescTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Colors.blueGrey,
    )
);

var kCourseRatingTextStyle = GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w700,
      color: Colors.grey,
    )
);

var kCourseNumVideosTextStyle = GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w700,
      color: Colors.black87,
    )
);

var kTopicItemTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: Colors.blueGrey,
    )
);

var kCourseDetailsInstructorNameTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: Color(0xffffc226),
    )
);

var kPurchasePlanTypeTextStyle = GoogleFonts.openSans(
  textStyle: TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    color: Colors.deepPurple
  )
);

var kPurchasePlanDescriptionTextStyle = GoogleFonts.basic(
  textStyle: TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w300,
    color: Colors.grey
  )
);

var kPurchasePlanPriceTextStyle = GoogleFonts.openSans(
  textStyle: TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.w800,
    color: Colors.deepPurple[900]
  )
);

var kPurchasePlanButtonTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    )
);

var kPurchaseStatusTextStyle = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w400,
    color: Color(0xffffc226),
  )
);

var kTakeCourseDescTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    )
);

var kTakeCourseNumVideosTextStyle = GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.bold,
      color: Colors.blueAccent,
    )
);

/**
 *  Text Input Decors
 * **/

const loginInputDecors = InputDecoration(
  border: UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF616161), width: 1.0),
  ),

);
