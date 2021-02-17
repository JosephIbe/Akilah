import 'package:akilah/utils/constants.dart';
import 'package:akilah/utils/strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TakeCourseOverview extends StatefulWidget {
  @override
  _TakeCourseOverviewState createState() => _TakeCourseOverviewState();
}

class _TakeCourseOverviewState extends State<TakeCourseOverview> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('\"Cooking at home\" is the new going out', style: kTakeCourseOverviewHeaderTextStyle),
            SizedBox(height: 10.0,),
            Text(takeCourseOverviewText, style: kTakeCourseOverviewTextStyle,),
            Divider(),
            SizedBox(height: 10.0,),
            Text('Requirements', style: kTakeCourseOverviewHeaderTextStyle),
            Container(
              height: 100.0,
              child: ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                  child: Text('Requirement $index', style: kWhatYouWillGetRowTextStyle,),
                ),
              ),
            ),
            Divider(),
            Text('What you will get', style: kTakeCourseOverviewHeaderTextStyle),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.menu, color: Colors.red),
                Text('15 videos included', style: kWhatYouWillGetRowTextStyle,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.star_border_outlined, color: Colors.red),
                Text('Exclusive Learning Materials', style: kWhatYouWillGetRowTextStyle,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.check, color: Colors.red),
                Text('100% Guaranteed', style: kWhatYouWillGetRowTextStyle,),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(),
            ),
            Text('What you will learn', style: kTakeCourseOverviewHeaderTextStyle),
            Container(
              height: 200.0,
              child: ListView.builder(
                itemCount: 7,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return Container(
                    height: 150.0,
                    width: 150.0,
                    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Colors.blueGrey
                    ),
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: 'https://picsum.photos/200',
                          placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
                          errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 10.0,
                          left: 10.0,
                          right: 10.0,
                          child: Text('Photoshop 101', style: kWhatYouWillGetRowTextStyle,)
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

}