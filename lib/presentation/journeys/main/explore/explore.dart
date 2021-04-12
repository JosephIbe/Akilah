import 'package:akilah/presentation/widgets/explore_tags.dart';
import 'package:akilah/utils/constants.dart';
import 'package:flutter/material.dart';

var width, height;

class Explore extends StatelessWidget {

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          child: Column(
            children: [
              ExploreBanner(controller: searchController,),
              ExploreTags(),
            ],
          ),
        )
      ),
    );

  }
}

class ExploreBanner extends StatelessWidget {

  final TextEditingController controller;
  ExploreBanner({this.controller});

  double height, width;

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          height: height * 0.17,
          width: width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: [0, 0.5, 0.75],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xffffc226), Color(0xffEDB423), Color(0xffFFCF54)],
                tileMode: TileMode.clamp)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 15.0,),
              Form(
                autovalidateMode: AutovalidateMode.disabled,
                child: TextField(
                  style: TextStyle(color: Colors.black, decoration: TextDecoration.none),
                  maxLength: 20,
                  maxLines: 1,
                  expands: false,
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: 'Search our Course Catalog',
                    hintStyle: TextStyle(
                        color: Colors.black38,
                        fontSize: 15.0
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.search_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  keyboardType: TextInputType.text ,
                  controller: controller,
                ),
              ),
            ],
          ),
        )
    );
  }
}