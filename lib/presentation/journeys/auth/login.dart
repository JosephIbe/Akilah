import 'package:akilah/domain/repositories/user_repository.dart';
import 'package:akilah/presentation/blocs/authentication/auth.dart';
import 'package:akilah/presentation/blocs/login/login.dart';
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
              if (state is AuthenticationStateUnAuthenticated) {
                return _AuthForm();
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
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              );
            },
          )),
    );
  }
}

class _AuthForm extends StatelessWidget {
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

      if (_formKey.currentState.validate()) {
        _loginBloc.add(LoginWithEmail(body: body));
        print('Login state is $state');
      } else {
        setState(() {
          _autoValidate = true;
        });
      }
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginStateFailure) {
          _showError(state.errorMessage);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginStateLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // return Form(
          //   key: _key,
          //   autovalidateMode: _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
          //   child: SingleChildScrollView(
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.stretch,
          //       children: <Widget>[
          //         TextFormField(
          //           decoration: InputDecoration(
          //             labelText: 'Email address',
          //             filled: true,
          //             isDense: true,
          //           ),
          //           controller: _emailController,
          //           keyboardType: TextInputType.emailAddress,
          //           autocorrect: false,
          //           validator: (value) {
          //             if (value == null) {
          //               return 'Email is required.';
          //             }
          //             return null;
          //           },
          //         ),
          //         SizedBox(
          //           height: 12,
          //         ),
          //         TextFormField(
          //           decoration: InputDecoration(
          //             labelText: 'Password',
          //             filled: true,
          //             isDense: true,
          //           ),
          //           obscureText: true,
          //           controller: _passwordController,
          //           validator: (value) {
          //             if (value == null) {
          //               return 'Password is required.';
          //             }
          //             return null;
          //           },
          //         ),
          //         const SizedBox(
          //           height: 16,
          //         ),
          //         RaisedButton(
          //           color: Theme.of(context).primaryColor,
          //           textColor: Colors.white,
          //           padding: const EdgeInsets.all(16),
          //           shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),
          //           child: Text('LOG IN'),
          //           onPressed: state is LoginStateLoading ? () {} : _onLoginButtonPressed,
          //         )
          //       ],
          //     ),
          //   ),
          // );
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
    emailController.dispose();
    passwordController.dispose();
  }

}