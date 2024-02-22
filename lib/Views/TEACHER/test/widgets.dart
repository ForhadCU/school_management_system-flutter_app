import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/TEACHER/test/test_ctrlr.dart';
import 'package:school_management_system/Controller/test/test_controller.dart';

class TeachTestWidgets {
  // make this class singleton
  TeachTestWidgets._internal();
  static final TeachTestWidgets _singleton = TeachTestWidgets._internal();
  factory TeachTestWidgets() {
    return _singleton;
  }

  static final TeachTestCtrlr testController = TeachTestCtrlr.to;

  vTextView({required String valueText}) {
    return Container(
      child: Text(valueText),
    );
  }

  static vListView() {
    return Container();
  }
  // codes start from here
  // All methods should be static to maintain singleton instances
}
