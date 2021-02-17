class APIConstants {
  APIConstants._();

  static const String BASE_URL = 'http://192.168.43.207:7002';
  // static const String BASE_URL = 'http://10.0.2.2:7002';
  static const String AUTH_URL = '/api/v1/auth';
  static const REGISTER_URL = BASE_URL + AUTH_URL + '/register';
  static const LOGIN_URL = BASE_URL + AUTH_URL + '/login';

}