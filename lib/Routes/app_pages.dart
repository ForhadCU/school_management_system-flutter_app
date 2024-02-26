class AppRoutes {
  AppRoutes._internal();
  static final AppRoutes _singleton = AppRoutes._internal();
  factory AppRoutes() {
    return _singleton;
  }

  /// PUBLIC
  static String splashpage = '/';
  static String login = '/login';
  static String academicGroup = '/academicGroup';
  static String test = '/test';
  static String launcherSlides = '/launcherSlides';
  static String searchSchool = '/searchSchool';
  static String home = '/home';
  static String notice = '/notice';
  static String expandedNotice = '/expandedNotice';
  static String expandedStuNotice = '/expandedStuNotice';
  static String gallery = '/gallery';
  static String siteHistory = '/siteHistory';
  static String contact = '/contact';
  static String academicCalendar = '/academicCalendar';
  static String notification = '/notification';
  static String landing = '/landing';
  static String splashScreen = '/splashScreen';

  ///STUDENT
  static const String classroom = "/classroom";
  static const String calendar = "/calendar";
  static const String attendance = "/attendance";
  static const String dashboard = "/dashboard";
  static const String exam = "/exam";
  static const String helpdesk = "/helpdesk";
  static const String studentHome = "/studentHome";
  static const String liveClass = "/liveClass";
  // static const String logout = "/logout";
  static const String studentNotice = "/studentNotice";
  static const String studentNotification = "/studentNotification";
  static const String payments = "/payments";
  static const String profile = "/profile";
  static const String quiz = "/quiz";
  static const String result = "/result";
  static const String routine = "/routine";
  static const String subjects = "/subjects";
  static const String website = "/website";
  static const String helpdeskDetails = "/helpdeskDetails";
  static const String classroomDetails = "/classroomDetails";
  static const String stuMessage = "/stuMessage";
  static const String stuMessageExpand = "/stuMessageExpand";

  ///TEACHER
  static const String teachHome = "/teachHome";
  static const String teachDashboard = "/teachDashboard";
  static const String teachProfile = "/teachProfile";
  static const String teachNotice = "/teachNotice";
  static const String teachHelpdesk = "/teachHelpdesk";
  static const String expandedTeachNotice = '/expandedTeachNotice';
  static const String examMarksEntry = "/examMarksEntry";
  static const String examAttendance = "/examAttendance";
  static const String teachNotification = "/teachNotification";
  static const String teachRoutine = "/teachRoutine";
  static const String teachMessage = "/teachMessage";
  static const String teachPeriodicAttnd = "/teachPeriodicAttnd";
  static const String teachAttendance = "/teachAttendance";
  static const String teachTest = "/teachTest";
}
