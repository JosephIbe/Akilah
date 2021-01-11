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
    fontSize: 28.0,
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


/**
 *  Text Input Decors
 * **/

const loginInputDecors = InputDecoration(
  border: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF616161), width: 1.0),
  ),

);
