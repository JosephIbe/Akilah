import 'package:akilah/data/models/user_model.dart';
import 'package:flutter/material.dart';

class Comment {
  // final UserModel user;
  final String text;
  final String name;
  final String imageURL;

  Comment({
    @required this.text,
    @required this.name,
    @required this.imageURL,
  }) : assert (text != null && name != null);

}