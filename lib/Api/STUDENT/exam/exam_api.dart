import 'dart:typed_data';

import '../../../Config/config.dart';
import '../../../Model/STUDENT/exam/exam_model.dart';
import '../../../Model/STUDENT/result/history_model.dart';
import '../../../Model/response_model.dart';
import '../../../Utils/utils.dart';

class ExamApis {
  // make this class singleton
  ExamApis._internal();
  static final ExamApis _singleton = ExamApis._internal();
  factory ExamApis() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<List<StuHistoryModel>> mGetStudentHistoryList(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.getStudentData(
        ApiEndpoint.stuHistoryList, payLoad, token);
    // kLogger.d(res.body['result']);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully read mGetClassList data");
      // kLog(res.body[StuHistoryModel.getDataListJsonKey]);

      return res.body[StuHistoryModel.getDataListJsonKey]
          .map<StuHistoryModel>((e) => StuHistoryModel.fromMap(e))
          .toList();
    } else {
      //  return List<StuHistoryModel>();
      hideLoading();
      showError("Internal server error");
      return <StuHistoryModel>[];
    }
  }

  static Future<List<StuExamTypeModel>> mGetExamTypeList(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.postStudentData(
        ApiEndpoint.stuExamTypeList, payLoad, token);
    // kLogger.d(res.body['result']);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully read StuExamModel data");
      kLog(res.body[StuExamTypeModel.getDataListJsonKey]);
      return res.body[StuExamTypeModel.getDataListJsonKey]
          .map<StuExamTypeModel>((e) => StuExamTypeModel.fromMap(e))
          .toList();
    } else {
      //  return List<StuHistoryModel>();
      hideLoading();
      showError("Internal server error");
      return <StuExamTypeModel>[];
    }
  }

  static Future<Uint8List?> mGetExamRoutinePdf(
      Map<String, dynamic> payLoad, String token) async {
    kLog(payLoad);
    ResponseModel res = await CallAPI.postStudentData(
        ApiEndpoint.stuExamSubjectRoutineList, payLoad, token, true);
    // kLogger.d(res.body['result']);
    if (res.statusCode == 200 /* && res.body['mode'] == "success" */) {
      kLog("Successfully fetch mGetExamRoutinePdf data");
      // kLog(res.body);
      return res.body;
    } else {
      // hideLoading();
      kLog(res.body['message']);
      kLog("status code is: ${res.statusCode}");
      return null;
    }
  }

  static Future<Uint8List?> mGetExamAdmitCardPdf(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.postStudentData(
        ApiEndpoint.stuExamAdmitCard, payLoad, token, true);
    // kLogger.d(res.body['result']);
    if (res.body != null && res.statusCode == 200) {
      kLog("Successfully fetch mGetExamAdmitCardPdf data");
      // kLog(res.body);
      return res.body;
    } else {
      // hideLoading();
      // showError("Internal server error");
      kLog(res.body['message']);
      kLog("status code is: ${res.statusCode}");
      return null;
    }
  }
}
