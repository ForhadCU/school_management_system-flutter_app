import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system/Api/PUBLIC/notice_api.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/PUBLIC/landing_controller.dart';
import 'package:school_management_system/Model/PUBLIC/notice/notice_api_model.dart';
import 'package:school_management_system/Model/PUBLIC/searchSchool/site_list_model.dart';
import 'package:school_management_system/Singletones/app_data.dart';
import 'package:school_management_system/Utils/api%20structure/payloads.dart';
import 'package:school_management_system/Utils/custom_utils.dart';

class NoticeController extends GetxController {
  static NoticeController get to => Get.find();

  var dropdownValue = Rxn<String>();
  var dateFrom = DateTime.now().obs;
  var dateTo = DateTime.now().subtract(Duration(days: 7)).obs;
  var numOfNoticesInRange = 0.obs;
  Rx<NoticeApiModel> noticeApiModel = NoticeApiModel().obs;
  var siteListModel = SitelistModel().obs;
  var initialPagination = 10;
  Rx<Datum> clickedNoticeModel = Datum().obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    _mInitialization();
    await mGetNoticesInRange();
  }

  void mUpdateDropdownValue(String s) {
    dropdownValue.value = s;
  }

  void _mInitialization() {
    siteListModel.value = LandingController.to.siteListModel.value;
    print("siteListModel: ${siteListModel.value.id}");
  }

  String mGetFormatDate(dynamic dateFrom) {
    // return Utils().getTimeFromTimeStamp(dateFrom.toString(), "dd-MM-yyyy");
    return Utils().getTimeFromTimeStamp(dateFrom.toString(), kAppDateFormat);
  }

  mGetNoticesInRange() async {
    noticeApiModel.value = await NoticeApi.mGetNoticeApiModeldata(
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
