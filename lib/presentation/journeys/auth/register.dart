import 'package:akilah/presentation/widgets/CTAButton.dart';
import 'package:akilah/presentation/widgets/akilah_text_field.dart';
import 'package:akilah/presentation/widgets/top_banner.dart';
import 'package:akilah/utils/strings.dart';
import 'package:flutter/material.dart';

import 'package:akilah/domain/repositories/user_repository.dart';
import 'package:akilah/presentation/blocs/authentication/auth.dart';
import 'package:akilah/presentation/blocs/register/register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _scaffoldKey = GlobalKey<ScaffoldState>();

class RegisterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            final authBloc = BlocProvider.of<AuthenticationBloc>(context);

            if(state is AuthenticationStateUnAuthenticated) {
              return _RegisterForm();
            }
            if (state is AuthenticationStateFailure) {
              return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(state.errorMessage),
                      FlatButton(
                        textColor: Theme.of(context).primaryColor,
                        child: Text('Retry'),
                        onPressed: () {
                          authBloc.add(AppStarted());
                        },
                      )
                    ],
                  ));
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final authService = RepositoryProvider.of<UserRepository>(context);
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Container(
      alignment: Alignment.center,
      child: BlocProvider<RegisterBloc>(
        create: (context) => RegisterBloc(authBloc, authService),
        child: _RegisterFormPage(),
      ),
    );
  }
}

class _RegisterFormPage extends StatefulWidget {
  @override
  __RegisterFormPageState createState() => __RegisterFormPageState();
}

class __RegisterFormPageState extends State<_RegisterFormPage> {

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
    height = MediaQuery.of(context).size.height;

    _onRegisterButtonPressed() {

      Map<String, dynamic> body = {
        "username": usernameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "confirm_password": confirmPasswordController.text,
        "phone": phoneController.text
      };

      BlocProvider.of<RegisterBloc>(context).add(RegisterWithEmail(body: body));

    }

    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state){
        if(state is RegisterStateFailure) {
          _showError(state.errorMessage);
        }
        if (state is RegisterStateSuccess) {
          Navigator.pushNamedAndRemoveUntil(context, homeRoute, (Route<dynamic> route) => false);
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          if (state is RegisterStateLoading) {
            return Center(child: CircularProgressIndicator(),);
          }
          return Container(
            width: width,
            height: height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TopBanner(
                    height: MediaQuery.of(context).size.height * 0.17,
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
                            onPressed: ()=> state is RegisterStateLoading ? (){} : _onRegisterButtonPressed(),
                          ),
                          SizedBox(height: 20.0,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showError(String error) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(error),
      backgroundColor: Theme.of(context).errorColor,
    ));
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