import 'package:school_management_system/Model/STUDENT/quiz/quiz_info_model.dart';

import '../../../Config/config.dart';
import '../../../Model/response_model.dart';
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
        ApiEndpoint.stuActiveQuizInfo, payLoad, token);
    if (res.statusCode == 200) {
      kLogger.d(res.body[QuizInfoModel.getParentJsonKey]);

      kLog("Successfully fetch mGetQuizInfo data");
      return QuizInfoModel.fromMap(res.body[QuizInfoModel.getParentJsonKey]);
      // return QuizInfoModel();
    } else {
      kLog("mGetQuizInfo status code is: ${res.statusCode}");
      showError("Server failure");
      return QuizInfoModel();
    }
  }
}
