import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:akilah/utils/constants.dart';

class CourseOverviewHeader implements SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;

  CourseOverviewHeader({this.minExtent, this.maxExtent});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
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
                onPressed: () => Navigator.pop(context),
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
                  Text('Gordon Ramsay', style: kCourseDetailsInstructorNameTextStyle,),
                  Text('Teaches cooking II: Restaurant recipes at home', style: kCourseDescTextStyle,),
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
