import 'package:akilah/data/core/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class APIClient {
  static Dio dio;
  var storage;

  APIClient() {
    dio = Dio();
    storage = FlutterSecureStorage();
  }

  dynamic postAuthData(String pathSegment, Map<String, dynamic> body) async {
    try {
      Response response = await dio.post(
          '${APIConstants.PROD_BASE_URL}${APIConstants.AUTH_SEGMENT}/$pathSegment',
          // '${APIConstants.LOCAL_BASE_URL}${APIConstants.AUTH_SEGMENT}/$pathSegment',
          data: body);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        print(response.data);
        return response.data;
      } else {
        print(response.statusCode);
        print(response.statusMessage);
        throw Exception(response.statusMessage);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        // print(e.response.data);
        // print(e.response.headers);
        // print(e.response.request);
      } else {
        // print(e.request);
        // print(e.message);
      }
    }
  }

  dynamic getUserProfile({String pathSegment, String userId}) async {
    String token = await storage.read(key: APIConstants.ACCESS_TOKEN_KEY);
    // print('AccessToken in GetProfile() is $token');

    dio.options.headers['authorization'] = 'Bearer $token';

    Map<String, String> userIdMap = {"id": userId};

    try {
      Response response = await dio.post(
          '${APIConstants.PROD_BASE_URL}${APIConstants.USER_SEGMENT}/$pathSegment',
          // '${APIConstants.LOCAL_BASE_URL}${APIConstants.USER_SEGMENT}/$pathSegment',
          data: userIdMap);
      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      } else {
        print(response.statusCode);
        print(response.statusMessage);
        throw Exception(response.statusMessage);
      }
    } on DioError catch (err) {
      if (err.response != null) {
        // print(err.response.data);
        // print(err.response.headers);
        // print(err.response.request);
      } else {
        // print(err.request);
        // print(err.message);
      }
    }
  }

}