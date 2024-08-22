import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Views/test/dummy_model.dart';

import '../../../Utils/custom_utils.dart';

class TeachLeaveController extends GetxController {
  var isApplyApplicationBtn = true.obs;

  var selectedDummyValueModel = DummyValueModel().obs;

  var dummyValueModelList = <DummyValueModel>[].obs;

  var leaveAppDateRangeEditTextCtrlr = TextEditingController();
  var leaveAppDateRange = "Select Date Range*".obs;
  var leaveAppSearchStartDate = "Select From Date*".obs;

  var leaveAppReasonEditTextCtrlr;

  static TeachLeaveController get to => Get.find();

  var isLeaveApplicationActive = true.obs;
  var isLeaveBalanceActive = false.obs;

  void mUpdateLeaveApplicationTabItem() {
    isLeaveApplicationActive.value = true;
    isLeaveBalanceActive.value = false;
  }

  void mUpdateLeaveBalanceTabItem() {
    isLeaveApplicationActive.value = false;
    isLeaveBalanceActive.value = true;
  }

  void mUpdateDummyValueModel(DummyValueModel? selectedModel) {}

  void UpdateLeaveAppDateRange(DateTimeRange? dateTimeRange) {
    if (dateTimeRange != null) {
      String startDate = Utils()
          .getFormatedDateTime(dateTimeRange.start.toString(), kAppDateFormat);
      String endDate = Utils()
          .getFormatedDateTime(dateTimeRange.end.toString(), kAppDateFormat);
      leaveAppDateRange.value = "$startDate - $endDate";
    }
  }

  void mUpdateleaveAppSearchStartDate(DateTime? selectedDate) {
    if (selectedDate != null) {
      String startDate =
          Utils().getFormatedDateTime(selectedDate.toString(), kAppDateFormat);

      leaveAppSearchStartDate.value = startDate;
    }
  }
}
