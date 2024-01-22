import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_management_system/Config/config.dart';

class CustomStatusBar {
  CustomStatusBar._internal();
  static final CustomStatusBar _singleton = CustomStatusBar._internal();
  factory CustomStatusBar() {
    return _singleton;
  }

  static mDarkStatusBar([bool? isTransparent]) {
    isTransparent == null
        ? SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
           systemNavigationBarIconBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.light,
                statusBarColor: AppColor.primaryColor,
        ))
        : isTransparent
            ? SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
                // systemNavigationBarColor: Color(0xFF000000),
                systemNavigationBarIconBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.light,
                statusBarColor: Colors.transparent,
              ))
            : SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    /*   SystemChrome.(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
    ); */
  }
}
