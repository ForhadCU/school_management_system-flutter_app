import 'package:flutter/material.dart';
import 'package:school_management_system/Config/styles/colors.dart';
import 'package:school_management_system/Config/styles/fonts.dart';
import 'package:school_management_system/Config/themes/text.dart';

ThemeData themeData = ThemeData(
  textTheme: textTheme,
  fontFamily: Fonts.inter,
  primarySwatch: Colors.grey, // should change
  scaffoldBackgroundColor: AppColor.white,
);
