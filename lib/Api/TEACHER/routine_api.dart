import 'dart:typed_data';

import 'package:school_management_system/Model/STUDENT/routine/period_type_model.dart';

import '../../../Config/config.dart';
import '../../../Model/response_model.dart';
import '../../../Utils/utils.dart';

class TeachRoutineApis {
  // make this class singleton
  TeachRoutineApis._internal();
  static final TeachRoutineApis _singleton = TeachRoutineApis._internal();
  factory TeachRoutineApis() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances
  static Future<List<PeriodicTypeModel>> mGetPeriodicTypeList(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.getTeacherData(
        ApiEndpoint.teach_period_type_list, payLoad, token,
        isShowLoading: false);
    // kLogger.d(res.body['result']);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully read mGetPeriodicTypeList data");
      // kLog(res.body[StuHistoryModel.getDataListJsonKey]);

      return res.body[PeriodicTypeModel.getDataListJsonKey]
          .map<PeriodicTypeModel>((e) => PeriodicTypeModel.fromMap(e))
          .toList();
    } else {
      hideLoading();
      showError("Server failure");
      //  return List<StuHistoryModel>();
      return <PeriodicTypeModel>[];
    }
  }

  static Future<Uint8List?> mGetRoutinePdf(
      Map<String, dynamic> payLoad, String token) async {
    kLog(payLoad);
    ///////get request hobe//////
    ResponseModel res = await CallAPI.getRoutineData(
        ApiEndpoint.employee_routine_report_pdf, payLoad, token, true);
    // kLogger.d(res.body['result']);
    if (res.statusCode == 200 /* && res.body['mode'] == "success" */) {
      kLog("Successfully fetch mGetRoutinePdf data");
      // kLog(res.body);
      return res.body;
    } else {
      hideLoading();
      showError("Not Found");
      kLog("status code is: ${res.statusCode}");
      return null;
    }
  }
}
