class AppSpacing {
  AppSpacing._internal();
  static final AppSpacing _singletone = AppSpacing._internal();
  factory AppSpacing() {
    return _singletone;
  }

  static double xxl = 22;
  static double xl = 18;
  static double md = 14;
  static double sm = 10;
  static double smh = 6; // smaller half
}
