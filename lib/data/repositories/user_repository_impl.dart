import 'package:akilah/data/core/api_constants.dart';
import 'package:flutter/material.dart';

import 'package:akilah/data/models/user_model.dart';
import 'package:akilah/data/datasources/user_remote_data_source.dart';
import 'package:akilah/domain/repositories/user_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource dataSource;
  UserRepositoryImpl({@required this.dataSource});

  var storage;

  @override
  Future<UserModel> loginUser(Map<String, dynamic> body) async {
    final userModel = await dataSource.loginUser(body);
    return userModel;
  }

  @override
  Future<UserModel> registerUser(Map<String, dynamic> body) async {
    final userModel = await dataSource.registerUser(body);
    return userModel;
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final userModel = await dataSource.getCurrentUser();
    return userModel;
  }

  @override
  Future<void> logOut() async {
    storage = FlutterSecureStorage();
    await storage.delete(key: APIConstants.ACCESS_TOKEN_KEY);
    await storage.write(key: APIConstants.REFRESH_TOKEN_KEY);
    await dataSource.logOut();
  }

  @override
  Future<void> saveTokens(String accessToken, String refreshToken) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: APIConstants.ACCESS_TOKEN_KEY, value: accessToken);
    await storage.write(key: APIConstants.REFRESH_TOKEN_KEY, value: refreshToken);
  }

  @override
  Future<void> deleteTokens(String accessToken, String refreshToken) async {
    storage = FlutterSecureStorage();
    await storage.delete(key: APIConstants.ACCESS_TOKEN_KEY);
    await storage.write(key: APIConstants.REFRESH_TOKEN_KEY);
  }

  @override
  Future<bool> checkHasTokens(String accessToken, String refreshToken) async{
    storage = FlutterSecureStorage();
    final hasAT = await storage.read(key: APIConstants.ACCESS_TOKEN_KEY);
    final hasRT = await storage.read(key: APIConstants.REFRESH_TOKEN_KEY);
    return hasRT == null || hasAT == null ? false : true;
  }
}