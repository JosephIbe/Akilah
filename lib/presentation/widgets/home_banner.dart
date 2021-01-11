import 'package:flutter/material.dart';
import 'package:akilah/utils/constants.dart';
import 'package:akilah/utils/strings.dart';

class HomeBanner extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          height: 120.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  stops: [0, 0.5, 0.75],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xffffc226), Color(0xffEDB423), Color(0xffFFCF54)],
                  tileMode: TileMode.clamp)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 45.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Home', style: kBannerTextStyle,),
                  GestureDetector(
                    onTap: ()=> Navigator.pushNamed(context, profileRoute),
                    child: Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(Icons.person, color: Theme.of(context).accentColor, size: 45.0,),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

}
