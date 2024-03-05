import 'dart:typed_data';

import 'package:school_management_system/Model/STUDENT/payments/fee_details.dart';

import '../../../Config/config.dart';
import '../../../Model/response_model.dart';
import '../../../Utils/utils.dart';

class PaymentsApi {
  // make this class singleton
  PaymentsApi._internal();
  static final PaymentsApi _singleton = PaymentsApi._internal();
  factory PaymentsApi() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<StuFeeDetailsModel> mGetFeeDetails(
      Map<String, dynamic> payLoad, token) async {
    ResponseModel res =
        await CallAPI.getStudentData(ApiEndpoint.stuDemandSlip, payLoad, token);
    if (res.statusCode == 200) {
      // kLogger.d(res.body);

      kLog("Successfully fetch mGetFeeDetails data");
      return StuFeeDetailsModel.fromMap(res.body);
    } else {
      kLog("mGetFeeDetails status code is: ${res.statusCode}");
      showError("Server failure");
      return StuFeeDetailsModel();
    }
  }

  static Future<Uint8List?> mGetDemandSlipPdf(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.postStudentData(
        ApiEndpoint.stuDemandSlipPdf, payLoad, token, true);
    // kLogger.d(res.body);
    if (res.statusCode == 200 /* && res.body['mode'] == "success" */) {
      kLog("Successfully fetch mGetExamRoutinePdf data");
      // kLog(res.body);
      return res.body;
    } else {
      hideLoading();
      showError("Server failure");
      kLog("status code is: ${res.statusCode}");
      return null;
    }
  }

  static Future<Uint8List?> mGetBankSlipPdf(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.postStudentData(
        ApiEndpoint.stuBackSlipPdf, payLoad, token, true);
    // kLogger.d(res.body);
    if (res.statusCode == 200 /* && res.body['mode'] == "success" */) {
      kLog("Successfully fetch mGetBankSlipPdf data");
      // kLog(res.body);
      return res.body;
    } else {
      hideLoading();
      showError("Server failure");
      kLog("status code is: ${res.statusCode}");
      return null;
    }
  }
}
