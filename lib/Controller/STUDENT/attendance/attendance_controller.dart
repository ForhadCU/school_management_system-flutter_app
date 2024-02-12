import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Api/STUDENT/attendance/attendance_api.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../../Config/config.dart';
import '../../../Model/STUDENT/attendance/attend_list_model.dart';
import '../../../Singletones/app_data.dart';
import '../../../Utils/api structure/payloads.dart';
import '../../../Utils/custom_utils.dart';

class StuAttendanceController extends GetxController {
  var selectedAttendanceStatus = "Present".obs;

  static StuAttendanceController get to => Get.find();

  /// variable declaration
  var endDate = DateTime.now().obs;
  var startDate = DateTime.now().subtract( Duration(days: (DateTime.now().day))).obs;
  var isDailyAttendaceTabActive = true.obs;
  // var isPeriodicAttendaceActive = false.obs;
  var numOfNoticesInRange = 0.obs;
  // RxList<StuAttendanceModel> stuAttendanceList = <StuAttendanceModel>[].obs;
  var stuAttendanceListModel = AttendanceListModel().obs;
  var stuAttendanceList = <AttendanceListModelData>[].obs;
  var token = "".obs;
  var pageNumber = 1.obs;
  var attendanceListScrollCntrlr = ScrollController().obs;
  var isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    token.value = await AppLocalDataFactory.mGetToken();
    isLoading.value = true;
    await mGetAttendanceInRange();
    isLoading.value = false;
    attendanceListScrollCntrlr.value.addListener(() {
      if (attendanceListScrollCntrlr.value.offset ==
          attendanceListScrollCntrlr.value.position.maxScrollExtent) {
        if (stuAttendanceListModel.value.nextPageUrl != null) {
          kLog("go next page");
          kLog(stuAttendanceListModel.value.currentPage!);
          /*  pageNumber.value =  */ pageNumber.value++;
          mGetAttendanceInRange();
        } else {
          kLog("end");
        }
        kLog("Reached to End");
        // kLog(noticeApiModel.value.);
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// code goes here
  mSelectDateFrom() async {
    DateTime? pickedDate = await showDatePicker(
      context: kGlobContext,
      initialDate: startDate.value,
      firstDate: DateTime.now().subtract(Duration(days: 2000)),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      startDate.value = pickedDate;
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
      initialDate: endDate.value,
      firstDate: DateTime.now().subtract(Duration(days: 2000)),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      endDate.value = pickedDate;
    }
  }

  void mUpdateDailyAttendanceTabItem() {
    mResetValues();
    isDailyAttendaceTabActive.value = !isDailyAttendaceTabActive.value;
  }

  void mUpdatePeriodicAttendanceTabItem() {
    isDailyAttendaceTabActive.value = !isDailyAttendaceTabActive.value;
  }

  mGetAttendanceInRange() async {
    /* kLog(
        "start: ${mGetFormatDate(dateFrom, kApiDateFormat)} end: ${mGetFormatDate(dateTo, kApiDateFormat)}"); */
    // stuAttendanceList != null ? stuAttendanceList.clear() : null;
    stuAttendanceListModel.value =
        await StuAttendanceApis.mGetStuAttendanceListModel(
      PayLoads.stuDateWiseAttendanceList(
        page: pageNumber.value.toString(),
        api_access_key: AppData.api_access_key,
        date_range: jsonEncode(PayLoads.dateRange(
            start: mGetFormatDate(startDate, kApiDateFormat),
            // start: mGetFormatDate("2019-10-15", kApiDateFormat),
            end: mGetFormatDate(endDate, kApiDateFormat))),
        // end: mGetFormatDate("2023-11-14", kApiDateFormat))),
      ),
      token.value,
    );
    stuAttendanceList.addAll(stuAttendanceListModel.value.data!);
    numOfNoticesInRange.value =
        stuAttendanceList.isEmpty ? 0 : stuAttendanceList.length;
  }

  void mResetValues() {
    stuAttendanceList.clear();
    pageNumber.value = 1;
    numOfNoticesInRange.value = 0;
  }
}
