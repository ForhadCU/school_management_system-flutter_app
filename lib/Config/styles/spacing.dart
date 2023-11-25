class AppSpacing {
  AppSpacing._internal();
  static final AppSpacing _singltone = AppSpacing._internal();
  factory AppSpacing() {
    return _singltone;
  }

  static const double xxl = 32;
  static const double xl = 24;
  static const double md = 16;
  static const double mdh = 12;
  static const double sm = 8;
  static const double smh = 4; // smaller half

  static const double logoSizeDemoSchool = 48;
  static const double noticeBannerHeight = 150;
  static const double dateCardWidth = 60;

/*   static const double borderRadiusSmall = 4;
  static const double borderRadiusMid = 8;
  static const double borderRadiusBig = 16;
  static const double borderRadiusLarge = 24; */
}
