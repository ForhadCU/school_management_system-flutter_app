import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Api/TEACHER/attendance_api.dart';
import 'package:school_management_system/Model/PUBLIC/login/academic_group_model.dart';
import 'package:school_management_system/Model/TEACHER/class_group_model.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../../Config/config.dart';
import '../../../Model/STUDENT/attendance/attend_list_model.dart';
import '../../../Singletones/app_data.dart';
import '../../../Utils/api structure/payloads.dart';
import '../../../Utils/custom_utils.dart';

class TeachAttendanceController extends GetxController {
  var selectedAttendanceStatus = "Present".obs;

  static TeachAttendanceController get to => Get.find();

  /// variable declaration
  var endDate = DateTime.now().obs;
  var startDate =
      DateTime.now().subtract(Duration(days: (DateTime.now().day))).obs;
  var isDailyAttendaceTabActive = true.obs;
  // var isPeriodicAttendaceActive = false.obs;
  var numOfNoticesInRange = 0.obs;
  // RxList<StuAttendanceModel> stuAttendanceList = <StuAttendanceModel>[].obs;
  var teachAttendanceListModel = AttendanceListModel().obs;
  var teachAttendanceList = <AttendanceListModelData>[].obs;
  var token = "".obs;
  var pageNumber = 1.obs;
  var attendanceListScrollCntrlr = ScrollController().obs;
  var isLoading = false.obs;
  var academicGroup = AcademicGroup().obs;

  @override
  void onInit() async {
    super.onInit();
    token.value = await AppLocalDataFactory.mGetToken();
    academicGroup.value = await AppLocalDataFactory.mGetAcademicGroupModel();
    isLoading.value = true;
    await mGetAttendanceInRange();
    isLoading.value = false;
    attendanceListScrollCntrlr.value.addListener(() {
      if (attendanceListScrollCntrlr.value.offset ==
          attendanceListScrollCntrlr.value.position.maxScrollExtent) {
        if (teachAttendanceListModel.value.nextPageUrl != null) {
          kLog("go next page");
          kLog(teachAttendanceListModel.value.currentPage!);
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
    return Utils()
        .getFormatedDateTime(dateFrom.toString(), dateFormat ?? kAppDateFormat);
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
    teachAttendanceListModel.value =
        await TeachAttendanceApis.mGetAttendanceListModel(
      PayLoads.teachAttendance(
          page: pageNumber.value.toString(),
          api_access_key: AppData.api_access_key,
          date_range: jsonEncode(PayLoads.dateRange(
              start: mGetFormatDate(startDate, kApiDateFormat),
              // start: mGetFormatDate("2019-10-15", kApiDateFormat),
              end: mGetFormatDate(endDate, kApiDateFormat))),
          academic_group_id: academicGroup.value.id.toString()
          // end: mGetFormatDate("2023-11-14", kApiDateFormat))),
          ),
      token.value,
    );
    teachAttendanceList.addAll(teachAttendanceListModel.value.data!);
    numOfNoticesInRange.value =
        teachAttendanceList.isEmpty ? 0 : teachAttendanceList.length;
  }

  void mResetValues() {
    teachAttendanceList.clear();
    pageNumber.value = 1;
    numOfNoticesInRange.value = 0;
  }
}
