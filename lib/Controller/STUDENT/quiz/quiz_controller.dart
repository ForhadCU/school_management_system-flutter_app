import 'package:get/get.dart';
import 'package:school_management_system/Api/STUDENT/quiz/quiz_api.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Model/STUDENT/quiz/quiz_info_model.dart';
import 'package:school_management_system/Singletones/app_data.dart';
import 'package:school_management_system/Utils/api%20structure/payloads.dart';
import 'package:school_management_system/Utils/custom_utils.dart';
import 'package:school_management_system/Utils/utils.dart';

class StuQuizController extends GetxController {
  var testTimer = 20.obs;

  static StuQuizController get to => Get.find();

  /// variable declaration
  var progress = 0.00.obs;
  var progressStratingPoint = 0.00.obs;
  var quizNumber = 0.obs;
  var isLiveQuizActive = true.obs;
  var isQuizScheduleActive = false.obs;
  var isQuizResultActive = false.obs;
  var scheduleList = Rxn<List<Map<String, dynamic>>>();
  var resultList = Rxn<List<Map<String, dynamic>>>();
  var quizInfoModel = Rxn<QuizInfoModel>();
  String token = "";
  var daysRemainingBeforeStart = 0.obs;
  var hoursRemainingBeforeStart = 0.obs;
  var minsRemainingBeforeStart = 0.obs;
  var secsRemainingBeforeStart = 0.obs;

  var isQuizStart = false.obs;
  var isShownReady = false.obs;
  var isReady = false.obs;
  var isQuizMissed = false.obs;

  @override
  void onInit() async {
    super.onInit();

    progressStratingPoint.value = (100 / 20) / 100;
    mGetScheduleList();
    token = await AppLocalDataFactory.mGetToken();
    await mGetQuizInfo();

    // progress.value = progressStratingPoint.value;
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// code goes here
  mGetQuizInfo() async {
    quizInfoModel.value = await QuizApis.mGetQuizInfo(
        PayLoads.stuActiveQuizList(api_access_key: AppData.api_access_key),
        token);
    mGetRemainingTimeBeforeStart();
  }

  mGetRemainingTimeBeforeStart() {
    if (quizInfoModel.value!.quizDeclareId != null) {
      int timeRemainingBeforeStart = DateTime.parse(quizInfoModel
              .value!.quizDeclare!.quizDeclareSettings!.startDateTime!)
          .difference(DateTime.now())
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

  mGetScheduleList() {
    scheduleList.value = [
      {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"},
    ];
  }

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

  void mUpdateLiveQuiz() {
    isLiveQuizActive.value = true;
    isQuizScheduleActive.value = false;
    isQuizResultActive.value = false;
    mGetRemainingTimeBeforeStart();
  }

  void mUpdateQuizSchedule() {
    isLiveQuizActive.value = false;
    isQuizScheduleActive.value = true;
    isQuizResultActive.value = false;
  }

  void mUpdateQuizResult() {
    isLiveQuizActive.value = false;
    isQuizScheduleActive.value = false;
    isQuizResultActive.value = true;
  }

  void incrementProgress() {
    if (progress.value < 1.0) {
      quizNumber.value++;
      progress.value += progressStratingPoint.value;
      kLog(progress.value);
    }
  }

  void decrementProgress() {
    if (progress.value > 0.0) {
      --quizNumber.value;
      progress.value -= progressStratingPoint.value;
    }
  }

  void mUpdateCloseLiveQuiz() {
    mUpdateQuizSchedule();
  }
}
