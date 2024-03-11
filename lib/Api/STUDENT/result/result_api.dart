import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Model/STUDENT/result/history_model.dart';
import 'package:school_management_system/Model/STUDENT/result/result_type_model.dart';

import '../../../Model/STUDENT/exam/exam_model.dart';
import '../../../Model/response_model.dart';
import '../../../Utils/utils.dart';

class ResultApis {
  // make this class singleton
  ResultApis._internal();
  static final ResultApis _singleton = ResultApis._internal();
  factory ResultApis() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<List<StuHistoryModel>> mGetStudentHistoryList(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.getStudentData(
        ApiEndpoint.stuHistoryList, payLoad, token);
    kLogger.d(res.body[StuHistoryModel.getDataListJsonKey]);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully read mGetClassList data");
      // kLog(res.body[StuHistoryModel.getDataListJsonKey]);

      return res.body[StuHistoryModel.getDataListJsonKey]
          .map<StuHistoryModel>((e) => StuHistoryModel.fromMap(e))
          .toList();
    } else {
      hideLoading();
      showError("Internal server error");
      //  return List<StuHistoryModel>();
      return <StuHistoryModel>[];
    }
  }

  /* static Future<List<StuExamModel>> mGetExamTypeList(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.postStudentData(
        ApiEndpoint.stuExamTypeList, payLoad, token);
    // kLogger.d(res.body['result']);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully read StuExamModel data");
      kLog(res.body[StuExamModel.getDataListJsonKey]);
      return res.body[StuExamModel.getDataListJsonKey]
          .map<StuExamModel>((e) => StuExamModel.fromMap(e))
          .toList();
    } else {
      //  return List<StuHistoryModel>();

      return <StuExamModel>[];
    }
  } */

  static Future<List<StuResultTypeModel>> mGetResultTypeList(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.postStudentData(
        ApiEndpoint.stuPrimaryResultList, payLoad, token);
    kLogger.d(res.body[StuResultTypeModel.getDataListJsonKey]);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully read StuExamModel data");
      kLog(res.body[StuResultTypeModel.getDataListJsonKey]);
      return res.body[StuResultTypeModel.getDataListJsonKey]
          .map<StuResultTypeModel>((e) => StuResultTypeModel.fromMap(e))
          .toList();
    } else {
      hideLoading();
      showError("Internal server error");
      //  return List<StuHistoryModel>();

      return <StuResultTypeModel>[];
    }
  }

  static Future<Uint8List?> mGetResultPdf(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.postStudentData(
        ApiEndpoint.stuPrimaryResultDetailsPdf, payLoad, token, true);
    // kLogger.d(res.body['result']);
    if (res.statusCode == 200 /* && res.body['mode'] == "success" */) {
      kLog("Successfully fetch mGetResultPdf data");
      // kLog(res.body);
      /*    if (res.body == null) {
        kLog("Body is null");
        return null;
      } else {
        return res.body;
      } */
      return res.body;
    } else {
      hideLoading();
      showError("Internal server error");
      kLog("status code is: ${res.statusCode}");
      return null;
    }
  }
}
