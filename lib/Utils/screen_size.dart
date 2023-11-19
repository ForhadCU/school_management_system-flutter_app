import 'package:flutter/material.dart';

class AppScreenSize {
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
