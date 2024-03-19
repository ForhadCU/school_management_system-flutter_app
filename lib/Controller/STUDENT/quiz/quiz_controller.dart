import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Api/STUDENT/quiz/quiz_api.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Model/STUDENT/quiz/quiz_info_model.dart';
import 'package:school_management_system/Model/STUDENT/quiz/quiz_questions_model.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:school_management_system/Singletones/app_data.dart';
import 'package:school_management_system/Utils/api%20structure/payloads.dart';
import 'package:school_management_system/Utils/custom_utils.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../../Model/STUDENT/quiz/quiz_result.dart';
import '../../../Model/STUDENT/quiz/quiz_schedule_model.dart';

class StuQuizController extends GetxController {
  static StuQuizController get to => Get.find();

  var testTimer = 7.obs;

  /// variable declaration
  var progress = 0.00.obs;
  var progressStratingPoint = 0.00.obs;
  // var quizNumber = 0.obs;
  var isLiveQuizActive = true.obs;
  var isQuizScheduleActive = false.obs;
  var isQuizResultActive = false.obs;
  var scheduleList = Rxn<List<Map<String, dynamic>>>();
  var resultList = Rxn<List<Map<String, dynamic>>>();
  var quizInfoModel = QuizInfoModel().obs;
  var quizQuestionsModel = QuizQuestionsModel().obs;
  var quizQuestionsModelList = <QuizQuestionsModel>[].obs;
  String token = "";
  var daysRemainingBeforeStart = 0.obs;
  var hoursRemainingBeforeStart = 0.obs;
  var minsRemainingBeforeStart = 0.obs;
  var secsRemainingBeforeStart = 0.obs;
  var quizQuestionIndex = 0.obs;

  var isQuizStart = false.obs;
  var isShownReady = false.obs;
  var isReady = false.obs;
  var isQuizMissed = false.obs;
  var selectedOption = Rxn<dynamic>();
  var answerIdList = <Map<String, dynamic>>[].obs;
  var isModified = false.obs;
  var isLoading = false.obs;
  var isQuizNotFound = true.obs;
  int timeRemainingBeforeStart = 0;

  var quizResultModel = StuQuizResultModel().obs;
  var quizScheduleModel = QuizScheduleModel().obs;
  var quizResultList = <QuizResultData>[].obs;
  var quizScheduleList = <QuizScheduleData>[].obs;
  var quizResultListScrlCtrlr = ScrollController().obs;
  var quizScheduleListScrlCtrlr = ScrollController().obs;
  var pageNumberForResultList = 1.obs;
  var pageNumberForScheduleList = 1.obs;
  var startTimeForTimer = DateTime.now().obs;

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    token = await AppLocalDataFactory.mGetToken();
    await mGetQuizInfo();
    await mGetQuizScheduleList();
    await mGetQuizResultList();
    int i = 0;
    Timer.periodic(Duration(seconds: 1), (timer) {
      // kLog("Tick: ${++i}");
      startTimeForTimer.value =
          startTimeForTimer.value.add(Duration(seconds: 1));
    });

    /// Scroll Listener for quizResult List
    quizResultListScrlCtrlr.value.addListener(() {
      if (quizResultListScrlCtrlr.value.offset ==
          quizResultListScrlCtrlr.value.position.maxScrollExtent) {
        if (quizResultModel.value.nextPageUrl != null) {
          kLog("go next page");
          kLog(quizResultModel.value.currentPage!);
          pageNumberForResultList.value++;
          mGetQuizResultList();
        } else {
          kLog("end");
        }
        kLog("Reached to End");
        // kLog(noticeApiModel.value.);
      }
    });

    /// Scroll Listener for quizSchedul List
    quizScheduleListScrlCtrlr.value.addListener(() {
      if (quizScheduleListScrlCtrlr.value.offset ==
          quizScheduleListScrlCtrlr.value.position.maxScrollExtent) {
        if (quizScheduleModel.value.nextPageUrl != null) {
          kLog("go next page");
          kLog(quizScheduleModel.value.currentPage!);
          pageNumberForScheduleList.value++;
          mGetQuizScheduleList();
        } else {
          kLog("end");
        }
        kLog("Reached to End");
        // kLog(noticeApiModel.value.);
      }
    });
    isLoading.value = false;
    // progress.value = progressStratingPoint.value;
  }

  mReload() async {
    quizResultList.clear();
    quizScheduleList.clear();
    quizQuestionsModelList.clear();
    progress.value = 0.00;
    quizQuestionIndex.value = 0;
    isLoading.value = true;
    await mGetQuizInfo();
    await mGetQuizScheduleList();
    await mGetQuizResultList();
    isLoading.value = false;
  }

  /// code goes here
  mGetQuizInfo() async {
    // isLoading.value = true;
    quizInfoModel.value = await QuizApis.mGetQuizInfo(
        PayLoads.stuActiveQuizList(api_access_key: AppData.api_access_key),
        token);
    // isLoading.value = false;
    if (quizInfoModel.value.quizDeclareId != null) {
      kLog("Quiz found.");
      isQuizNotFound.value = false;
      mQuizLaunching();
    } else {
      kLog("Quiz Not found.");
      isQuizNotFound.value = true;
    }
  }

  mQuizLaunching() async {
    // check: Quiz e registered hoiye ache kina
    if (quizInfoModel.value.currentDateTime != null) {
      startTimeForTimer.value = quizInfoModel.value.currentDateTime!;
      if (quizInfoModel.value.joinStatus == 1) {
        kLog("Registered");
        var presentDateTime = quizInfoModel.value.currentDateTime!;
        var quizStartDateTime = DateTime.parse(quizInfoModel
            .value.quizDeclare!.quizDeclareSettings!.startDateTime!);
        /*    var quizEndDateTime = DateTime.parse(
          quizInfoModel.value.quizDeclare!.quizDeclareSettings!.endDateTime!); */

        /// check: quiz already shuru hoiye gese kina
        if (presentDateTime.millisecondsSinceEpoch >
            quizStartDateTime.millisecondsSinceEpoch) {
          kLog("Quiz already started");

          /// visible Quiz Screen
          isQuizStart.value = true;
          isLoading.value = true;

          /// take questions
          await mGetQuizQuestions();
          isLoading.value = false;

          /*   /// check: quiz sesh kina
           if (presentDateTime.millisecondsSinceEpoch >
          quizEndDateTime.millisecondsSinceEpoch){

          } else{

          } */
        } else {
          kLog("Quiz not started");
          isReady.value = true;
          mGetRemainingTimeBeforeStart();
        }
      } else {
        kLog("Not Registered");

        var presentDateTime = quizInfoModel.value.currentDateTime!;
        var quizStartDateTime = DateTime.parse(quizInfoModel
            .value.quizDeclare!.quizDeclareSettings!.startDateTime!);
        /*    var quizEndDateTime = DateTime.parse(
          quizInfoModel.value.quizDeclare!.quizDeclareSettings!.endDateTime!); */

        /// check: quiz already shuru hoiye gese kina
        if (presentDateTime.millisecondsSinceEpoch >
            quizStartDateTime.millisecondsSinceEpoch) {
          kLog("Quiz already started");
          // isQuizMissed.value = true;
          /// visible Quiz Screen
          isQuizStart.value = true;
          isLoading.value = true;

          ///Register to quiz
          await mRegisterToQuiz();

          /// take questions
          await mGetQuizQuestions();
          isLoading.value = false;
        } else {
          kLog("Quiz not started");

          // isReady.value = true;
          mGetRemainingTimeBeforeStart();
        }

        // mGetRemainingTimeBeforeStart();
      }
    } else {
      showError("Invalid quiz time");
    }
  }

  mGetQuizQuestions() async {
    quizQuestionsModel.value = await QuizApis.mGetQuizQuestions(
        PayLoads.stuQuizQuestionList(
            api_access_key: AppData.api_access_key,
            quiz_declare_id: quizInfoModel.value.quizDeclareId!.toString()),
        token);
    if (quizQuestionsModel.value.mode == "success") {
      // mGetRemainingTimeOfQuiz();
      mCalcualteQuizTime();
      progressStratingPoint.value =
          (100 / quizQuestionsModel.value.questionList!.length) / 100;
      progress.value = progressStratingPoint.value;

      // make a Model list
      for (var element in quizQuestionsModel.value.questionList!) {
        quizQuestionsModelList.add(quizQuestionsModel.value);
      }

      /* for (var element in quizQuestionsModel
          .value.questionList![0].siteQuizQuestionDetailsForStudent!) {
        answerIdList.add({"id": element.id, "selected": false});
      } */

      if (quizQuestionsModelList[quizQuestionIndex.value]
              .questionList![quizQuestionIndex.value]
              .answerCount! >
          1) {
        kLog("From: Checkbox");

        /* if (quizQuestionsModel.value!.questionList![quizQuestionIndex.value]
            .studentAnswerIds!.isEmpty) {
          quizQuestionsModel
              .value!.questionList![quizQuestionIndex.value].studentAnswerIds!
              .add(selectedOption.value);
        } else {
          quizQuestionsModel.value!.questionList![quizQuestionIndex.value]
              .studentAnswerIds!.first = selectedOption.value;
        } */
        ///clear options list for new or previous question
        answerIdList.clear();
        for (var element in quizQuestionsModelList[quizQuestionIndex.value]
            .questionList![quizQuestionIndex.value]
            .siteQuizQuestionDetailsForStudent!) {
          if (quizQuestionsModelList[quizQuestionIndex.value]
              .questionList![quizQuestionIndex.value]
              .studentAnswerIds!
              .contains(element.id.toString())) {
            answerIdList.add({"id": element.id, "selected": true});
          } else {
            answerIdList.add({"id": element.id, "selected": false});
          }
        }
      } else {
        // kLog("From: Radio");
        if (quizQuestionsModelList[quizQuestionIndex.value]
            .questionList![quizQuestionIndex.value]
            .studentAnswerIds!
            .isNotEmpty) {
          // kLog("AnswerList: Not empty");
          // kLog(
          //     "Ans id is: ${quizQuestionsModelList[quizQuestionIndex.value].questionList![quizQuestionIndex.value].studentAnswerIds!.first.runtimeType}");
          for (var element in quizQuestionsModelList[quizQuestionIndex.value]
              .questionList![quizQuestionIndex.value]
              .siteQuizQuestionDetailsForStudent!) {
            // kLog("This question's ans id: ${element.id.runtimeType}");
            if (quizQuestionsModelList[quizQuestionIndex.value]
                .questionList![quizQuestionIndex.value]
                .studentAnswerIds!
                .contains(element.id.toString())) {
              // kLog("Pawa gese");
              selectedOption.value = element.id;
            } else {
              // kLog("If condition e prblm");
            }
          }
        } else {
          // kLog("Pawa jaini");
          // kLog("AnswerList: empty");

          selectedOption.value = null;
        }
      }
    } else {
      print("Quiz Questions model is EMpty");
    }
  }

  /// quizinfo pawa gese:
  ///   quiz e registration nei: tahole startDatetime er theke present Datetime kom kina dekhte hbe
  ///     kom hole as usual
  ///     beshi hole "Quiz missed"
  ///   quiz e registration ache : present Datetime > QuizStartDatetime   diff dekhte hbe
  ///     No: as usual timer dekhabe but ready button dekhabe na
  ///     Yes:  present Datetime > QuizEndDatetime :
  ///          Yes: "Quiz End".
  ///          No: mQuizQuestionList call kore dite hbe
  ///
  ///
  ///
  ///
  ///
  ///

  mCalcualteQuizTime() async {
    if (quizInfoModel.value.quizDeclareId != null &&
        quizInfoModel.value.currentDateTime != null) {
      timeRemainingBeforeStart = DateTime.parse(quizInfoModel
              .value.quizDeclare!.quizDeclareSettings!.endDateTime!)
          .difference(quizInfoModel.value.currentDateTime!)
          .inSeconds;
      kLogger.d(timeRemainingBeforeStart);
      daysRemainingBeforeStart.value =
          Utils().mCalculateDaysFromSecs(secs: timeRemainingBeforeStart);
      hoursRemainingBeforeStart.value =
          Utils().mCalculateHoursFromSecs(secs: timeRemainingBeforeStart);

      minsRemainingBeforeStart.value =
          Utils().mCalculateMinsFromSecs(secs: timeRemainingBeforeStart);

      secsRemainingBeforeStart.value =
          Utils().mCalculateSecsFromSecs(secs: timeRemainingBeforeStart);

      kLog(
          "$daysRemainingBeforeStart   $hoursRemainingBeforeStart   $minsRemainingBeforeStart    $secsRemainingBeforeStart");
    } else {
      print("Quiz model is EMpty");
    }
  }

  mGetRemainingTimeBeforeStart() async {
    if (quizInfoModel.value.quizDeclareId != null &&
        quizInfoModel.value.currentDateTime != null) {
      int timeRemainingBeforeStart = DateTime.parse(quizInfoModel
              .value.quizDeclare!.quizDeclareSettings!.startDateTime!)
          .difference(quizInfoModel.value.currentDateTime!)
          .inSeconds;
      daysRemainingBeforeStart.value =
          Utils().mCalculateDaysFromSecs(secs: timeRemainingBeforeStart);
      hoursRemainingBeforeStart.value =
          Utils().mCalculateHoursFromSecs(secs: timeRemainingBeforeStart);

      minsRemainingBeforeStart.value =
          Utils().mCalculateMinsFromSecs(secs: timeRemainingBeforeStart);

      secsRemainingBeforeStart.value =
          Utils().mCalculateSecsFromSecs(secs: timeRemainingBeforeStart);

      kLog(
          "$daysRemainingBeforeStart   $hoursRemainingBeforeStart   $minsRemainingBeforeStart    $secsRemainingBeforeStart");
    } else {
      print("Quiz model is EMpty");
    }
  }

/*   mGetRemainingTimeOfQuiz() {
    hoursRemainingBeforeStart.value = Utils().mCalculateHoursFromSecs(
        secs: quizQuestionsModel.value.quizDetails!.duration!);

    minsRemainingBeforeStart.value = Utils().mCalculateMinsFromSecs(
        secs: quizQuestionsModel.value.quizDetails!.duration!);

    secsRemainingBeforeStart.value = Utils().mCalculateSecsFromSecs(
        secs: quizQuestionsModel.value.quizDetails!.duration!);

    kLog(
        "$hoursRemainingBeforeStart   $minsRemainingBeforeStart    $secsRemainingBeforeStart");
  } */

  void mGetResultList() {
    resultList.value = [
      {"item": "item1"},
      /*   {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"}, */
    ];
  }

  void mGotoNextQuiz() async {
    if (progress.value < 1.0) {
      // quizNumber.value++;
      progress.value += progressStratingPoint.value;
      quizQuestionIndex.value++;
      mCalcualteQuizTime();
      kLog(
          "Answer count : ${quizQuestionsModelList[quizQuestionIndex.value].questionList![quizQuestionIndex.value].answerCount!}");

      if (quizQuestionsModelList[quizQuestionIndex.value]
              .questionList![quizQuestionIndex.value]
              .answerCount! >
          1) {
        kLog("From: Checkbox");

        /* if (quizQuestionsModel.value!.questionList![quizQuestionIndex.value]
            .studentAnswerIds!.isEmpty) {
          quizQuestionsModel
              .value!.questionList![quizQuestionIndex.value].studentAnswerIds!
              .add(selectedOption.value);
        } else {
          quizQuestionsModel.value!.questionList![quizQuestionIndex.value]
              .studentAnswerIds!.first = selectedOption.value;
        } */
        ///clear options list for new or previous question
        answerIdList.clear();
        for (var element in quizQuestionsModelList[quizQuestionIndex.value]
            .questionList![quizQuestionIndex.value]
            .siteQuizQuestionDetailsForStudent!) {
          if (quizQuestionsModelList[quizQuestionIndex.value]
              .questionList![quizQuestionIndex.value]
              .studentAnswerIds!
              .contains(element.id.toString())) {
            answerIdList.add({"id": element.id, "selected": true});
          } else {
            answerIdList.add({"id": element.id, "selected": false});
          }
        }
      } else {
        // kLog("From: Radio");
        if (quizQuestionsModelList[quizQuestionIndex.value]
            .questionList![quizQuestionIndex.value]
            .studentAnswerIds!
            .isNotEmpty) {
          // kLog("AnswerList: Not empty");
          // kLog(
          //     "Ans id is: ${quizQuestionsModelList[quizQuestionIndex.value].questionList![quizQuestionIndex.value].studentAnswerIds!.first.runtimeType}");
          for (var element in quizQuestionsModelList[quizQuestionIndex.value]
              .questionList![quizQuestionIndex.value]
              .siteQuizQuestionDetailsForStudent!) {
            // kLog("This question's ans id: ${element.id.runtimeType}");
            if (quizQuestionsModelList[quizQuestionIndex.value]
                .questionList![quizQuestionIndex.value]
                .studentAnswerIds!
                .contains(element.id.toString())) {
              // kLog("Pawa gese");
              selectedOption.value = element.id;
            } else {
              // kLog("If condition e prblm");
            }
          }
        } else {
          // kLog("Pawa jaini");
          // kLog("AnswerList: empty");

          selectedOption.value = null;
        }
      }
/* 
      for (var element
          in quizQuestionsModelList[quizQuestionIndex.value].questionList!) {
        kLog(
            "question index: ${quizQuestionsModelList[quizQuestionIndex.value].questionList!.indexOf(element)}:  ${element.studentAnswerIds!}");
      } */

      await mSaveQuizAnswer();

      /* quizQuestionsModelList[quizQuestionIndex.value] =
          quizQuestionsModel.value!; */

      /*    kLog(quizQuestionsModelList[quizQuestionIndex.value]
          .questionList![quizQuestionIndex.value]
          .studentAnswerIds!); */
    }
  }

  void mGotoPreviousQuiz() {
    if (progress.value > 0.0) {
      // --quizNumber.value;

      progress.value -= progressStratingPoint.value;
      --quizQuestionIndex.value;
      mCalcualteQuizTime();
      if (quizQuestionsModelList[quizQuestionIndex.value]
              .questionList![quizQuestionIndex.value]
              .answerCount! >
          1) {
        /* if (quizQuestionsModel.value!.questionList![quizQuestionIndex.value]
            .studentAnswerIds!.isEmpty) {
          quizQuestionsModel
              .value!.questionList![quizQuestionIndex.value].studentAnswerIds!
              .add(selectedOption.value);
        } else {
          quizQuestionsModel.value!.questionList![quizQuestionIndex.value]
              .studentAnswerIds!.first = selectedOption.value;
        } */
        ///clear options list for new or previous question
        answerIdList.clear();
        for (var element in quizQuestionsModelList[quizQuestionIndex.value]
            .questionList![quizQuestionIndex.value]
            .siteQuizQuestionDetailsForStudent!) {
          if (quizQuestionsModelList[quizQuestionIndex.value]
              .questionList![quizQuestionIndex.value]
              .studentAnswerIds!
              .contains(element.id.toString())) {
            answerIdList.add({"id": element.id, "selected": true});
          } else {
            answerIdList.add({"id": element.id, "selected": false});
          }
        }
        // kLog(answerIdList);
      } else {
        if (quizQuestionsModelList[quizQuestionIndex.value]
            .questionList![quizQuestionIndex.value]
            .studentAnswerIds!
            .isNotEmpty) {
          for (var element in quizQuestionsModelList[quizQuestionIndex.value]
              .questionList![quizQuestionIndex.value]
              .siteQuizQuestionDetailsForStudent!) {
            if (quizQuestionsModelList[quizQuestionIndex.value]
                .questionList![quizQuestionIndex.value]
                .studentAnswerIds!
                .contains(element.id.toString())) {
              selectedOption.value = element.id;
            }
          }
        } else {
          selectedOption.value = null;
        }
      }
    }
  }

  mSubmitQuiz() async {
    Map<String, dynamic> params = PayLoads.stuQuizAnswerSilentSave(
        api_access_key: AppData.api_access_key);
    Map<String, dynamic> additionalKeys = {
      "time_left": timeRemainingBeforeStart,
      "quiz_declare_id": quizInfoModel.value.quizDeclareId,
    };

    var modified = quizQuestionsModelList[quizQuestionIndex.value].toMap();
    modified.remove("student_answer_list");
    modified.remove("mode");
    modified.remove("status");
    modified.addAll(additionalKeys);
/*     QuizQuestionsModel quizQuestionsModel =  */
    /*   Map<String, dynamic> params = 
        jsonDecode(quizQuestionsModelList[quizQuestionIndex.value].toString()); */
    // params.addAll(modified);
    // kLog(modified);

    bool isSuccess = await QuizApis.mSaveQuizAnswerFinalEnd(
        // AppData.dummyQuizQuestionsModel,
        modified,
        token);

    if (isSuccess) {
      Get.offAllNamed(AppRoutes.dashboard);
    }
  }

  void mUpdateCloseLiveQuiz() {
    mUpdateQuizSchedule();
  }

  void mUpdateLiveQuiz() {
    isLiveQuizActive.value = true;
    isQuizScheduleActive.value = false;
    isQuizResultActive.value = false;

    // isLoading.value = false;

    if (isQuizStart.value) {
      mCalcualteQuizTime();
    } else if (!isQuizNotFound.value) {
      mGetRemainingTimeBeforeStart();
    }
  }

  mUpdateMultipleQuesids() {
    for (var element in quizQuestionsModel
        .value.questionList![0].siteQuizQuestionDetailsForStudent!) {
      answerIdList.add({"id": element.id, "selected": false});
    }
  }

  void mUpdateQuizResult() {
    isLiveQuizActive.value = false;
    isQuizScheduleActive.value = false;
    isQuizResultActive.value = true;

    // isLoading.value = true;
  }

  void mUpdateQuizSchedule() {
    isLiveQuizActive.value = false;
    isQuizScheduleActive.value = true;
    isQuizResultActive.value = false;

    // isLoading.value = true;
  }

  @override
  void onClose() {
    super.onClose();
  }

  mSaveQuizAnswer() async {
    Map<String, dynamic> params = PayLoads.stuQuizAnswerSilentSave(
        api_access_key: AppData.api_access_key);
    Map<String, dynamic> additionalKeys = {
      "time_left": timeRemainingBeforeStart,
      "quiz_declare_id": quizInfoModel.value.quizDeclareId,
    };

    var modified = quizQuestionsModelList[quizQuestionIndex.value].toMap();
    modified.remove("student_answer_list");
    modified.remove("mode");
    modified.remove("status");
    modified.addAll(additionalKeys);
/*     QuizQuestionsModel quizQuestionsModel =  */
    /*   Map<String, dynamic> params = 
        jsonDecode(quizQuestionsModelList[quizQuestionIndex.value].toString()); */
    // params.addAll(modified);
    kLog(modified);

    await QuizApis.mSaveQuizAnswerSilently(
        // AppData.dummyQuizQuestionsModel,
        modified,
        token);
  }

  mRegisterToQuiz() async {
    isReady.value = await QuizApis.mRegisterToQuiz(
        PayLoads.stuQuizStart(
            api_access_key: AppData.api_access_key,
            quiz_declare_id: quizInfoModel.value.quizDeclareId.toString()),
        token);
    isShownReady.value = !isReady.value;
  }

  mGetQuizResultList() async {
    quizResultModel.value = await QuizApis.mGetQuizReportList(
        PayLoads.stuPreviewsQuizReportList(
            page: pageNumberForResultList.value.toString(),
            api_access_key: AppData.api_access_key,
            paginate: 10.toString()),
        token);
    quizResultList.addAll(quizResultModel.value.data!);
    // isLoading.value = false;
  }

  mGetQuizScheduleList() async {
    quizScheduleModel.value = await QuizApis.mGetQuizScheduleModel(
        PayLoads.stuActiveQuizRoutineList(
            page: pageNumberForScheduleList.value.toString(),
            api_access_key: AppData.api_access_key,
            paginate: 10.toString()),
        token);
    quizScheduleList.addAll(quizScheduleModel.value.data!);
    // isLoading.value = false;
  }
}
