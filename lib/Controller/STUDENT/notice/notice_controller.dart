import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Api/STUDENT/notice/notice_api.dart';
import '../../../Config/config.dart';
import '../../../Model/PUBLIC/notice/notice_api_model.dart';
import '../../../Model/PUBLIC/searchSchool/site_list_model.dart';
import '../../../Singletones/app_data.dart';
import '../../../Utils/api structure/payloads.dart';
import '../../../Utils/custom_utils.dart';
import '../../PUBLIC/landing_controller.dart';

class StuNoticeController extends GetxController {
  static StuNoticeController get to => Get.find();
  var dropdownValue = Rxn<String>();
  var dateFrom = DateTime.now().obs;
  var dateTo = DateTime.now().subtract(const Duration(days: 7)).obs;
  var numOfNoticesInRange = 0.obs;
  Rx<NoticeApiModel> noticeApiModel = NoticeApiModel().obs;
  var siteListModel = SitelistModel().obs;
  var initialPagination = 10;
  Rx<Datum> clickedNoticeModel = Datum().obs;

  @override
  void onInit() async {
    super.onInit();
    _mInitialization();
    await mGetNoticesInRange();
  }

  void mUpdateDropdownValue(String s) {
    dropdownValue.value = s;
  }

  void _mInitialization() {
    siteListModel.value = LandingController.to.siteListModel.value;
    kLog("siteListModel: ${siteListModel.value.id}");
  }

  String mGetFormatDate(dynamic dateFrom) {
    // return Utils().getTimeFromTimeStamp(dateFrom.toString(), "dd-MM-yyyy");
    return Utils().getTimeFromTimeStamp(dateFrom.toString(), kAppDateFormat);
  }

  mGetNoticesInRange() async {
    noticeApiModel.value = await StuNoticeApi.mGetNoticeApiModeldata(
        PayLoads.allNotice(
            api_access_key: AppData.api_access_key,
            site_id: siteListModel.value.id!.toString(),
            paginate: initialPagination.toString(),
            date_range: jsonEncode(PayLoads.dateRange(
                start: mGetFormatDate(dateFrom), end: mGetFormatDate(dateTo))),
            status: 1.toString()));
    numOfNoticesInRange.value = noticeApiModel.value.data == null
        ? 0
        : noticeApiModel.value.data!.length;
  }

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

  void mUpdateClickedNoticeModel(Datum data) {
    clickedNoticeModel.value = data;
  }
}
