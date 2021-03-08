import 'package:akilah/presentation/journeys/main/course/take_course_overview.dart';
import 'package:akilah/presentation/journeys/main/profile/courses_profile.dart';
import 'package:akilah/presentation/widgets/take_course_header.dart';
import 'package:flutter/material.dart';

class TakeCourse extends StatefulWidget {

  @override
  _TakeCourseState createState() => _TakeCourseState();
}

class _TakeCourseState extends State<TakeCourse> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: TakeCourseHeader(
                  minExtent: height * 0.4, maxExtent: height * 0.7),
            ),
            SliverFillRemaining(
              child: Column(
                children: [
                  SizedBox(height: 30.0,),
                  Expanded(
                    child: TakeCourseOverview(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
