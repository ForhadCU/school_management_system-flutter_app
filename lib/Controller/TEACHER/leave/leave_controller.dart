import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Api/TEACHER/leave_api.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Model/TEACHER/leave/leave_history_list_model.dart';
import 'package:school_management_system/Singletones/app_data.dart';
import 'package:school_management_system/Utils/api%20structure/payloads.dart';
import 'package:school_management_system/Views/test/dummy_model.dart';

import '../../../Model/TEACHER/leave/leave_balance_list_model.dart';
import '../../../Model/TEACHER/leave/leave_type_and_category_model.dart';
import '../../../Utils/custom_utils.dart';
import '../../../Utils/utils.dart';

class TeachLeaveController extends GetxController {
  static TeachLeaveController get to => Get.find();
  var selectedLeaveApplyLeaveTypeModel = LeaveTypeAndCategoryModel().obs;
  var leaveApplyLeaveTypeModelList = <LeaveTypeAndCategoryModel>[].obs;
  var selectedLeaveApplyLeaveCategoryModel = LeaveTypeAndCategoryModel().obs;
  var leaveApplyLeaveCategoryModelList = <LeaveTypeAndCategoryModel>[].obs;
  var selectedLeaveAppSearchLeaveTypeModel = LeaveTypeAndCategoryModel().obs;
  var leaveAppSearchLeaveTypeModelList = <LeaveTypeAndCategoryModel>[].obs;
  var selectedLeaveAppSearchLeaveCategoryModel =
      LeaveTypeAndCategoryModel().obs;
  var leaveAppSearchLeaveCategoryModelList = <LeaveTypeAndCategoryModel>[].obs;
  var selectedLeaveBalanceSearchLeaveTypeModel =
      LeaveTypeAndCategoryModel().obs;
  var leaveBalanceSearchLeaveTypeModelList = <LeaveTypeAndCategoryModel>[].obs;
  var selectedLeaveBalanceSearchLeaveCategoryModel =
      LeaveTypeAndCategoryModel().obs;
  var leaveBalanceSearchLeaveCategoryModelList =
      <LeaveTypeAndCategoryModel>[].obs;
  var dummyValueModelList = <DummyValueModel>[].obs;
  var selectedDummyValueModel = DummyValueModel().obs;
  var leaveAppSearchResultList = <LeaveHistoryData>[].obs;
  var leaveAppSearchResultListModel = LeaveHistory().obs;
  // var leaveBalanceSearchResultListModel = LeaveHistoryListModel().obs;
  var leaveBalanceSearchResultList = <LeaveBalanceList>[].obs;

  // var leaveAppDateRangeEditTextCtrlr = TextEditingController();
  var leaveApplyFormatedDateRange = "Select Date Range*".obs;
  DateTimeRange? leaveApplyDateRange;
  // DateTime? leaveAppSearchStartDate;
  var leaveApplyDateRangeStartDate;
  var leaveApplyDateRangeEndDate;
  var leaveAppSearchFormatedStartDate = "Select From Date*".obs;
  // var leaveAppSearchStartDate = "".obs;
  var leaveAppSearchStartDate;
  var leaveApplyReasonEditTextCtrlr = TextEditingController();

  var leaveTypeAndCatListPaginate = 10;
  var leaveAppSearchResultPaginate = 5;
  var leaveBalanceSearchResultPaginate = 10.obs;
  var leaveAppSearchResulPageNumber = 1.obs;
  var leaveBalanceSearchResulPageNumber = 1.obs;

  var isLeaveApplicationActive = true.obs;
  var isLeaveBalanceActive = false.obs;
  var academicGroupId = ''.obs;
  var token = ''.obs;
  var applicationAddId = 0;
  var isApplyApplicationBtn = true.obs;
  var LeaveAppSearchPaginationCtrlr = ScrollController().obs;
  var LeaveBalanceSearchPaginationCtrlr = ScrollController().obs;
  var isApplicationUpdate = false.obs;

  @override
  void onInit() async {
    super.onInit();

    await _mGetInitialData();
    mLeaveAppSearchPaginationListener();
  }

  mGetAcademicGroupModel() async {
    await AppLocalDataFactory.mGetAcademicGroupModel()
        .then((value) => academicGroupId.value = value.id.toString());
    kLog(academicGroupId.value);
  }

  mGetToken() async {
    token.value = await AppLocalDataFactory.mGetToken();
  }

  void mUpdateLeaveApplicationTabItem() {
    isLeaveApplicationActive.value = true;
    isLeaveBalanceActive.value = false;
  }

  void mUpdateLeaveBalanceTabItem() {
    isLeaveApplicationActive.value = false;
    isLeaveBalanceActive.value = true;
  }

  void mUpdateDummyValueModel(DummyValueModel? selectedModel) {}

  mUpdateLeaveApplyDateRange(DateTimeRange? dateTimeRange) {
    if (dateTimeRange != null) {
      leaveApplyDateRange = dateTimeRange;
      String leaveApplyDateRangeStartDate = Utils()
          .getFormatedDateTime(dateTimeRange.start.toString(), kAppDateFormat);
      String leaveApplyDateRangeEndDate = Utils()
          .getFormatedDateTime(dateTimeRange.end.toString(), kAppDateFormat);
      leaveApplyFormatedDateRange.value =
          "$leaveApplyDateRangeStartDate - $leaveApplyDateRangeEndDate";
    }
  }

  void mUpdateleaveAppSearchStartDate(DateTime? selectedDate) {
    if (selectedDate != null) {
      leaveAppSearchStartDate =
          Utils().getFormatedDateTime(selectedDate.toString(), kApiDateFormat);

      String startDate =
          Utils().getFormatedDateTime(selectedDate.toString(), kAppDateFormat);

      leaveAppSearchFormatedStartDate.value = startDate;
    }
  }

  void mUpdateLeaveApplyLeaveCategoryDropdownDropDown(
      LeaveTypeAndCategoryModel? selectedModel) {
    if (selectedLeaveApplyLeaveCategoryModel.value != selectedModel) {
      selectedLeaveApplyLeaveCategoryModel.value = selectedModel!;
    }
  }

  void mUpdateLeaveApplyLeaveTyperopDown(
      LeaveTypeAndCategoryModel? selectedModel) {
    if (selectedLeaveApplyLeaveTypeModel.value != selectedModel) {
      selectedLeaveApplyLeaveTypeModel.value = selectedModel!;
    }
  }

  mSubmitLeaveApplication() async {
    await LeaveApis.mSubmitLeaveApplication(
        token: token.value,
        payload: PayLoads.leaveTypeApplicationSubmit(
            academic_group_id: academicGroupId.value,
            api_access_key: AppData.api_access_key,
            academic_leave_type_id:
                selectedLeaveApplyLeaveTypeModel.value.id.toString(),
            academic_leave_category_id:
                selectedLeaveApplyLeaveCategoryModel.value.id.toString(),
            id: applicationAddId.toString(),
            date_range: jsonEncode(PayLoads.dateRange(
                start: mGetFormatDateForApi(leaveApplyDateRange!.start),
                end: mGetFormatDateForApi(leaveApplyDateRange!.end))),
            status: 1.toString()));
    // reset dateRange
    leaveApplyFormatedDateRange.value = "Select Date Range*";
    // if update button was ON, that will be turned into SAVE button
    isApplicationUpdate.value = false;
  }

  String mGetFormatDateForApi(dynamic date) {
    return Utils().getFormatedDateTime(date.toString(), kApiDateFormat);
  }

  _mGetInitialData() async {
    await mGetToken();
    await mGetAcademicGroupModel();
    await mGetLeaveTypeAndCategory();
  }

  mGetLeaveTypeAndCategory() async {
    await LeaveApis.mGetLeaveTypeAndCategory(
            payLoad: PayLoads.leaveTypeAndCategory(
                academic_group_id: academicGroupId.value,
                api_access_key: AppData.api_access_key,
                paginate: leaveTypeAndCatListPaginate.toString()),
            token: token.value)
        .then((value) {
      if (value.leaveTypeList != null && value.leaveTypeList!.isNotEmpty) {
        leaveApplyLeaveTypeModelList.value = value.leaveTypeList!;
        selectedLeaveApplyLeaveTypeModel.value = value.leaveTypeList!.first;
        leaveAppSearchLeaveTypeModelList.value = value.leaveTypeList!;
        selectedLeaveAppSearchLeaveTypeModel.value = value.leaveTypeList!.first;
        leaveBalanceSearchLeaveTypeModelList.value = value.leaveTypeList!;
        selectedLeaveBalanceSearchLeaveTypeModel.value =
            value.leaveTypeList!.first;
      }
      if (value.leaveCategoryList != null &&
          value.leaveCategoryList!.isNotEmpty) {
        leaveApplyLeaveCategoryModelList.value = value.leaveCategoryList!;
        selectedLeaveApplyLeaveCategoryModel.value =
            value.leaveCategoryList!.first;
        leaveAppSearchLeaveCategoryModelList.value = value.leaveCategoryList!;
        selectedLeaveAppSearchLeaveCategoryModel.value =
            value.leaveCategoryList!.first;
        leaveBalanceSearchLeaveCategoryModelList.value =
            value.leaveCategoryList!;
        selectedLeaveBalanceSearchLeaveCategoryModel.value =
            value.leaveCategoryList!.first;
      }
    });
  }

  void mUpdateLeaveAppSearchTypeDropDown(
      LeaveTypeAndCategoryModel? selectedModel) {
    if (selectedLeaveAppSearchLeaveTypeModel.value != selectedModel) {
      selectedLeaveAppSearchLeaveTypeModel.value = selectedModel!;
    }
  }

  void mUpdateLeaveAppSearchCategoryDropDown(
      LeaveTypeAndCategoryModel? selectedModel) {
    if (selectedLeaveAppSearchLeaveCategoryModel.value != selectedModel) {
      selectedLeaveAppSearchLeaveCategoryModel.value = selectedModel!;
    }
  }

  mGetLeaveHistory() async {
    // leaveAppSearchResultList.clear();
    await LeaveApis.mGetLeaveHistory(
            payLoad: PayLoads.leaveHistoryList(
                academic_group_id: academicGroupId.value,
                api_access_key: AppData.api_access_key,
                date: leaveAppSearchStartDate,
                academic_leave_type_id:
                    selectedLeaveAppSearchLeaveTypeModel.value.id.toString(),
                academic_leave_category_id:
                    selectedLeaveAppSearchLeaveCategoryModel.value.id
                        .toString(),
                leave_status: "",
                paginate: leaveAppSearchResultPaginate.toString(),
                page: leaveAppSearchResulPageNumber.value.toString()),
            token: token.value)
        .then((value) {
      if (value.leaveHistory != null &&
          value.leaveHistory!.dataList != null &&
          value.leaveHistory!.dataList!.isNotEmpty) {
        leaveAppSearchResultListModel.value =
            value.leaveHistory!; // Contain pageNumber

        leaveAppSearchResultList.addAll(value.leaveHistory!.dataList!);
      }
    });
  }

  mGetLeaveBalance() async {
    leaveBalanceSearchResultList.clear();

    await LeaveApis.mGetLeaveBalance(
            payLoad: PayLoads.leaveHistoryList(
                academic_group_id: academicGroupId.value,
                api_access_key: AppData.api_access_key,
                date: "",
                academic_leave_type_id: selectedLeaveBalanceSearchLeaveTypeModel
                    .value.id
                    .toString(),
                academic_leave_category_id:
                    selectedLeaveBalanceSearchLeaveCategoryModel.value.id
                        .toString(),
                leave_status: "",
                paginate: leaveBalanceSearchResultPaginate.value.toString(),
                page: leaveBalanceSearchResulPageNumber.value.toString()),
            token: token.value)
        .then((value) {
      if (value.leaveBalanceList != null &&
          value.leaveBalanceList != null &&
          value.leaveBalanceList!.isNotEmpty) {
        leaveBalanceSearchResultList.value = value.leaveBalanceList!;
      }
    });
  }

  void mUpdateLeaveBalanceLeaveTypeDropdown(
      LeaveTypeAndCategoryModel? selectedModel) {
    if (selectedLeaveBalanceSearchLeaveTypeModel.value != selectedModel) {
      selectedLeaveBalanceSearchLeaveTypeModel.value = selectedModel!;
    }
  }

  void mUpdateLeaveBalanceLeaveCategoryDropdown(
      LeaveTypeAndCategoryModel? selectedModel) {
    if (selectedLeaveBalanceSearchLeaveCategoryModel.value != selectedModel) {
      selectedLeaveBalanceSearchLeaveCategoryModel.value = selectedModel!;
    }
  }

  mLeaveAppSearchPaginationListener() {
    LeaveAppSearchPaginationCtrlr.value.addListener(() async {
      if (LeaveAppSearchPaginationCtrlr.value.offset ==
          LeaveAppSearchPaginationCtrlr.value.position.maxScrollExtent) {
        if (leaveAppSearchResultListModel.value.nextPageUrl != null) {
          kLog("go next page");
          kLog(leaveAppSearchResultListModel.value.currentPage!);
          /*  pageNumber.value =  */ leaveAppSearchResulPageNumber.value++;
          await mGetLeaveHistory();
        } else {
          kLog("end");
        }
        kLog("Reached to End");
        // kLog(noticeApiModel.value.);
      }
    });
  }

  void mUpdateLeaveApplication(LeaveHistoryData item) {
    kLogger.d(item.id);
    isApplicationUpdate.value = true;

    LeaveTypeAndCategoryModel leaveType = LeaveTypeAndCategoryModel.fromMap(item
        .siteEmployeeLeaveGenerate!.siteLeavePolicy!.academicLeaveType!
        .toMap());
    LeaveTypeAndCategoryModel leaveCategory = LeaveTypeAndCategoryModel.fromMap(
        item.siteEmployeeLeaveGenerate!.siteLeavePolicy!.academicLeaveCategory!
            .toMap());
    // set ApplicationId
    applicationAddId = item.id ?? 0;
    // set leaveType
    for (var element in leaveApplyLeaveTypeModelList) {
      if (element.id == leaveType.id) {
        selectedLeaveApplyLeaveTypeModel.value = element;
        kLogger.d(element.name);
      }
    }
    // set LeaveCategory
    for (var element in leaveApplyLeaveCategoryModelList) {
      if (element.id == leaveCategory.id) {
        selectedLeaveApplyLeaveCategoryModel.value = element;
        kLogger.d(element.name);
      }
    }

    mUpdateLeaveApplyDateRange(DateTimeRange(
        start: DateTime.parse(item.fromDate ?? ""), end: item.toDate!));
  }

  void mResetLeaveHistory() {
    leaveAppSearchResultList.clear();
    leaveAppSearchResulPageNumber.value = 1;
  }
}
