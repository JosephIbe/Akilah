import 'package:akilah/presentation/widgets/sample_course_card.dart';
import 'package:akilah/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'course_in_category.dart';

double width, height;

class CoursesProfile extends StatefulWidget {
  @override
  _CoursesProfileState createState() => _CoursesProfileState();
}

class _CoursesProfileState extends State<CoursesProfile>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30.0,
        ),
        _buildSectionHeader(title: 'Your Courses'),
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
            isScrollable: true,
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            indicator: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(
                20.0,
              ),
            ),
            tabs: [
              Tab(
                text: 'Business',
              ),
              Tab(
                text: 'Language',
              ),
              Tab(
                text: 'Animation',
              ),
              Tab(
                text: 'Career Goals',
              ),
              // Tab(text: 'Business3',),
              Tab(
                text: 'Personal Development',
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  CourseInCategory(),
                  CourseInCategory(),
                  CourseInCategory(),
                ],
              ),
              DummyWidget(),
              ListView(
                shrinkWrap: true,
                children: [
                  CourseInCategory(),
                  CourseInCategory(),
                  CourseInCategory(),
                ],
              ),
              DummyWidget(),
              ListView(
                shrinkWrap: true,
                children: [
                  CourseInCategory(),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}

 _buildSectionHeader({String title}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
    child: Text(
      title,
      style: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.3,
              color: Colors.black)),
    ),
  );
}

class DummyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.width;

    return Expanded(
        flex: 1,
        child: Container(
            padding: EdgeInsets.all(15.0),
            width: width,
            height: height * 0.82,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You have no enrollments in this category',
                    style: kBannerTextStyle,
                    textAlign: TextAlign.center,
                  )
                ]
              ),
            )
        )
    );
  }
}
