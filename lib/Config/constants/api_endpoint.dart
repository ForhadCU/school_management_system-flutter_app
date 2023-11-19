class ApiEndpoint {
  ApiEndpoint._internal();
  static final ApiEndpoint _singletone = ApiEndpoint._internal();
  factory ApiEndpoint() {
    return _singletone;
  }

  /// base url
  static String baseUrl = 'https://';
  // auth
  static String login = '$baseUrl/api/web/auth/access'; //test
}
