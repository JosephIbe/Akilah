import 'dart:convert';

import 'package:akilah/data/models/user_model.dart';

class UserResponseModel {

  final bool success;
  final String message;
  final UserModel user;
  final String accessToken;
  final String refreshToken;

  UserResponseModel({this.success, this.message, this.user, this.accessToken, this.refreshToken});

  UserResponseModel userResponseModelFromJSON(str) => UserResponseModel.fromJSON(json.decode(str));

  String userResponseModelToJSON(UserResponseModel data) => json.encode(data.toJSON());

  factory UserResponseModel.fromJSON(Map<String, dynamic> json) {
    return UserResponseModel(
      user: json['user'],
      success: json['success'],
      message: json['message'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }

  Map<String, dynamic> toJSON() => {
    "success": success,
    "message": message,
    "user": user.toJSON(),
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };

}