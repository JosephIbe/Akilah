import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursesProfile extends StatefulWidget {
  @override
  _CoursesProfileState createState() => _CoursesProfileState();
}

class _CoursesProfileState extends State<CoursesProfile> with SingleTickerProviderStateMixin{

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
        SizedBox(height: 30.0,),
        _buildSectionHeader(title: 'Your Courses'),
        Container(
          height: 40.0,
          margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          width: MediaQuery.of(context).size.width,
          constraints: BoxConstraints(
            minWidth: 170.0
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20.0,),
          ),
          child: TabBar(
            isScrollable: true,
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            indicator: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20.0,),
            ),
            tabs: [
              Tab(text: 'Business',),
              Tab(text: 'Language',),
              Tab(text: 'Animation',),
              Tab(text: 'Career Goals',),
              // Tab(text: 'Business3',),
              Tab(text: 'Personal Development',),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              DummyWidget(),
              DummyWidget(),
              DummyWidget(),
              DummyWidget(),
              DummyWidget(),
              // DummyWidget(),
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
              color: Colors.black
          )
      ),
    ),
  );
}

class DummyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return ListView(
      children: [
        Container(
          height: 120.0,
          width: width,
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            children: [
              Container(
                width: width * 0.22,
                height: 150.0,
                color: Colors.blueAccent,
              ),
              Container(
                width: width * 0.66,
                height: 150.0,
                color: Colors.brown,
              )
            ],
          ),
        ),
        Container(
          height: 120.0,
          width: width,
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            children: [
              Container(
                width: width * 0.22,
                height: 150.0,
                color: Colors.blueAccent,
              ),
              Container(
                width: width * 0.66,
                height: 150.0,
                color: Colors.brown,
              )
            ],
          ),
        ),
        Container(
          height: 120.0,
          width: width,
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            children: [
              Container(
                width: width * 0.22,
                height: 150.0,
                color: Colors.blueAccent,
              ),
              Container(
                width: width * 0.66,
                height: 150.0,
                color: Colors.brown,
              )
            ],
          ),
        ),
        Container(
          height: 120.0,
          width: width,
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            children: [
              Container(
                width: width * 0.22,
                height: 150.0,
                color: Colors.blueAccent,
              ),
              Container(
                width: width * 0.66,
                height: 150.0,
                color: Colors.brown,
              )
            ],
          ),
        ),
        SizedBox(height: 30.0,),
      ],
    );
  }
}
