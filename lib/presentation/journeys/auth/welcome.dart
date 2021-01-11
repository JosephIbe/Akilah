import 'package:akilah/utils/constants.dart';
import 'package:akilah/utils/strings.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Text(welcomeText, style: kWelcomeTextStyle,),
        ),
      ),
    );
  }
}
