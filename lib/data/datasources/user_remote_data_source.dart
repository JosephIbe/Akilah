import 'package:akilah/data/core/api_client.dart';
import 'package:akilah/data/core/api_constants.dart';
import 'package:akilah/data/models/user_model.dart';
import 'package:akilah/data/models/user_response_model.dart';
import 'package:akilah/domain/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> loginUser(Map<String, dynamic> body);
  Future<UserModel> registerUser(Map<String, dynamic> body);
  // Future<User> sendOTP();
  // Future<User> verifyOTP();
  Future<UserModel> getCurrentUser();
  Future<void> logOut();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {

  final APIClient client;
  var storage = FlutterSecureStorage();
  UserRepository repository;
  UserRemoteDataSourceImpl({@required this.client});

  @override
  Future<UserModel> loginUser(Map<String, dynamic> body) async {
    final response = await client.postAuthData('login', body);
    final userResponseModel = UserResponseModel.fromJSON(response);

    final accessToken = userResponseModel.accessToken;
    final refreshToken = userResponseModel.refreshToken;

    await storage.write(key: APIConstants.ACCESS_TOKEN_KEY, value: accessToken);
    await storage.write(key: APIConstants.REFRESH_TOKEN_KEY, value: refreshToken);

    String userId = userResponseModel.user.id;
    await storage.write(key: APIConstants.USER_ID_KEY, value: userId);

    return userResponseModel.user;
  }

  @override
  Future<UserModel> registerUser(Map<String, dynamic> body) async {
    final response = await client.postAuthData('register', body);
    final userResponseModel = UserResponseModel.fromJSON(response);

    final accessToken = userResponseModel.accessToken;
    final refreshToken = userResponseModel.refreshToken;

    await storage.write(key: APIConstants.ACCESS_TOKEN_KEY, value: accessToken);
    await storage.write(key: APIConstants.REFRESH_TOKEN_KEY, value: refreshToken);

    String userId = userResponseModel.user.id;
    await storage.write(key: APIConstants.USER_ID_KEY, value: userId);

    return userResponseModel.user;
  }

  @override
  Future<UserModel> getCurrentUser() async {
    var user;
    String userId = await storage.read(key: APIConstants.USER_ID_KEY);
    print('UserId in GetCurrentUser() is $userId');
    if(userId != null){
      final response = await client.getUserProfile(pathSegment: 'current-user', userId: userId);
      user = UserResponseModel.fromJSON(response).user;
      print('user in urds is \t $user');
    }
    return user ?? null;
  }

  @override
  Future<void> logOut() async {
    await client.postAuthData('logout', null);
  }

}