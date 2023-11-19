import 'package:flutter/material.dart';

class AppColor {
  AppColor._internal();
  static final AppColor _singletone = AppColor._internal();
  factory AppColor() {
    return _singletone;
  }

  static const Color primaryColor = Color(0xff27292F);
  static const Color secondaryColor = Color(0xff27292F);
  static const Color primaryDarkColor = Color(0xff27292F);
  static const Color secondaryDarkColor = Color(0xff27292F);

  /// gradiant color
  static const LinearGradient kBtnGradiantColor = LinearGradient(
    colors: [Color(0xffED5DCD), Color(0xff5F5DD7)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const LinearGradient kBtnDarkGradiantColor = LinearGradient(
    colors: [Color(0xff322F3B), Color(0xff322F3B)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  /// shadow
  BoxShadow kCardShadow = const BoxShadow(
    color: Color.fromRGBO(34, 34, 34, 0.086),
    offset: Offset(4, 8),
    blurRadius: 24,
    spreadRadius: 4,
  );
}
