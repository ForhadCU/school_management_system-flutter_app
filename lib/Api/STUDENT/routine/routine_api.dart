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
  static Future<List<StuPeriodicTypeModel>> mGetPeriodicTypeList(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res =
        await CallAPI.getStudentData(ApiEndpoint.stuPeriodType, payLoad, token);
    // kLogger.d(res.body['result']);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully read mGetPeriodicTypeList data");
      // kLog(res.body[StuHistoryModel.getDataListJsonKey]);

      return res.body[StuPeriodicTypeModel.getDataListJsonKey]
          .map<StuPeriodicTypeModel>((e) => StuPeriodicTypeModel.fromMap(e))
          .toList();
    } else {
      //  return List<StuHistoryModel>();
      return <StuPeriodicTypeModel>[];
    }
  }

  static Future<Uint8List?> mGetRoutinePdf(
      Map<String, dynamic> payLoad, String token) async {
        ///////get request hobe//////
    ResponseModel res = await CallAPI.postStudentData(
        ApiEndpoint.stuRoutinePdf, payLoad, token, true);
    // kLogger.d(res.body['result']);
    if (res.statusCode == 200 /* && res.body['mode'] == "success" */) {
      kLog("Successfully fetch mGetResultPdf data");
      // kLog(res.body);
      return res.body;
    } else {
      kLog("status code is: ${res.statusCode}");
      return null;
    }
  }
}
