import 'dart:typed_data';

import 'package:school_management_system/Model/STUDENT/routine/period_type_model.dart';

import '../../../Config/config.dart';
import '../../../Model/response_model.dart';
import '../../../Utils/utils.dart';

class RoutineApis {
  // make this class singleton
  RoutineApis._internal();
  static final RoutineApis _singleton = RoutineApis._internal();
  factory RoutineApis() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances
  static Future<List<PeriodicTypeModel>> mGetPeriodicTypeList(
      Map<String, dynamic> payLoad, String token) async {
    kLogger.d(payLoad);
    ResponseModel res =
        await CallAPI.getStudentData(ApiEndpoint.stuPeriodType, payLoad, token);
    kLogger.d(res.body);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully read mGetPeriodicTypeList data");
      // kLog(res.body[StuHistoryModel.getDataListJsonKey]);

      return res.body[PeriodicTypeModel.getDataListJsonKey]
          .map<PeriodicTypeModel>((e) => PeriodicTypeModel.fromMap(e))
          .toList();
    } else {
      hideLoading();
      showError("Internal server error");
      //  return List<StuHistoryModel>();
      return <PeriodicTypeModel>[];
    }
  }

  static Future<Uint8List?> mGetRoutinePdf(
      Map<String, dynamic> payLoad, String token) async {
    ///////get request hobe//////
    kLogger.d(payLoad);
    ResponseModel res = await CallAPI.getRoutineData(
        ApiEndpoint.stuRoutinePdf, payLoad, token, true);
    kLogger.d(res.body);
    if (res.statusCode == 200 /* && res.body['mode'] == "success" */) {
      kLog("Successfully fetch mGetResultPdf data");
      if (res.body == "No Routine Found!") {
        kLogger.d("Null pdf");
        return null;
      } else {
        return res.body;
      }
      // kLog(res.body);
    } else {
      hideLoading();
      showError("Not found");
      kLog("status code is: ${res.statusCode}");
      return null;
    }
  }
}
