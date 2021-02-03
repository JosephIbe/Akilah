import 'package:akilah/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:akilah/utils/constants.dart';

class TakeCourseHeader implements SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;

  TakeCourseHeader({this.minExtent, this.maxExtent});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {

    double width = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.blue[100],
                image: DecorationImage(
                    image: NetworkImage('https://picsum.photos/200'),
                    fit: BoxFit.cover)
            ),
          ),
          Positioned(
            top: 16.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 4.0),
              child: IconButton(
                icon: Icon(
                  Icons.chevron_left,
                  color: Theme.of(context).primaryColor,
                  size: 45.0,
                ),
                onPressed: () => Navigator.pushReplacementNamed(context, homeRoute),
              ),
            ),
          ),
          Positioned(
            left: 16.0,
            right: 16.0,
            bottom: 16.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Gordon Ramsay', style: kCourseDetailsInstructorNameTextStyle,),
                      SizedBox(width: 30.0,),
                      Container(
                        width: width * 0.22,
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).primaryColor, width: 1.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3.5),
                          child: Text('Purchased', style: kPurchaseStatusTextStyle,),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text('3.8:', style: kPurchaseStatusTextStyle,),
                          Text('\u2b50s', style: kPurchaseStatusTextStyle,)
                        ],
                      ),
                      SizedBox(width: 30.0,),
                      Text('15 videos', style: kTakeCourseNumVideosTextStyle,)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ConstrainedBox(
                        child: Text('Teaches cooking II: Restaurant recipes at home', style: kTakeCourseDescTextStyle,),
                        constraints: BoxConstraints(
                          maxWidth: width * 0.7
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 4.0, 0.0, 0.0),
                        child: IconButton(
                          icon: Icon(Icons.bookmark_border_outlined, color: Colors.white, size: 30.0,),
                          onPressed: (){},
                        ),
                      )
                    ]
                  ),
                  ButtonTheme(
                    minWidth: width,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: ()=> {},
                      elevation: 2.0,
                      color: Theme.of(context).primaryColor,
                      padding: EdgeInsets.all(4.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      child: Text('Watch This Course', style: kPurchasePlanButtonTextStyle,),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  ButtonTheme(
                    minWidth: width,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: ()=> {},
                      elevation: 2.0,
                      color: Colors.lightBlueAccent[100],
                      padding: EdgeInsets.all(4.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      child: Text('Watch Trailer', style: kPurchasePlanButtonTextStyle,),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration =>
      null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;

  @override
  TickerProvider get vsync => null;
}
