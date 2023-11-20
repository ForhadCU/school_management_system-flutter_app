import 'package:flutter/material.dart';

class AppScreenSize {
  AppScreenSize._internal();
  static final AppScreenSize _sinlgeton = AppScreenSize._internal();
  factory AppScreenSize() {
    return _sinlgeton;
  }

  static mGetHeight(BuildContext context, double percentage) {
    return (MediaQuery.of(context).size.height * percentage) / 100;
  }

  static mGetWidth(BuildContext context, double percentage) {
    return (MediaQuery.of(context).size.width * percentage) / 100;
  }

  static mGetLongestSide(BuildContext context, double percentage) {
    return (MediaQuery.of(context).size.longestSide * percentage) / 100;
  }
}
