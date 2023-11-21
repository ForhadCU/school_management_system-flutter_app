class AppRoutes {
  AppRoutes._internal();
  static final AppRoutes _singleton = AppRoutes._internal();
  factory AppRoutes() {
    return _singleton;
  }

  static String splashpage = '/';
  static String login = '/login';
  static String test = '/test';
  static String launcherSlides = '/launcherSlides';
  static String searchSchool = '/searchSchool';
  static String home = '/home';
  static String notice = '/notice';
  static String gallery = '/gallery';
  static String siteHistory = '/siteHistory';
  static String contact = '/contact';
  static String academicCalendar = '/academicCalendar';
}
