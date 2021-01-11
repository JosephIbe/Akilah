import 'package:akilah/utils/constants.dart';
import 'package:flutter/material.dart';

class CTAButton extends StatelessWidget {
  final String title;
  final bool isEnabled;
  final double width;
  final Function onPressed;

  const CTAButton(
      {Key key,
      this.title,
      this.isEnabled,
      this.width,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    // double w = MediaQuery.of(context).size.width;
    return Container(
//      width: w - w * 0.2,
      width: width,
      child: RaisedButton(
        onPressed: isEnabled ? onPressed : null,
        elevation: 2.0,
        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
        color: Color(0xffEDB423),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(title, style: kCTAButtonTextStyle),
      ),
    );
  }
}
