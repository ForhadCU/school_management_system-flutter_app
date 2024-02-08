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

import '../../Api/STUDENT/notice/notice_api.dart';
import '../../Utils/utils.dart';

class NoticeController extends GetxController {
  static NoticeController get to => Get.find();

  var dropdownValue = Rxn<String>();
  var dateTo = DateTime.now().obs;
  var dateFrom = DateTime.now().subtract(const Duration(days: 7)).obs;
  var numOfNoticesInRange = 0.obs;
  Rx<NoticeApiModel> noticeApiModel = NoticeApiModel().obs;
  var noticeList = <Datum>[].obs;
  var siteListModel = SitelistModel().obs;
  var initialPagination = 10;
  Rx<Datum> clickedNoticeModel = Datum().obs;
  var token = Rxn<String>();
  var noticeListScrollCntrlr = ScrollController().obs;
  var pageNumber = 1.obs;

  @override
  void onInit() async {
    super.onInit();
    /*  _mInitialization();
     */
    await _mInitialization();
    await mGetNoticesInRange();
    noticeListScrollCntrlr.value.addListener(() {
      if (noticeListScrollCntrlr.value.offset ==
          noticeListScrollCntrlr.value.position.maxScrollExtent) {
        if (noticeApiModel.value.nextPageUrl != null) {
          kLog("go next page");
          kLog(noticeApiModel.value.currentPage!);
          /*  pageNumber.value =  */ pageNumber.value++;
          mGetNoticesInRange();
        } else {
          kLog("end");
        }
        kLog("Reached to End");
        // kLog(noticeApiModel.value.);
      }
    });
  }

  void mUpdateDropdownValue(String s) {
    dropdownValue.value = s;
  }

  _mInitialization() async {
    token.value = await AppLocalDataFactory.mGetToken();
    siteListModel.value = await AppLocalDataFactory.mGetSiteListModel();
    print("Current userid is: ${siteListModel.value.id}");
  }

  String mGetFormatDate(dynamic dateFrom) {
    // return Utils().getTimeFromTimeStamp(dateFrom.toString(), "dd-MM-yyyy");
    return Utils().getTimeFromTimeStamp(dateFrom.toString(), kAppDateFormat);
  }

  String mGetFormatDateForApi(dynamic date) {
    return Utils().getTimeFromTimeStamp(date.toString(), kApiDateFormat);
  }

  mGetNoticesInRange() async {
    kLog("Date From: ${mGetFormatDate(dateFrom)}");
    kLog("Date to: ${mGetFormatDate(dateTo)}");
    noticeApiModel.value = await StuNoticeApi.mGetNoticeApiModeldata(
        PayLoads.allNotice(
            api_access_key: AppData.api_access_key,
            page: pageNumber.value.toString(),
            site_id: siteListModel.value.id!.toString(),
            paginate: initialPagination.toString(),
            date_range: jsonEncode(PayLoads.dateRange(
                start: mGetFormatDateForApi(dateFrom),
                end: mGetFormatDateForApi(dateTo))),
            status: 1.toString()));

    if (noticeApiModel.value.data != null) {
      noticeList.addAll(noticeApiModel.value.data!);
      numOfNoticesInRange.value = noticeList.length;
    }
  }

  mSelectDateFrom() async {
    DateTime? pickedDate = await showDatePicker(
      context: kGlobContext,
      initialDate: dateFrom.value,
      firstDate: DateTime.now().subtract(Duration(days: 2000)),
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
      firstDate: DateTime.now().subtract(Duration(days: 2000)),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      dateTo.value = pickedDate;
    }
  }

  void mUpdateClickedNoticeModel(Datum data) {
    clickedNoticeModel.value = data;
  }

  void mResetList() {
    noticeList.clear();
    pageNumber.value = 1;
    numOfNoticesInRange.value = 0;
  }
}
