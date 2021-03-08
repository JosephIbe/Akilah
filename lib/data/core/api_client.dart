import 'package:dio/dio.dart';
import 'package:akilah/data/core/api_constants.dart';

class APIClient {

  dynamic postAuthData(String pathSegment, Map<String, dynamic> body) async {
    Dio dio = Dio();
    try {
      Response response = await dio.post(
        // '${APIConstants.PROD_BASE_URL}${APIConstants.AUTH_SEGMENT}/$pathSegment',
          '${APIConstants.LOCAL_BASE_URL}${APIConstants.AUTH_SEGMENT}/$pathSegment',
          data: body
      );
      if(response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 204) {
        print(response.data);
        return response.data;
      } else {
        print(response.statusCode);
        print(response.statusMessage);
        throw Exception(response.statusMessage);
      }
    } on DioError catch (e) {
      if(e.response != null) {
        print(e.response.data);
        // print(e.response.headers);
        print(e.response.request);
      } else{
        print(e.request);
        print(e.message);
      }
    }
  }
}