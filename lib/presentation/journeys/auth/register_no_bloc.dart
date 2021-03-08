import 'package:akilah/data/repositories/user_repository_impl.dart';
import 'package:akilah/domain/repositories/user_repository.dart';
import 'package:flutter/material.dart';

import 'package:akilah/presentation/widgets/CTAButton.dart';
import 'package:akilah/presentation/widgets/akilah_text_field.dart';
import 'package:akilah/presentation/widgets/top_banner.dart';
import 'package:akilah/utils/strings.dart';
import 'package:akilah/di/get_it.dart' as GetIt;

class RegisterNoBloc extends StatefulWidget {
  @override
  _RegisterNoBlocState createState() => _RegisterNoBlocState();
}

class _RegisterNoBlocState extends State<RegisterNoBloc> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool hasAcceptedTerms;

  double width, height;

  @override
  void initState() {
    super.initState();
    hasAcceptedTerms = false;
  }

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height= MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TopBanner(
                  height: MediaQuery.of(context).size.height * 0.16,
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
                              onChanged: (value) {
                                  print('hasAcceptedTermsVal $hasAcceptedTerms');
                                  setState(()=> hasAcceptedTerms = !hasAcceptedTerms);
                                },
                              checkColor: Theme.of(context).primaryColor,
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
                          onPressed: ()=> Navigator.pushNamed(context, homeRoute),
                          // onPressed: ()=> registerUser(context),
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

  registerUser(BuildContext context) async {

    String un = usernameController.text;
    String email = emailController.text;
    String pwd = passwordController.text;
    String confPwd = confirmPasswordController.text;
    String phone = phoneController.text;

    if(un.isEmpty || email.isEmpty || pwd.isEmpty || confPwd.isEmpty || phone.isEmpty) {
      SnackBar snackBar = SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Enter All Fields Correctly'),
        elevation: 2.0,
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    } else {
      if(confPwd == pwd) {
        print('match');

        Map<String, dynamic> body = {
          "username": un,
          "email": email,
          "password": pwd,
          "confirm_password": confPwd,
          "phone": phone
        };

        UserRepository repository = UserRepositoryImpl(dataSource: GetIt.getItInstance());
        final user = await repository.registerUser(body);
        if(user != null) {
          Navigator.pushNamedAndRemoveUntil(context, homeRoute, (Route<dynamic> route) => false);
        } else {
          print('invalid blablabla');
        }

      } else {
        SnackBar passwordsSnackBar = SnackBar(
          duration: Duration(seconds: 3),
          // width: width,
          content: Text('Passwords Don\'t Match'),
          elevation: 2.0,
        );
        _scaffoldKey.currentState.showSnackBar(passwordsSnackBar);
      }
    }

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
