import 'package:flutter/material.dart';

class AppColor {
  AppColor._internal();
  static final AppColor _singletone = AppColor._internal();
  factory AppColor() {
    return _singletone;
  }

  static const Color primaryColor = Color(0xff587FCE);
  static const Color secondaryColor = Color(0xff78ADFC);
  static const Color inactiveTab = Color(0xff8C93C9);
  static const Color activeTab = Color(0xff696EAF);
  /*   static const Color primaryColor = Color(0xffFF6000);
  static const Color secondaryColor = Color(0xff27292F); */
  static const Color primaryDarkColor = Color(0xff27292F);
  static const Color secondaryDarkColor = Color(0xff27292F);
  static const Color white = Color(0xffFFFFFF);
  static const Color textColor = Color(0xff000000);
  static const Color textColor500 = Color.fromARGB(255, 27, 27, 27);
  static const Color hintColor = Color.fromARGB(255, 68, 68, 68);
  static const Color hintColor500 = Color.fromARGB(255, 230, 230, 230);
  static const Color red = Colors.red;
  static const Color green = Colors.green;
  static const Color documentItembg = Color(0xff68CA5B);
  // static const Color blue = Colors.blue;
  static const Color yellow = Colors.yellow;
  static const Color unselectedTab = Color(0xfff98da5);
  static const Color dotDarkScreen1 = Color(0xffd1395c);
  static const Color dotLightScreen1 = Color(0xfff98da5);
  static const Color dateCardTopBg = Color(0xffff0454);
  static const Color nevy = Color(0xff2B3499);

  static const Color frenchSkyBlue = Color(0xff78ADFC);
  static const Color frenchSkyBlue100 = Color(0xffBEDCFF);
  static const Color silverLakeBlue = Color(0xff587FCE);
  static const Color topaz = Color(0xffFCC778);
  static const Color dollarBill = Color(0xff8CC864);
  static const Color fontUsername = Color(0xff3B3E69);

  static const Color holiday = Color(0xffDB7093);
  static const Color helpDeskTopbar = Color(0xff1E90FF);
  static const Color classroomItemBg = Color(0xffEBEBEB);

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

  static const Color academic_calendar = Color(0xffB3E59E);
  static const Color attendance = Color(0xff7983EA);
  static const Color live_class = Color(0xff354FC5);
  static const Color log_out = Color(0xffFD6097);
  static const Color my_class = Color(0xffBFFE65);
  static const Color my_exam = Color(0xffFEDF46);
  static const Color my_payments = Color(0xff18C93A);
  static const Color my_paymentsDark = Color.fromARGB(255, 2, 155, 33);
  static const Color my_quiz = Color(0xffEAC05C);
  static const Color my_result = Color(0xffFC3D80);
  static const Color my_routine = Color(0xff19B5BA);
  static const Color my_subject = Color(0xff3FEFEF);
  static const Color website = Color(0xff44A2F9);

  static const Color paymentMethodCard = Color(0xffE1E7F5);

  /// gradiant color
  static const LinearGradient kBtnGradiantColor = LinearGradient(
    colors: [primaryColor, secondaryColor],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static LinearGradient kDonwloadBtnGradiantColor = const LinearGradient(
    colors: [my_paymentsDark, my_payments],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static LinearGradient kVerticalCovexGradiant = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.9, 0.1],
    colors: [primaryColor, secondaryColor],
  );
  static LinearGradient kVerticalCovexGradiantPink = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.9, 0.1],
    colors: [Color(0xffF2B0C5), Color(0xffE8CED1)],
  );
  static const LinearGradient kBtnGradiantColorReverse = LinearGradient(
    colors: [secondaryColor, primaryColor],
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

  static List<Color> kNoticeListColorPlate = [
    Colors.blue.shade900,
    Colors.yellow.shade900,
    Colors.pink.shade900,
    Colors.green.shade900,
  ];

  /// shadow
  BoxShadow kCardShadow = const BoxShadow(
    color: Color.fromRGBO(34, 34, 34, 0.086),
    offset: Offset(4, 8),
    blurRadius: 24,
    spreadRadius: 4,
  );

////*** Exports */
  /// app color
  static const Color kPrimaryColor = Color(0xff27292F);
  static const Color kSecondaryColor = Color(0xff1C1D22);
  static const Color kSecondaryLightColor = Color(0xff212326);
  static const Color kTextColor = Color(0xffB5B8C5);
  static const Color kTextColorLite = Color(0xffF7F8FC);
  static const Color kTextFieldColor = Color(0xff39383d);
  static const Color kTextFieldHintColor = Color(0xff87898E);

  /// gray color
  static const Color kGray100 = Color(0xff1D1B20);
  static const Color kGray200 = Color(0xff211F26);
  static const Color kGray300 = Color(0xff2B2930);
  static const Color kGray400 = Color(0xff2B2930);
  static const Color kGray500 = Color(0xff36343B);
  static const Color kGray600 = Color(0xff322F3B);
  static const Color kGray700 = Color(0xff4A4458);

//  Color
  static const Color kDangerColor = Color(0xffD25B5B);
  static const Color kGreen = Color(0xff27AE60);
  static const Color kDarkGreen = Color(0xff05A660);
  static const Color kYellow = Color.fromARGB(255, 247, 193, 18);
  static const Color kBlueColor = Color(0xff2D9CDB);
  static const Color kDarkBlueColor = Color(0xff0047C2);
  static const Color kLightPink = Color(0xffEFE0FF);
  static const Color kBorderColor = Color.fromARGB(255, 202, 202, 202);
  static const Color kliteBG = Color(0xffFAFAFA);
  static const Color kliteBorder = Color(0xffEAEAEA);

//  color
  static const Color kWhite = Colors.white;
  static const Color kBlack = Colors.black;
  static const Color kAmber = Color(0xffDCE35B);
  static const Color kRed = Colors.red;

// graph color
  static const Color kGraphColor1 = Color(0xffED5DCD);
  static const Color kGraphColor2 = Color(0xff5F5DD7);

// Analytics Chart colors
  static const List<Color> chartColors = [
    Color(0xff3CEE88),
    Color(0xffE29A5B),
    Color(0xffEB7575),
    Color(0xff378EAA),
    Color(0xffBA6ADF),
    Colors.grey,
  ];

// Trends
  static const Color kButtonBorder = Colors.white24;
}
