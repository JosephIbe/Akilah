import 'package:flutter/material.dart';

import 'package:akilah/presentation/widgets/CTAButton.dart';
import 'package:akilah/presentation/widgets/akilah_text_field.dart';
import 'package:akilah/presentation/widgets/top_banner.dart';
import 'package:akilah/utils/strings.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final emailController = TextEditingController();
  final newPasswordController = TextEditingController();
  final newPasswordController2 = TextEditingController();

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TopBanner(
                  height: 120.0,
                  title: forgotPassword,
                  hasBackButton: true,
                  onBackPressed: ()=> Navigator.pop(context),
                ),
                SizedBox(height: 20.0,),
                Container(
                  margin: EdgeInsets.all(25.0),
                  child: Form(
                    child: Column(
                      children: [
                        Text('Enter Your Email to Reset Your Password'),
                        SizedBox(height: 20.0,),
                        AkilahTextInputField(
                          labelText: 'Email',
                          hintText: 'Email or Username',
                          isPhone: false,
                          isEnabled: true,
                          controller: emailController,
                          isPassword: false,
                        ),
                        SizedBox(height: 20.0,),
                        AkilahTextInputField(
                          labelText: 'Password',
                          hintText: 'New Password',
                          isPassword: true,
                          isEnabled: true,
                          isPhone: false,
                          controller: newPasswordController,
                        ),
                        SizedBox(height: 20.0,),
                        AkilahTextInputField(
                          labelText: 'Confirm Password',
                          hintText: 'Confirm New Password',
                          isPassword: true,
                          isEnabled: true,
                          isPhone: false,
                          controller: newPasswordController2,
                        ),
                        SizedBox(height: 20.0,),
                        CTAButton(
                          title: 'Recover Account',
                          width: MediaQuery.of(context).size.width,
                          onPressed: (){},
                          isEnabled: false,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        )
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    newPasswordController.dispose();
    newPasswordController2.dispose();
  }

}
