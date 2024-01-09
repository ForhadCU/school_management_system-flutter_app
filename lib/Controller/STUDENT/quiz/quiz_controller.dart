import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';

class StuQuizController extends GetxController {
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

  @override
  void onInit()  {
    super.onInit();
    progressStratingPoint.value = (100 / 20) / 100;
     mGetScheduleList();
    // progress.value = progressStratingPoint.value;
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// code goes here
   mGetScheduleList()  {
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
