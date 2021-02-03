import 'package:akilah/presentation/journeys/main/course_details/take_course_overview.dart';
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
                  minExtent: height * 0.5, maxExtent: height * 0.7),
            ),
            SliverFillRemaining(
              child: Column(
                children: [
                  Container(
                    height: 40.0,
                    margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    width: MediaQuery.of(context).size.width,
                    constraints: BoxConstraints(minWidth: 170.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicator: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      tabs: [
                        Tab(text: 'Overview',),
                        Tab(text: 'Lessons',),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        DummyWidget(),
                        DummyWidget(),
                      ],
                    ),
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
