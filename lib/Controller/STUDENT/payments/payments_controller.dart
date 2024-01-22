import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Api/STUDENT/payments/payments_api.dart';
import 'package:school_management_system/Model/STUDENT/payments/fee_details.dart';
import 'package:school_management_system/Singletones/app_data.dart';
import 'package:school_management_system/Utils/api%20structure/payloads.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../../Config/config.dart';
import '../../../Utils/custom_utils.dart';

class StuPaymentsController extends GetxController {
  static StuPaymentsController get to => Get.find();

  /// variable declaration
  var isBkashBtnClicked = false.obs;
  var isNagadBtnClicked = false.obs;
  var isCellFinBtnClicked = false.obs;
  var isFeeDetails = false.obs;
  // var isFeeDetails = true.obs;
  var selectedPaymentMethod = "Academic Payment (by Transaction id)".obs;

  var isMakePaymentTabActive = true.obs;
  var isPaymentHistoryTabActive = false.obs;

  var isFeeDetailsActive = false.obs;
  var isPaymentByTransactionId = true.obs;
  // var isByWalet = true.obs;
  var isPaymentByWalet = false.obs;
  var paymentHistoryList = Rxn<List<Map<String, dynamic>>>();
  var dateFrom = DateTime.now().obs;
  var dateTo = DateTime.now().subtract(const Duration(days: 7)).obs;
  var token = "";

  var feeDetailsModel = Rxn<StuFeeDetailsModel>();

  @override
  void onInit() async {
    super.onInit();
    kLog("Payments View");

    await mGetPaymentHistory();
    token = await AppLocalDataFactory.mGetToken();
    await mGetFeeDetails();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void mClickedBkashBtn() {
    isNagadBtnClicked.value = false;
    isCellFinBtnClicked.value = false;
    isBkashBtnClicked.value = true;
  }

  void mClickedNagadBtn() {
    isBkashBtnClicked.value = false;
    isCellFinBtnClicked.value = false;
    isNagadBtnClicked.value = true;
  }

  void mClickedCellfinBtn() {
    isNagadBtnClicked.value = false;
    isBkashBtnClicked.value = false;
    isCellFinBtnClicked.value = true;
  }

  mGetPaymentHistory() async {
    paymentHistoryList.value = [
      {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"},
      /*   {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"}, */
    ];
  }

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

  void mUpdateFeeDetails() {
    isFeeDetails.value = !isFeeDetails.value;
  }

  void mUpdateMakePaymentTabItem() {
    isMakePaymentTabActive.value = true;
    isPaymentHistoryTabActive.value = false;
  }

  void mUpdatePaymentHistoryTabItem() {
    isMakePaymentTabActive.value = false;
    isPaymentHistoryTabActive.value = true;
  }

  mGetFeeDetails() async {
    feeDetailsModel.value = await PaymentsApi.mGetFeeDetails(
        PayLoads.stuPaymentDemandSlip(api_access_key: AppData.api_access_key),
        token);
  }

  /// code goes here
}
