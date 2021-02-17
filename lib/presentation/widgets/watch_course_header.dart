import 'package:akilah/presentation/widgets/akilah_video_player.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:akilah/utils/constants.dart';
import 'package:akilah/utils/strings.dart';

class WatchCourseHeader implements SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;

  WatchCourseHeader({this.minExtent, this.maxExtent});

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    double width = MediaQuery
        .of(context)
        .size
        .width;

    return Material(
      color: Colors.blueGrey[300],
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0)),
        child: Stack(
          children: [
            AkilahVideoPlayer(),
            Positioned(
              top: 0.0,
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 4.0),
                child: IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    color: Theme
                        .of(context)
                        .primaryColor,
                    size: 45.0,
                  ),
                  onPressed: () =>
                      Navigator.pushNamedAndRemoveUntil(context, homeRoute, (Route<dynamic> route) => false),
                ),
              ),
            ),
          ],
        ),
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
