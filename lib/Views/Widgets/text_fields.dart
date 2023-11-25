import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/Config/config.dart';

class AppTexts {
  AppTexts._internal();
  static final AppTexts _singletone = AppTexts._internal();
  factory AppTexts() {
    return _singletone;
  }

 static Widget vClickableText(
      {required String text,
      required Function onTap,
      Color? textColor,
      double? fontsize}) {
    return Text(text, style: kBody.copyWith(color: textColor ?? Colors.blue));
  }
}
