import 'package:akilah/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreTags extends StatelessWidget {

  var tags = [
    'Business', 'Language', 'Animation', 'Career Goals',
    'Personal Development', 'Management', 'Tech & Coding'
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            _buildSectionHeader(title: 'Popular Tags'),
            SizedBox(height: 10.0,),
            ListView.separated(
              shrinkWrap: true,
              itemCount: tags.length,
              separatorBuilder: (_, index)=> Divider(),
              itemBuilder: (_, index) => _buildTagItem(itemTitle: tags[index]),
            )
          ],
        ),
      ),
    );
  }

  _buildSectionHeader({String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
          title,
          style: GoogleFonts.lato(
              textStyle: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                  color: Colors.black)
          ),
      ),
    );
  }

  _buildTagItem({String itemTitle, Function onTagTapped}){
    return GestureDetector(
      onTap: onTagTapped,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Text(itemTitle, style: kExploreTagsTextStyle,),
      ),
    );
  }

}