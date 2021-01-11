import 'package:flutter/material.dart';

import 'package:akilah/presentation/widgets/CTAButton.dart';
import 'package:akilah/presentation/widgets/akilah_text_field.dart';
import 'package:akilah/presentation/widgets/top_banner.dart';
import 'package:akilah/utils/strings.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool hasAcceptedTerms = false;

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
                  height: 120.0,
                  title: registerText,
                  hasBackButton: true,
                  onBackPressed: ()=> Navigator.pop(context),
                ),
                SizedBox(height: 20.0,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        AkilahTextInputField(
                          controller: usernameController,
                          isPhone: false,
                          hintText: 'Enter Username Here',
                          labelText: 'Username',
                          isEnabled: true,
                          isPassword: false,
                        ),
                        AkilahTextInputField(
                          controller: emailController,
                          isPhone: false,
                          hintText: 'Enter Your Email',
                          labelText: 'Email',
                          isEnabled: true,
                          isPassword: false,
                        ),
                        AkilahTextInputField(
                          controller: phoneController,
                          isPhone: true,
                          hintText: 'Enter Your Phone',
                          labelText: 'Phone',
                          isEnabled: true,
                          isPassword: false,
                        ),
                        AkilahTextInputField(
                          controller: passwordController,
                          isPhone: false,
                          hintText: 'Enter Password',
                          labelText: 'Password',
                          isEnabled: true,
                          isPassword: true,
                        ),
                        AkilahTextInputField(
                          controller: confirmPasswordController,
                          isPhone: false,
                          hintText: 'Confirm Password',
                          labelText: 'Confirm Password',
                          isEnabled: true,
                          isPassword: true,
                        ),
                        SizedBox(height: 20.0,),
                        Row(
                          children: [
                            Checkbox(
                              value: hasAcceptedTerms,
                              onChanged: (value)=> setState(()=> hasAcceptedTerms = value),
                              checkColor: Theme.of(context).primaryColor,
                              // activeColor: Theme.of(context).primaryColor,
                            ),
                            RichText(
                              text: TextSpan(
                                text: "I have agreed to ",
                                style: TextStyle(color: Colors.black45, fontSize: 12.0),
                                children: [
                                  TextSpan(
                                    text: 'the Terms and Conditions',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 15.0
                                    )
                                  )
                                ]
                              ),
                              maxLines: 1,
                            )
                          ],
                        ),
                        CTAButton(
                          title: 'Register',
                          width: width,
                          isEnabled: hasAcceptedTerms ? true : false,
                          onPressed: ()=> Navigator.pushNamed(context, verifyRoute),
                        ),
                        SizedBox(height: 20.0,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

}
