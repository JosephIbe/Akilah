import 'package:akilah/presentation/widgets/comments_list.dart';
import 'package:akilah/presentation/widgets/watch_course_header.dart';
import 'package:akilah/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WatchCourse extends StatefulWidget {
  @override
  _WatchCourseState createState() => _WatchCourseState();
}

bool showCommentsView;

class _WatchCourseState extends State<WatchCourse> {

  double height, width;

  @override
  void initState() {
    super.initState();
    showCommentsView = false;
  }

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: true,
        body: Container(
          width: width,
          height: height,
          color: Colors.blueGrey[300],
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: WatchCourseHeader(
                    minExtent: height * 0.32, maxExtent: height * 0.32),
              ),
              SliverFillRemaining(
                child: Container(
                  height:  height * 0.68,
                  child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      reverseDuration: Duration(milliseconds: 500),
                      switchInCurve: Curves.easeInOut,
                      switchOutCurve: Curves.easeInBack,
                      child: !showCommentsView ? playListFeed() : commentsView()
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget playListFeed(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('Gordon Ramsay Teaches Cooking II',
                      style: kWatchCourseTitleTextStyle),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('Gordon Ramsay', style: kWatchCourseAuthorTextStyle),
                ),
                SizedBox( height: 10.0, ),
                GestureDetector(
                  onTap: ()=> setState(()=> showCommentsView = !showCommentsView),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: height * 0.12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          shape: BoxShape.rectangle,
                          color: Colors.blueGrey
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Comments'),
                                Icon(Icons.zoom_out_map_rounded)
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).primaryColor
                                    ),
                                    child: Center(
                                      child: Text(
                                        'JI',
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1.0
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    height: 40.0,
                                    child: TextField(
                                      enabled: false,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(5.0),
                                              borderSide: BorderSide(color: Colors.blueGrey)
                                          )
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox( height: 10.0, ),
                ListView.builder(
                  itemCount: 15,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index){
                    return playListItem(index: index);
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget playListItem({int index}){
    return Container(
      height: height * 0.13,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CachedNetworkImage(
              imageUrl: 'https://picsum.photos/200',
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
              errorWidget: (context, url, error) => Center(child: Icon(Icons.error, color: Colors.red,)),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('$index. Kitchen and Food Safety Lesson Plan'),
                  SizedBox(height: 5.0,),
                  Text('The basic terms used when cooking')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget commentsView(){
    int commentsCount = 20;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.blueGrey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Comments $commentsCount',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 18.0
                                )
                              ),
                            ),
                            IconButton(
                              onPressed: ()=> setState(()=> showCommentsView = !showCommentsView),
                              icon: Icon(Icons.clear, ),
                            )
                          ],
                        ),
                        Text(
                          'Keep all comments respectful, brief and direct to the point',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 16.0,
                              color: Colors.redAccent
                            )
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Material(color: Colors.blueGrey[300], child: CommentsList())
                      ],
                    )
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

}