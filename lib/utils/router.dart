import 'package:akilah/presentation/journeys/main/settings/app_settings.dart';
import 'package:flutter/material.dart';

import 'package:akilah/presentation/journeys/auth/forgot_password.dart';
import 'package:akilah/presentation/journeys/auth/login.dart';
import 'package:akilah/presentation/journeys/auth/register.dart';
import 'package:akilah/presentation/journeys/auth/verify.dart';
import 'package:akilah/presentation/journeys/auth/welcome.dart';
import 'package:akilah/presentation/journeys/main/home.dart';
import 'file:///E:/FlutterProjects/akilah/lib/presentation/journeys/main/profile/profile.dart';
import 'file:///E:/FlutterProjects/akilah/lib/presentation/journeys/main/profile/profile_details.dart';
import 'package:akilah/utils/strings.dart';

class AkilahRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeRoute:
        return MaterialPageRoute(builder: (_) => Welcome());
        break;
      case loginRoute:
        return MaterialPageRoute(builder: (_) => Login());
        break;
      case registerRoute:
        return MaterialPageRoute(builder: (_) => Register());
        break;
      case forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPassword());
        break;
      case verifyRoute:
        return MaterialPageRoute(builder: (_) => VerifyOTP());
        break;
      case homeRoute:
        return MaterialPageRoute(builder: (_) => Home());
        break;
      case profileRoute:
        return MaterialPageRoute(builder: (_) => Profile());
        break;
      case profileDetailsRoute:
        return MaterialPageRoute(builder: (_) => ProfileDetails());
        break;
      case appSettingsRoute:
        return MaterialPageRoute(builder: (_) => AppSettings());
        break;
      // case splashRoute:
      //   return MaterialPageRoute(builder: (_)=> Splash());
      //   break;
      // case otpRoute:
      //   var arguments = settings.arguments;
      //   return MaterialPageRoute(builder: (_)=> GetOTP(arguments: arguments));
      //   break;
      // case homeRoute:
      //   return MaterialPageRoute(builder: (_)=> Home());
      //   break;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route specified for ${settings.name}'),
                  ),
                ));
    }
  }
}
