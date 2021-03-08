import 'package:akilah/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:akilah/presentation/widgets/top_banner.dart';
import 'package:akilah/utils/strings.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

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
                title: settings,
                height: height * 0.17,
                hasBackButton: false,
                onBackPressed: null,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(actSettings, style: kSettingsTileTextStyle,),
                      onTap: ()=> Navigator.pushNamed(context, profileDetailsRoute),
                      trailing: Icon(Icons.chevron_right_sharp, color: Colors.black,),
                    ),
                    Divider(),
                    ListTile(
                      title: Text(appSettings, style: kSettingsTileTextStyle,),
                      onTap: ()=> Navigator.pushNamed(context, appSettingsRoute),
                      trailing: Icon(Icons.chevron_right_sharp, color: Colors.black,),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
