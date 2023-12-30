import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Api/STUDENT/attendance/attendance_api.dart';
import 'package:school_management_system/Model/STUDENT/attendance/attendance_model.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../../Config/config.dart';
import '../../../Singletones/app_data.dart';
import '../../../Utils/api structure/payloads.dart';
import '../../../Utils/custom_utils.dart';

class StuAttendanceController extends GetxController {
  static StuAttendanceController get to => Get.find();

  /// variable declaration
  var dateFrom = DateTime.now().obs;
  var dateTo = DateTime.now().subtract(const Duration(days: 7)).obs;
  var isDailyAttendaceActive = true.obs;
  var isPeriodicAttendaceActive = false.obs;
  var numOfNoticesInRange = 0.obs;
  RxList<StuAttendanceModel> stuAttendanceList = <StuAttendanceModel>[].obs;
  var token = "".obs;

  @override
  void onInit() async {
    super.onInit();
    token.value = await AppLocalDataFactory.mGetToken();
    await mGetAttendanceInRange();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// code goes here
  mSelectDateFrom() async {
    DateTime? pickedDate = await showDatePicker(
      context: kGlobContext,
      initialDate: dateFrom.value,
      firstDate: DateTime.now().subtract(const Duration(days: 364)),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      dateFrom.value = pickedDate;
    }
  }

  String mGetFormatDate(dynamic dateFrom, [String? dateFormat]) {
    // return Utils().getTimeFromTimeStamp(dateFrom.toString(), "dd-MM-yyyy");
    return Utils().getTimeFromTimeStamp(
        dateFrom.toString(), dateFormat ?? kAppDateFormat);
  }

  mSelectDateTo() async {
    DateTime? pickedDate = await showDatePicker(
      context: kGlobContext,
      initialDate: dateTo.value,
      firstDate: DateTime.now().subtract(const Duration(days: 364)),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      dateTo.value = pickedDate;
    }
  }

  void mUpdateDailyAttendanceTabItem() {
    isDailyAttendaceActive.value = true;
    isPeriodicAttendaceActive.value = false;
  }

  void mUpdatePeriodicAttendanceTabItem() {
    isDailyAttendaceActive.value = false;
    isPeriodicAttendaceActive.value = true;
  }

  mGetAttendanceInRange() async {
    /* kLog(
        "start: ${mGetFormatDate(dateFrom, kApiDateFormat)} end: ${mGetFormatDate(dateTo, kApiDateFormat)}"); */
    stuAttendanceList.clear();
    stuAttendanceList.value = await StuAttendanceApis.mGetStuAttendanceList(
      PayLoads.stuDateWiseAttendanceList(
        api_access_key: AppData.api_access_key,
        date_range: jsonEncode(PayLoads.dateRange(
            start: mGetFormatDate(dateFrom, kApiDateFormat),
            // start: mGetFormatDate("2019-10-15", kApiDateFormat),
            end: mGetFormatDate(dateTo, kApiDateFormat))),
            // end: mGetFormatDate("2023-11-14", kApiDateFormat))),
      ),
      token.value,
    );
    numOfNoticesInRange.value =
        stuAttendanceList.isEmpty ? 0 : stuAttendanceList.length;
  }
}
