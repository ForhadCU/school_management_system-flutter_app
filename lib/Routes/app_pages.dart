class AppRoutes {
  AppRoutes._internal();
  static final AppRoutes _singleton = AppRoutes._internal();
  factory AppRoutes() {
    return _singleton;
  }

  static String splashpage = '/';
  static String login = '/login';
  static String test = '/test';
}
