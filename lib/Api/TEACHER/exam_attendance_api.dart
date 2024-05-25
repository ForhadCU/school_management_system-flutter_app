import '../../Config/config.dart';
import '../../Model/TEACHER/examAttendance/exam_attendance_list_model.dart';
import '../../Model/response_model.dart';
import '../../Utils/utils.dart';

class ExamAttendanceApis {
  // make this class singleton
  ExamAttendanceApis._internal();
  static final ExamAttendanceApis _singleton = ExamAttendanceApis._internal();
  factory ExamAttendanceApis() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<ExamAttendanceListModel> mGetExamAttendanceListModel(
      Map<String, dynamic> payLoad, String token) async {
    kLog(payLoad);
    ResponseModel res = await CallAPI.getTeacherData(
        ApiEndpoint.student_list_for_attendance_by_employ, payLoad, token);
    kLogger.d(res.body);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch mGetExamAttendanceListModel data");
      return ExamAttendanceListModel.fromMap(res.body);
      // return ExamAttendanceListModel();
    } else {
      hideLoading();
      showError("Internal server error");
      kLog("mGetExamAttendanceListModel status code is: ${res.statusCode}");
      return ExamAttendanceListModel();
      //return <ClassName>[];
    }
  }

  static Future<bool> mSubmitExamAttendanceList(
      {required String endPoint,
      required Map<String, dynamic> bodyData,
      required String token,
      required Map<String, dynamic> payload}) async {
    ResponseModel res = await CallAPI.postTeacherData(
      endPoint: endPoint,
      bodyData: bodyData,
      token: token,
      payload: payload,
    );
    kLogger.d(res.body);
    if (res.statusCode == 200) {
      kLog("Successfully submit mSubmitExamAttendanceList data");
      // return ExamAttendanceListModel.fromMap(res.body);
      return true;
    } else {
      hideLoading();
      showError("Internal server error");
      kLog("mSubmitExamAttendanceList status code is: ${res.statusCode}");
      return false;
      //return <ClassName>[];
    }
  }
}
