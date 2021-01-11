import 'package:akilah/presentation/widgets/top_banner.dart';
import 'package:akilah/utils/strings.dart';
import 'package:flutter/material.dart';

class AppSettings extends StatefulWidget {
  @override
  _AppSettingsState createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          child: Column(
            children: [
              TopBanner(
                title: appSettings,
                height: 120.0,
                hasBackButton: true,
                onBackPressed: ()=> Navigator.pop(context),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

}