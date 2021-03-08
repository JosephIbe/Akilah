import 'package:flutter/material.dart';

class UserModel {

  final String id;
  final String username;
  final String email;
  final int phone;

  const UserModel({
    this.id,
    @required this.email,
    @required this.username,
    @required this.phone,
  });

  UserModel copyWith({String id, String username, String email, int phone}){
    if (
        (id == null) || identical(id, this.id) &&
        (username == null) || identical(id, this.username) &&
        (email == null || identical(email, this.email)) &&
        (phone == null || identical(phone, this.phone))) {
      return this;
    }

    return new UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  static const empty = UserModel(email: '', username: null, phone: null, id: '');

  @override
  String toString() {
    return 'User{id: $id, username: $username, email: $email, phone: $phone}';
  }

  factory UserModel.fromJSON(Map<String, dynamic> map){
    return new UserModel(
      id:map['_id'],
      username:map['username'],
      email:map['email'],
      phone:map['phone'],
    );
  }

  Map<String, dynamic> toJSON(){
    return {
      'id': id,
      'username': username,
      'email': email,
      'phone': phone,
    };
  }

}

// class UserModel {
//   final String id;
//   final String username;
//   final String email;
//   final String phone;
//
//   UserModel({this.id, this.username, this.email, this.phone});
//
//   factory UserModel.fromJSON(Map<String, dynamic> json) {
//     // final user = json['user'];
//     print(json);
//     return UserModel(
//       id: json["_id"],
//       username: json["username"],
//       email: json["email"],
//       phone: json["phone"],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "username": username,
//     "email": email,
//     "phone": phone,
//   };
//
// }