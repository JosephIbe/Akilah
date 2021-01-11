import 'package:akilah/presentation/widgets/CTAButton.dart';
import 'package:akilah/presentation/widgets/akilah_text_field.dart';
import 'package:akilah/presentation/widgets/top_banner.dart';
import 'package:akilah/utils/constants.dart';
import 'package:akilah/utils/strings.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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
                TopBanner(height: 120.0, title: loginText, hasBackButton: false, onBackPressed: null,),
                SizedBox(height: 30.0,),
                Container(
                    margin: EdgeInsets.all(25.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AkilahTextInputField(
                            controller: usernameController,
                            isPhone: false,
                            hintText: 'Enter Username or Email',
                            labelText: 'Username',
                            isEnabled: true,
                            isPassword: false,
                          ),
                          AkilahTextInputField(
                            controller: passwordController,
                            isPhone: false,
                            hintText: 'Enter Password',
                            labelText: 'Password',
                            isPassword: true,
                            isEnabled: true,
                          ),
                          SizedBox(height: 20.0,),
                          CTAButton(
                            title: 'Login',
                            width: width,
                            isEnabled: true,
                            onPressed: (){},
                          ),
                          SizedBox(height: 20.0,),
                          GestureDetector(
                            onTap: ()=> Navigator.pushNamed(context, registerRoute),
                            child: Text(
                              registerText, style: kAuthOptionsTextStyle,
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          GestureDetector(
                            onTap: ()=> Navigator.pushNamed(context, forgotPasswordRoute),
                            child: Text(forgotPassword, style: kAuthOptionsTextStyle,),
                          ),
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
    passwordController.dispose();
  }

}
