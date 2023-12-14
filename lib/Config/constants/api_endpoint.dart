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

  static const String allNotice = "/api/web-app/get-all-notice";
  static const String aboutUs = "/api/web-app/get-about-us";
  static const String imageGallery = "/api/web-app/event-list-with-pagination";
  static const String academic_group_list = "/api/web-app/academic-group-list";
  static const String monthwise_calendar_list = "/api/web-app/monthwise-calendar-list";

}
