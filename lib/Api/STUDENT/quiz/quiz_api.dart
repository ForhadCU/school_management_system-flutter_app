import 'package:get/get.dart';
import 'package:school_management_system/Model/STUDENT/quiz/quiz_info_model.dart';
import 'package:school_management_system/Model/STUDENT/quiz/quiz_questions_model.dart';
import 'package:school_management_system/Model/STUDENT/quiz/quiz_schedule_model.dart';
import 'package:school_management_system/Singletones/app_data.dart';

import '../../../Config/config.dart';
import '../../../Model/STUDENT/quiz/quiz_result.dart';
import '../../../Model/response_model.dart';
import '../../../Utils/api structure/payloads.dart';
import '../../../Utils/utils.dart';

class QuizApis {

  // make this class singleton
  QuizApis._internal();
  static final QuizApis _singleton = QuizApis._internal();
  factory QuizApis() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<QuizInfoModel> mGetQuizInfo(
      Map<String, dynamic> payLoad, token) async {
    ResponseModel res = await CallAPI.getStudentData(
        ApiEndpoint.stuActiveQuizInfo, payLoad, token,
        hasLoading: false);
    if (res.statusCode == 200) {
      // kLogger.d(res.body[QuizInfoModel.getParentJsonKey]);

      if (res.body[QuizInfoModel.getParentJsonKey] != null) {
        kLog("Successfully fetch mGetQuizInfo data");
        return QuizInfoModel.fromMap(res.body[QuizInfoModel.getParentJsonKey]);
      } else {
        return QuizInfoModel();
      }
      // return QuizInfoModel();
    } else {
      kLog("mGetQuizInfo status code is: ${res.statusCode}");
      showError("Internal server error");
      return QuizInfoModel();
    }
  }

  static Future<StuQuizResultModel> mGetQuizReportList(
      Map<String, dynamic> payLoad, token) async {
    ResponseModel res = await CallAPI.getStudentData(
        ApiEndpoint.stuPreviewsQuizReportList, payLoad, token,
        hasLoading: false);
    if (res.statusCode == 200) {
      // kLogger.d(res.body[StuQuizResultModel.getParentJsonKey]);

      if (res.body[StuQuizResultModel.getParentJsonKey] != null) {
        kLog("Successfully fetch mGetQuizReportList data");
        StuQuizResultModel stuQuizResultModel = StuQuizResultModel.fromMap(
            res.body[StuQuizResultModel.getParentJsonKey]);
        stuQuizResultModel.isBlank!
            ? {kLog("Empty Result")}
            : {kLog("Not Empty Result")};
        return stuQuizResultModel;
      } else {
        return StuQuizResultModel();
      }
      // return QuizInfoModel();
    } else {
      kLog("mGetQuizReportList status code is: ${res.statusCode}");
      showError("Internal server error");
      return StuQuizResultModel();
    }
  }

  static Future<bool> mSaveQuizAnswerSilently(
    Map<String, dynamic> payLoad,
    token,
  ) async {
    // kLog("$payLoad   $token");

    /// send start Quiz request: Ready button e click korlei
    bool isSaveAnswer = false;

    ResponseModel res = await CallAPI.postStudentDataSaveQuiz(
        ApiEndpoint.stuQuizAnswerSilentSave,
        payLoad,
        token,
        AppData.api_access_key);
    kLogger.d(res.body);

    if (res.statusCode == 200 && res.body['mode'] == "success") {
      // kLogger.d(res.body);

      kLog("Successfully fetch mSaveQuizAnswerSilently data");
      isSaveAnswer = true;
    } else {
      kLog("mSaveQuizAnswerSilently status code is: ${res.statusCode}");
      showError("Internal server error");
      isSaveAnswer = false;
    }
    return isSaveAnswer;
  }

  static Future<bool> mSaveQuizAnswerFinalEnd(
    Map<String, dynamic> payLoad,
    token,
  ) async {
    // kLog("$payLoad   $token");

    /// send start Quiz request: Ready button e click korlei
    bool isSaveAnswer = false;

    ResponseModel res = await CallAPI.postStudentDataSaveQuizFinallEnd(
        ApiEndpoint.stuQuizAnswerEndSave,
        payLoad,
        token,
        AppData.api_access_key);
    kLogger.d(res.body);

    if (res.statusCode == 200 && res.body['mode'] == "success") {
      // kLogger.d(res.body);

      kLog("Successfully fetch mSaveQuizAnswerFinalEnd data");
      isSaveAnswer = true;
    } else {
      kLog("mSaveQuizAnswerFinalEnd status code is: ${res.statusCode}");
      showError("Internal server error");
      isSaveAnswer = false;
    }
    return isSaveAnswer;
  }

  static Future<bool> mSaveQuizAnswerEnd(
    Map<String, dynamic> payLoad,
    token,
  ) async {
    // kLog("$payLoad   $token");

    /// send start Quiz request: Ready button e click korlei
    bool isSaveAnswer = false;

    ResponseModel res = await CallAPI.postStudentData(
        ApiEndpoint.stuQuizAnswerEndSave, payLoad, token);
    kLogger.d(res.body);

    if (res.statusCode == 200 && res.body['mode'] == "success") {
      // kLogger.d(res.body);

      kLog("Successfully fetch mSaveQuizAnswerSilently data");
      isSaveAnswer = true;
    } else {
      kLog("mSaveQuizAnswerSilently status code is: ${res.statusCode}");
      showError("Internal server error");
      isSaveAnswer = false;
    }
    return isSaveAnswer;
  }

  static Future<QuizQuestionsModel> mGetQuizQuestions(
      Map<String, dynamic> payLoad, token) async {
    // kLog("$payLoad   $token");

    /// send start Quiz request: Ready button e click korlei
    /* ResponseModel res =
        await CallAPI.postStudentData(ApiEndpoint.stuQuizStart, payLoad, token);
    kLogger.d(res.body); */

    /// get quizQuestion list
    ResponseModel res = await CallAPI.getStudentData(
        ApiEndpoint.stuQuizQuestionList, payLoad, token,
        hasLoading: false);
    // kLogger.d(res.body);

    if (res.statusCode == 200 && res.body['mode'] == "success") {
      // kLogger.d(res.body);

      kLog("Successfully fetch mGetQuizQuestions data");
      return QuizQuestionsModel.fromMap(res.body);
    } else {
      kLog("mGetQuizQuestions status code is: ${res.statusCode}");
      showError("Internal server error");
      return QuizQuestionsModel();
    }
  }

  static Future<bool> mRegisterToQuiz(
      Map<String, dynamic> payLoad, token) async {
    // kLog("$payLoad   $token");

    /// send start Quiz request: Ready button e click korlei
    ResponseModel res =
        await CallAPI.postStudentData(ApiEndpoint.stuQuizStart, payLoad, token);
    kLogger.d(res.body);

    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLogger.d(res.body['message']);
      kLog("Successfully fetch mStartQuiz data");
      return true;
    } else {
      kLog("mStartQuiz status code is: ${res.statusCode}");
      showError("Internal server error");
      return false;
    }
  }

  static Future<QuizScheduleModel> mGetQuizScheduleModel(
      Map<String, dynamic> payLoad, token) async {
    ResponseModel res = await CallAPI.getStudentData(
        ApiEndpoint.stuActiveQuizRoutineList, payLoad, token, hasLoading: false);
    if (res.statusCode == 200) {
      // kLogger.d(res.body[StuQuizResultModel.getParentJsonKey]);

      if (res.body[QuizScheduleModel.getParentJsonKey] != null) {
        kLog("Successfully fetch mGetQuizScheduleModel data");
        QuizScheduleModel quizScheduleModel = QuizScheduleModel.fromMap(
            res.body[QuizScheduleModel.getParentJsonKey]);

        return quizScheduleModel;
      } else {
        return QuizScheduleModel();
      }
      // return QuizInfoModel();
    } else {
      kLog("mGetQuizScheduleModel status code is: ${res.statusCode}");
      showError("Internal server error");
      return QuizScheduleModel();
    }
  }
}
