import 'package:akilah/data/models/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentsList extends StatefulWidget {
  @override
  _CommentsListState createState() => _CommentsListState();
}

class _CommentsListState extends State<CommentsList> {

  final _commentsController = TextEditingController();
  final List<Comment> _commentsList = [
    Comment(
        text: 'Some Random Comment',
        name: 'Joseph Ibeawuchi',
        imageURL: 'https://picsum.photos/200'
    ),
    Comment(
        text: 'Some Other Random Comment Here',
        name: 'Hillary Clinton',
        imageURL: 'https://picsum.photos/200'
    ),
    Comment(
        text: 'Some Other Random Comment Here Too',
        name: 'Donald Trump',
        imageURL: 'https://picsum.photos/200'
    ),
    Comment(
        text: 'Some Other Random Comment Here Too, This one is pretty long innit? Shall we test the limit of this box by maybe adding constraints?',
        name: 'George Washington',
        imageURL: 'https://picsum.photos/200'
    ),
  ];

  @override
  Widget build(BuildContext context) {

    print(_commentsList.length);

    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(8.0),
      children: [
        SingleChildScrollView(
          child: Row(
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
                  constraints: BoxConstraints(
                    maxHeight: 200.0,
                    minHeight: 80.0
                  ),
                  padding: EdgeInsets.only(left: 8.0),
                  child: TextField(
                    enabled: true,
                    controller: _commentsController,
                    keyboardType: TextInputType.multiline,
                    minLines: 2,
                    maxLines: 10,
                    decoration: InputDecoration(
                      labelText: 'Enter Comment Here...',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.blueGrey)
                        )
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: Icon(Icons.send, color: _commentsController.text.isEmpty ? Colors.black54 : Colors.white,),
                  onPressed: ()=> _commentsController.text.isNotEmpty ? submitComment() : null,
                )
              ),
            ],
          ),
        ),
        SizedBox(height: 20.0,),
        Divider(),
        ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _commentsList.length,
          itemBuilder: (context, index){
            return commentTile(_commentsList[index]);
          },
        ),
      ],
    );
  }

  submitComment(){
    Comment comment = Comment(
      text: _commentsController.text,
      name: 'Joseph Ibeawuchi',
      imageURL: 'https://picsum.photos/200'
    );
    _commentsList.add(comment);
    _commentsController.text = '';
  }

  commentTile(Comment comment){
    return Column(
      children: [
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
              flex: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(comment.name),
                  Text(comment.text),
                ],
              ),
            )
          ],
        ),
        Divider()
      ],
    );
  }

}
