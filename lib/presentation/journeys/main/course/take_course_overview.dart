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
            Text('About this Course', style: kTakeCourseOverviewHeaderTextStyle),
            SizedBox(height: 10.0,),
            Text('\"Cooking at home\" is the new going out', style: kTakeCourseOverviewHeaderTextStyle),
            SizedBox(height: 10.0,),
            Text(takeCourseOverviewText, style: kTakeCourseOverviewTextStyle,),
            Divider(),
            SizedBox(height: 10.0,),
            Text('Requirements', style: kTakeCourseOverviewHeaderTextStyle),
            Container(
              height: 100.0,
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                spacing: 10.0,
                children: [
                  Chip(label: Text('Oil'), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),),
                  Chip(label: Text('Skillet'), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),),
                  Chip(label: Text('Requirements one'), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),),
                  Chip(label: Text('Requirements two'), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),),
                  Chip(label: Text('Requirements three'), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),),
                ],
              )
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
              height: 150.0,
              child: ListView.builder(
                itemCount: 7,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    child: Container(
                      height: 150.0,
                      width: 150.0,
                      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      decoration: BoxDecoration(
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