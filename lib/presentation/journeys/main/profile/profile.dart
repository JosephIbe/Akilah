import 'package:akilah/presentation/journeys/main/profile/courses_profile.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 140.0,
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          stops: [0, 0.5, 0.75],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xffffc226),
                            Color(0xffEDB423),
                            Color(0xffFFCF54)
                          ],
                          tileMode: TileMode.clamp)
                  ),
                  child: Stack(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 35.0,
                        ),
                        onPressed: ()=> Navigator.pop(context)
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: CoursesProfile()
                )
              ],
            ),
            Positioned(
              top: 98.0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle
                      ),
                    ),
                    Stack(
                      children: [
                        Positioned(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('John Doe', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),),
                                Text('All Access ', style: TextStyle(fontSize: 13.0),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}