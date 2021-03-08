class APIConstants {
  APIConstants._();

  static const String PROD_BASE_URL = 'https://akeeelah.herokuapp.com';
  static const String LOCAL_BASE_URL = 'http://192.168.43.207:7002';

  static const String AUTH_SEGMENT = '/api/v1/auth';
  static const String USER_SEGMENT = '/api/v1/user';

  static const REGISTER_URL = LOCAL_BASE_URL + AUTH_SEGMENT + '/register';
  static const LOGIN_URL = LOCAL_BASE_URL + AUTH_SEGMENT + '/login';

  static const CURRENT_USER_URL = LOCAL_BASE_URL + USER_SEGMENT + '/current-user';
  // static const CURRENT_USER_URL = PROD_BASE_URL + USER_SEGMENT + '/current-user';

}