class AppSpacing {
  AppSpacing._internal();
  static final AppSpacing _singltone = AppSpacing._internal();
  factory AppSpacing() {
    return _singltone;
  }

  static const double xxl = 32;
  static const double xl = 24;
  static const double md = 16;
  static const double sm = 8;
  static const double smh = 4; // smaller half
}
