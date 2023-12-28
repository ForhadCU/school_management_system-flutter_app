import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Config/config.dart';

class StuAttendanceController extends GetxController {
  static StuAttendanceController get to => Get.find();

  /// variable declaration
  var dateFrom = DateTime.now().obs;
  var dateTo = DateTime.now().subtract(Duration(days: 7)).obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// code goes here
  ///
  mSelectDateFrom() async {
    DateTime? pickedDate = await showDatePicker(
      context: kGlobContext,
      initialDate: dateFrom.value,
      firstDate: DateTime.now().subtract(Duration(days: 364)),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      dateFrom.value = pickedDate;
    }
  }

  mSelectDateTo() async {
    DateTime? pickedDate = await showDatePicker(
      context: kGlobContext,
      initialDate: dateTo.value,
      firstDate: DateTime.now().subtract(Duration(days: 364)),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      dateTo.value = pickedDate;
    }
  }

  ///
}
