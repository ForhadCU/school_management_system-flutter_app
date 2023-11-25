import 'package:flutter/material.dart';

class AppColor {
  AppColor._internal();
  static final AppColor _singletone = AppColor._internal();
  factory AppColor() {
    return _singletone;
  }

  static const Color primaryColor = Color(0xffFF6000);
  static const Color secondaryColor = Color(0xff27292F);
  static const Color primaryDarkColor = Color(0xff27292F);
  static const Color secondaryDarkColor = Color(0xff27292F);
  static const Color white = Color(0xffFFFFFF);
  static const Color textColor = Color(0xff000000);
  static const Color textColor500 = Color.fromARGB(255, 27, 27, 27);
  static const Color hintColor = Color.fromARGB(255, 68, 68, 68);
  static const Color hintColor500 = Color.fromARGB(255, 230, 230, 230);
  static const Color red = Colors.red;
  static const Color green = Colors.green;
  static const Color yellow = Colors.yellow;
  static const Color unselectedTab = Color(0xfff98da5);
  static const Color dotDarkScreen1 = Color(0xffd1395c);
  static const Color dotLightScreen1 = Color(0xfff98da5);
  static const Color dateCardTopBg = Color(0xffff0454);

  //** Orange */
  static const Color orange50 = Color.fromARGB(255, 255, 234, 220);
  static const Color orange100 = Color(0xffffe0cc);
  static const Color orange200 = Color(0xffffd0b3);
  static const Color orange300 = Color(0xffffc099);
  static const Color orange400 = Color(0xffffb180);
  static const Color orange500 = Color(0xffffa166);
  static const Color orange600 = Color(0xffff914d);
  static const Color orange700 = Color(0xffff8133);
  static const Color orange800 = Color(0xffff8000);
  static const Color orange900 = Color(0xffe65800);

  /// gradiant color
  static const LinearGradient kBtnGradiantColor = LinearGradient(
    colors: [primaryColor, orange700],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  ); 
/*   static const LinearGradient kBtnGradiantColor = LinearGradient(
    colors: [Color(0xffED5DCD), Color(0xff5F5DD7)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  ); */
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
