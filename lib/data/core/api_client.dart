import 'package:dio/dio.dart';
import 'package:akilah/data/core/api_constants.dart';

class APIClient {

  dynamic post(String pathSegment, Map<String, dynamic> body) async {
    Dio dio = Dio();
    Response response = await dio.post(
      '${APIConstants.BASE_URL}${APIConstants.AUTH_URL}/$pathSegment',
      data: body
    );
    if(response.statusCode == 200) {
      // print(response.data);
    } else {
      print(response.statusMessage);
      // throw Exception(response.statusMessage);
    }
  }
}