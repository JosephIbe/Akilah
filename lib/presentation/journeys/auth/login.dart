import 'package:akilah/domain/repositories/user_repository.dart';
import 'package:akilah/presentation/blocs/authentication/auth.dart';
import 'package:akilah/presentation/blocs/login/login.dart';
import 'package:akilah/presentation/journeys/main/home.dart';
import 'package:akilah/presentation/widgets/CTAButton.dart';
import 'package:akilah/presentation/widgets/akilah_text_field.dart';
import 'package:akilah/presentation/widgets/top_banner.dart';
import 'package:akilah/utils/constants.dart';
import 'package:akilah/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {

              final authBloc = BlocProvider.of<AuthenticationBloc>(context);

              print(state);

              if(state is AuthenticationStateAuthenticated) {
                return Home();
              }

              if (state is AuthenticationStateUnAuthenticated) {
                return _LoginForm();
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
              // return splash screen
              // return Center(
              //   child: CircularProgressIndicator(
              //     strokeWidth: 2,
              //   ),
              // );
              return _LoginForm();
            },
          )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final authService = RepositoryProvider.of<UserRepository>(context);
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Container(
      alignment: Alignment.center,
      child: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(authBloc, authService),
        child: _SignInForm(),
      ),
    );
  }
}

class _SignInForm extends StatefulWidget {
  @override
  __SignInFormState createState() => __SignInFormState();
}

class __SignInFormState extends State<_SignInForm> {

  final  _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _autoValidate = false;

  double width, height;

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    final _loginBloc = BlocProvider.of<LoginBloc>(context);

    _onLoginButtonPressed(LoginState state) {

      Map<String, dynamic> body = {
        "email": emailController.text,
        "password": passwordController.text
      };

      _loginBloc.add(LoginWithEmail(body: body));
      print('Login state is $state');

    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        print('LoginState Listened is:\t$state');
        if (state is LoginStateFailure) {
          _showError(state.errorMessage);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          print('LoginState Building is:\t$state');
          if (state is LoginStateLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            width: width,
            height: height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TopBanner(
                    height: MediaQuery.of(context).size.height * 0.16,
                    title: loginText,
                    hasBackButton: false,
                    onBackPressed: null,
                  ),
                  SizedBox(height: 30.0,),
                  Container(
                    margin: EdgeInsets.all(25.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AkilahTextInputField(
                            controller: emailController,
                            isPhone: false,
                            hintText: 'Email Address',
                            labelText: 'Email',
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
                            onPressed: ()=> state is LoginStateLoading
                                ? (){}
                                : _onLoginButtonPressed(state),
                          ),
                          SizedBox(height: 30.0,),
                          GestureDetector(
                            onTap: ()=> Navigator.pushNamed(context, registerRoute),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                registerText, style: kAuthOptionsTextStyle,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          GestureDetector(
                            onTap: ()=> Navigator.pushNamed(context, forgotPasswordRoute),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(forgotPassword, style: kAuthOptionsTextStyle,),
                            ),
                          ),
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
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(error),
      backgroundColor: Theme.of(context).errorColor,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

}