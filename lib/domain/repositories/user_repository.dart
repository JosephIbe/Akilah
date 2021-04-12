import 'package:akilah/data/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> loginUser(Map<String, dynamic> body);
  Future<UserModel> registerUser(Map<String, dynamic> body);
  Future<UserModel> getCurrentUser();
  Future<void> saveTokens(String accessToken, String refreshToken);
  Future<void> deleteTokens(String accessToken, String refreshToken);
  Future<bool> checkHasTokens(String accessToken, String refreshToken);
  Future<void> logOut();
}