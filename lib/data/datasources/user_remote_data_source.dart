import 'package:akilah/data/core/api_client.dart';
import 'package:akilah/data/models/user_model.dart';
import 'package:flutter/material.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> loginUser(Map<String, dynamic> body);
  Future<UserModel> registerUser(Map<String, dynamic> body);
  // Future<User> sendOTP();
  // Future<User> verifyOTP();
  Future<UserModel> getCurrentUser();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {

  final APIClient client;
  UserRemoteDataSourceImpl({@required this.client});

  @override
  Future<UserModel> loginUser(Map<String, dynamic> body) async {
    final resultsResponse = await client.post('login', body);
    final user = UserModel.fromJSON(resultsResponse);
    return user;
  }

  @override
  Future<UserModel> registerUser(Map<String, dynamic> body) async {
    final response = await client.post('register', body);
    final user = UserModel.fromJSON(response);
    return user;
  }

  @override
  Future<UserModel> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

}