import 'package:akilah/presentation/journeys/auth/forgot_password.dart';
import 'package:akilah/presentation/journeys/auth/login.dart';
import 'package:akilah/presentation/journeys/auth/register.dart';
import 'package:akilah/presentation/journeys/auth/verify.dart';
import 'package:akilah/presentation/journeys/auth/welcome.dart';
import 'package:akilah/presentation/journeys/main/course/course_overview.dart';
import 'package:akilah/presentation/journeys/main/course/take_course.dart';
import 'package:akilah/presentation/journeys/main/course/watch_course.dart';
import 'package:akilah/presentation/journeys/main/home.dart';
import 'package:akilah/presentation/journeys/main/learn/topics.dart';
import 'package:akilah/presentation/journeys/main/profile/profile.dart';
import 'package:akilah/presentation/journeys/main/profile/profile_details.dart';
import 'package:akilah/presentation/journeys/main/settings/app_settings.dart';
import 'package:akilah/utils/strings.dart';
import 'package:flutter/material.dart';

class AkilahRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeRoute:
        return MaterialPageRoute(builder: (_) => Welcome());
        break;
      case loginRoute:
        return MaterialPageRoute(builder: (_) =>
            LoginPage());
        break;
      case registerRoute:
        // return MaterialPageRoute(builder: (_) => RegisterNoBloc());
        return MaterialPageRoute(builder: (_) => RegisterPage());
        break;
      case forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPassword());
        break;
      case verifyOTPRoute:
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
      case topicsRoute:
        return MaterialPageRoute(builder: (_) => Topics());
        break;
      case courseOverviewRoute:
        return MaterialPageRoute(builder: (_) => CourseOverview());
        break;
      case takeCourseRoute:
        return MaterialPageRoute(builder: (_) => TakeCourse());
        break;
      case watchCourseRoute:
        return MaterialPageRoute(builder: (_) => WatchCourse());
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
