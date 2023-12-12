// ignore_for_file: constant_identifier_names

const String kAssetBaseLoc = "assets/";

const String academic_calender = "assets/icons/academic_calender.png";
const String contact_us = "assets/icons/contact_us.png";
const String login = "assets/icons/login.png";
const String noticeboard_colored_ic = "assets/icons/noticeboard.png";
const String photo_gallery = "assets/icons/photo_gallery.png";
const String site_history1 = "assets/icons/site_history1.png";
const String menu = "assets/icons/menu.png";
const String userLogin = "assets/icons/user_login.png";
const String home_user = "assets/icons/home_user.png";
const String noitce = "assets/icons/noitce.png";
const String nav_notice = "assets/icons/nav_notice.png";
const String nav_home = "assets/icons/nav_home.png";
const String nav_notification = "assets/icons/nav_notification.png";
const String nav_user = "assets/icons/nav_user.png";
const String no_icon_img = "assets/icons/no_icon_img.png";

const String attendance = "assets/logos/attendance.jpg";
const String demo_school = "assets/logos/demo_school.png";
const String mark_sheet = "assets/logos/mark_sheet.jpg";
const String multiple_login = "assets/logos/multiple_login.jpg";
const String notice_board_logo = "assets/logos/notice_board.jpg";
const String routines = "assets/logos/routines.jpg";

const String logoDemoSchool = "assets/logos/demo_school.png";

class PublicAssetLocation {
  PublicAssetLocation._internal();
  static final PublicAssetLocation _singleton = PublicAssetLocation._internal();
  factory PublicAssetLocation() {
    return _singleton;
  }

  /// icons
  static const String no_icon_img = "assets/icons/no_icon_img.png";
  static const String notices = "assets/icons/noitces.png";
  static const String home = "assets/icons/home_user.png";
  static const String gallery = "assets/icons/gallery.png";
  static const String academicCalander = "assets/icons/academic_calndr.png";
  static const String sitehistory = "assets/icons/site_history.png";
  static const String userLogin = "assets/icons/user_login.png";
  static const String contact_mail_us = "assets/icons/contact_mail_us.png";

  /// images
  static const String slide_bg_1 = "assets/images/slide_bg_1.png";
  static const String slide_bg_2 = "assets/images/slide_bg_2.png";
  static const String slide_bg_3 = "assets/images/slide_bg_3.png";
  static const String slide_bg_4 = "assets/images/slide_bg_4.png";
  static const String slide_bg_5 = "assets/images/slide_bg_5.png";
  static const String sample_gallery_image = "assets/images/sample_gallery_image.jpg";
}

class StudentAssetLocation {
  StudentAssetLocation._internal();
  static final StudentAssetLocation _singleton =
      StudentAssetLocation._internal();
  factory StudentAssetLocation() {
    return _singleton;
  }

  static const String no_icon_img = "assets/icons/no_icon_img.png";
}

class TeacherAssetLocation {
  TeacherAssetLocation._internal();
  static final TeacherAssetLocation _singleton =
      TeacherAssetLocation._internal();
  factory TeacherAssetLocation() {
    return _singleton;
  }

  static const String no_icon_img = "assets/icons/no_icon_img.png";
}
