import 'package:flutter/material.dart';

import 'package:akilah/presentation/widgets/top_banner.dart';
import 'package:akilah/presentation/widgets/otp_input.dart';
import 'package:akilah/utils/constants.dart';
import 'package:akilah/utils/strings.dart';

class VerifyOTP extends StatefulWidget {
  @override
  _VerifyOTPState createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height= MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TopBanner(
                  height: MediaQuery.of(context).size.height * 0.19,
                  title: enter6DigitCode,
                  hasBackButton: true,
                  onBackPressed: ()=> Navigator.pop(context),
                ),
                SizedBox(height: 30.0,),
                Container(
                  margin: EdgeInsets.all(25.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text(
                          'The verification code was sent to the phone number +234XXXXXXXXXX. Please enter the code',
                          style: kVerificationCodePromptTextStyle,
                        ),
                        SizedBox(height: 25.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OTPInput(),
                            OTPInput(),
                            OTPInput(),
                            OTPInput(),
                            OTPInput(),
                            OTPInput(),
                          ],
                        ),
                        SizedBox(height: 25.0,),
                        GestureDetector(
                          // onTap: ()=> Navigator.popAndPushNamed(context, homeRoute),
                          onTap: ()=> Navigator.pushNamedAndRemoveUntil(
                            context, homeRoute, (Route<dynamic> route) => false
                          ),
                          child: Text(
                            'Skip To Home Page',
                            style: kVerificationCodePromptTextStyle,
                          ),
                        ),
                      ],
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
