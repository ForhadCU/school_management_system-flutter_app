import 'package:school_management_system/Model/TEACHER/period_model.dart';
import 'package:school_management_system/Model/TEACHER/periodic_attnd_model.dart';

import '../../Config/config.dart';
import '../../Model/response_model.dart';
import '../../Utils/utils.dart';

class TeachPeriodicAttendanceApis {
  // make this class singleton
  TeachPeriodicAttendanceApis._internal();
  static final TeachPeriodicAttendanceApis _singleton =
      TeachPeriodicAttendanceApis._internal();
  factory TeachPeriodicAttendanceApis() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<TeachPeriodModel> mGetPeriodModel(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.getTeacherData(
        ApiEndpoint.teachPeriodList, payLoad, token);
    kLogger.d(res.body['result']);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch mGetPeriodModel data");
      return TeachPeriodModel.fromMap(res.body);
    } else {
      hideLoading();
      if (res.statusCode == 410) {
        showError("Permission denied!");
      } else {
        showError("Server error");
      }
      kLog("mGetPeriodModel status code is: ${res.statusCode}");
      return TeachPeriodModel();
      //return <TeachPeriodModel>[];
    }
  }

  static Future<TeachPeriodicAttendanceModel> mGetPeriodicAttendanceModel(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.getTeacherData(
        ApiEndpoint.teachPeriodicAttend, payLoad, token);
    // kLog(payLoad);
    kLogger.d(res.body);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch mGetPeriodicAttendanceModel data");
      return TeachPeriodicAttendanceModel.fromMap(
          res.body[TeachPeriodicAttendanceModel.getParentJsonKey]);
    } else {
      hideLoading();
      if (res.statusCode == 410) {
        showError("Permission denied");
      } else {
        showError("Internal server error");
      }
      kLog("mGetPeriodicAttendanceModel status code is: ${res.statusCode}");
      return TeachPeriodicAttendanceModel();
      //return <TeachPeriodModel>[];
    }
  }

  static Future<bool> mSavePeriodicAttendance(
      {required String endPoint,
      required Map<String, dynamic> bodyData,
      required String token,
      required Map<String, dynamic> payload}) async {
    kLog("BodyData: ${bodyData}");
    ResponseModel res = await CallAPI.postTeacherData(
      endPoint: endPoint,
      bodyData: bodyData,
      token: token,
      payload: payload,
    );
    kLogger.d(res.body);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully submit mSavePeriodicAttendance data");
      // return ExamAttendanceListModel.fromMap(res.body);
      return true;
    } else {
      hideLoading();
      if (res.statusCode == 410) {
        showError(res.body['message']);
      } else {
        showError("Internal server error");
      }
      kLog("mSavePeriodicAttendance status code is: ${res.statusCode}");
      return false;
      //return <ClassName>[];
    }
  }
}
