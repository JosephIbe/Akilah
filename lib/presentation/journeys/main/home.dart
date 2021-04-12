import 'package:flutter/material.dart';

import 'package:akilah/presentation/journeys/main/home_main.dart';
import 'package:akilah/presentation/journeys/main/explore/explore.dart';
import 'file:///E:/FlutterProjects/akilah/lib/presentation/journeys/main/learn/learn.dart';
import 'file:///E:/FlutterProjects/akilah/lib/presentation/journeys/main/favorites/favorites.dart';
import 'file:///E:/FlutterProjects/akilah/lib/presentation/journeys/main/settings/settings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var currentIndex = 0;
  var children = [
    HomeMain(),
    Explore(),
    Learn(),
    Favorites(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: children[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: 'Explore'),
            BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: 'Learn'),
            BottomNavigationBarItem(icon: Icon(Icons.star_border), label: 'Favorites'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          ],
          onTap: (value){
            setState(()=> currentIndex = value);
          },
          showSelectedLabels: true,
          showUnselectedLabels: false,
          elevation: 4.0,
          currentIndex: currentIndex,
          backgroundColor: Colors.white70,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.black,
        ),
      ),
    );
  }
}