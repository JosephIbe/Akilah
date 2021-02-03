import 'package:akilah/utils/constants.dart';
import 'package:flutter/material.dart';

class Topics extends StatelessWidget {

  var topics = [
    'Business', 'Language', 'Animation', 'Career Goals',
    'Personal Development', 'Management', 'Tech & Coding'
  ];

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 4.0,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Explore by Topic', style: kAppbarTextStyle,),
          automaticallyImplyLeading: true,
        ),
        body: Container(
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: topics.length,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(topics[index], style: kTopicItemTextStyle,),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
