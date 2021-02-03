import 'package:akilah/presentation/journeys/main/profile/courses_profile.dart';
import 'package:flutter/material.dart';

class TakeCourseOverview extends StatefulWidget {
  @override
  _TakeCourseOverviewState createState() => _TakeCourseOverviewState();
}

class _TakeCourseOverviewState extends State<TakeCourseOverview>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        // shrinkWrap: true,
      mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox( height: 30.0, ),
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
          )
        ]
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

}
