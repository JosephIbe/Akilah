import 'package:akilah/presentation/journeys/auth/login.dart';
import 'package:akilah/presentation/journeys/main/profile/profile_details.dart';
import 'package:akilah/utils/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Akilah',
      theme: ThemeData(
        primaryColor: Color(0xffffc226),
        accentColor: Colors.blueAccent[100],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(),
      // home: ProfileDetails(),
      onGenerateRoute: AkilahRouter.generateRoute,
    );
  }
}