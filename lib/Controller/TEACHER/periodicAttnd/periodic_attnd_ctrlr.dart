import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Api/TEACHER/periodic_attnd_api.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Model/TEACHER/period_model.dart';
import 'package:school_management_system/Model/TEACHER/save_periodic_attend_model.dart';
import 'package:school_management_system/Singletones/app_data.dart';
import 'package:school_management_system/Utils/api%20structure/payloads.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../../Model/PUBLIC/login/academic_group_model.dart';
import '../../../Model/TEACHER/periodic_attnd_model.dart';
import '../../../Utils/custom_utils.dart';

class TeachPeriodicAttendanceController extends GetxController {
  static TeachPeriodicAttendanceController get to => Get.find();
  var academicGroup = AcademicGroup();
  // var attendanceDate = "2024-02-07".obs;
  var selectedPeriodModel = PeriodData();
  var token = "";
  var teachPeriodModel = TeachPeriodModel().obs;
  var periodDataList = <PeriodData>[].obs;
  var selectedPeriodData = PeriodData().obs;
  var teachPeriodicAttendanceModel = TeachPeriodicAttendanceModel().obs;
  var periodicAttendanceDataList = <PeriodicAttendanceData>[].obs;
  var presentStatus = true.obs;
  var leaveStatus = true.obs;
  var absenttStatus = true.obs;
  var paginate = 10.obs;
  var attendanceDate = DateTime.now().obs;
  var scrollCtrlr = ScrollController().obs;
  var pageNumber = 1.obs;
  var isAttendanceModified = false.obs;

  @override
  void onInit() async {
    super.onInit();
    // mResetList();
    await mGetInitialData();
    await mGetPeriodModel();
    await mGetPeriodicAttendanceModel();
    // await mSavePeriodicAttendance();

    scrollCtrlr.value.addListener(() async {
      if (scrollCtrlr.value.offset ==
          scrollCtrlr.value.position.maxScrollExtent) {
        if (teachPeriodicAttendanceModel.value.nextPageUrl != null) {
          kLog("go next page");
          kLog(teachPeriodicAttendanceModel.value.currentPage!);
          pageNumber.value++;
          await mGetPeriodicAttendanceModel();
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
    // TODO: implement onClose
    super.onClose();
    
    mResetList();
  }

  void mResetList() {
    periodicAttendanceDataList.clear();
    pageNumber.value = 1;
    isAttendanceModified.value = false;
  }
  /* mGetAttendanceInRange() async {
    /* kLog(
        "start: ${mGetFormatDate(dateFrom, kApiDateFormat)} end: ${mGetFormatDate(dateTo, kApiDateFormat)}"); */
    stuAttendanceList.value != null ? stuAttendanceList.value!.clear() : null;
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
    if (stuAttendanceList.value == null) {
      numOfNoticesInRange.value = stuAttendanceList.value!.isEmpty
          ? 0
          : stuAttendanceList.value!.length;
    }
  } */

  mSelectDateFrom() async {
    DateTime? pickedDate = await showDatePicker(
      context: kGlobContext,
      initialDate: attendanceDate.value,
      firstDate: DateTime.now().subtract(const Duration(days: 364)),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      attendanceDate.value = pickedDate;
      periodDataList.clear();
      await mGetPeriodModel();
      mResetList();
    }
  }

  String mGetFormatDate(dynamic dateFrom, [String? dateFormat]) {
    // return Utils().getTimeFromTimeStamp(dateFrom.toString(), "dd-MM-yyyy");
    return Utils().getTimeFromTimeStamp(
        dateFrom.toString(), dateFormat ?? kAppDateFormat);
  }

  mGetPeriodModel() async {
    teachPeriodModel.value = await TeachPeriodicAttendanceApis.mGetPeriodModel(
        PayLoads.teachPeriodList(
            api_access_key: AppData.api_access_key,
            academic_group_id: academicGroup.id.toString(),
            att_date: Utils().getTimeFromTimeStamp(
                attendanceDate.value.toString(), kApiDateFormat)),
        token);

    periodDataList
        .addAll(teachPeriodModel.value.periodDataList ?? <PeriodData>[]);
    selectedPeriodData.value = periodDataList.first;
  }

  mGetPeriodicAttendanceModel() async {
    kLog(presentStatus.value);
    teachPeriodicAttendanceModel.value =
        await TeachPeriodicAttendanceApis.mGetPeriodicAttendanceModel(
            PayLoads.teachPeriodicAttend(
                api_access_key: AppData.api_access_key,
                academic_group_id: academicGroup.id.toString(),
                // routine_allocation_id: selectedPeriodModel.id.toString(),
                routine_allocation_id: 3576.toString(),
                att_date: Utils().getTimeFromTimeStamp(
                    attendanceDate.value.toString(), kApiDateFormat),
                present: presentStatus.value ? 1.toString() : 0.toString(),
                leave: leaveStatus.value ? 1.toString() : 0.toString(),
                absent: absenttStatus.value ? 1.toString() : 0.toString(),
                paginate: paginate.value.toString()),
            token);
    periodicAttendanceDataList.addAll(
        teachPeriodicAttendanceModel.value.periodicAttendanceDataList ??
            <PeriodicAttendanceData>[]);
  }

  mSavePeriodicAttendance() async {
    if (periodicAttendanceDataList.isNotEmpty) {
      var modelList = <Map<String, dynamic>>[];
      for (PeriodicAttendanceData item in periodicAttendanceDataList) {
        var model = item.toMap();
        modelList.add(model);
      }

      var modified = TeachsavePeriodicAttendanceModel.fromMap(
          {"manualAttendanceList": modelList});

      await TeachPeriodicAttendanceApis.mSavePeriodicAttendance(
          payload: PayLoads.teachSavePeriodicAttend(
              api_access_key: AppData.api_access_key,
              academic_group_id: academicGroup.id.toString(),
              // routine_allocation_id: selectedPeriodModel.id.toString(),
              routine_allocation_id: 3576.toString(),
              att_date: Utils().getTimeFromTimeStamp(
                  attendanceDate.value.toString(), kApiDateFormat)),
          endPoint: ApiEndpoint.teachSavePeriodicAttend,
          bodyData: modified.toMap(),
          token: token);
    }
  }

  mGetInitialData() async {
    token = await AppLocalDataFactory.mGetToken();
    academicGroup = await AppLocalDataFactory.mGetAcademicGroupModel();
  }

  void mUpdateAttendanceList(PeriodicAttendanceData item) {
    periodicAttendanceDataList[periodicAttendanceDataList.indexOf(item)]
        .present = item.present == 0 ? 1 : 0;
    periodicAttendanceDataList.refresh();
    isAttendanceModified.value = true;
  }

  void mUpdateSelectedPeriodicData(PeriodData? selectedModel) {
    if (selectedPeriodData.value != selectedModel) {
      selectedPeriodData.value = selectedModel!;
      mResetList();
    }
  }

  void mModifiedAbsentStatus(bool? value) {
    absenttStatus.value = value!;
    mResetList();
  }

  void mModifiedPresentStatus(bool? value) {
    presentStatus.value = value!;
    mResetList();
  }

  void mModifiedLeaveStatus(bool? value) {
    leaveStatus.value = value!;
    mResetList();
  }
}
