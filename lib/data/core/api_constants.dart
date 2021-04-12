class APIConstants {
  APIConstants._();

  static const String PROD_BASE_URL = 'https://akeeelah.herokuapp.com';
  static const String LOCAL_BASE_URL = 'http://192.168.43.207:7002';

  static const String AUTH_SEGMENT = '/api/v1/auth';
  static const String USER_SEGMENT = '/api/v1/user';

  static const ACCESS_TOKEN_KEY = 'access_token';
  static const REFRESH_TOKEN_KEY = 'refresh_token';
  static const USER_ID_KEY = 'userId';

}