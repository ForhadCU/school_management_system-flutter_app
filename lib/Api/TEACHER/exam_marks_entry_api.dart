import '../../Config/config.dart';
import '../../Model/TEACHER/examAttendance/exam_attendance_list_model.dart';
import '../../Model/TEACHER/examMarksEntry/exam_marks_entry_model.dart';
import '../../Model/response_model.dart';
import '../../Utils/utils.dart';

class ExamMarksEntryApis {
  // make this class singleton
  ExamMarksEntryApis._internal();
  static final ExamMarksEntryApis _singleton = ExamMarksEntryApis._internal();
  factory ExamMarksEntryApis() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<ExamMarksEntryListModel> mGetExamMarksEntryModel(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.getTeacherData(
        ApiEndpoint.employee_base_student_marks_entry_list, payLoad, token);
    // kLogger.d(res.body);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch mGetExamMarksEntryModel data");
      return ExamMarksEntryListModel.fromMap(res.body);
      // return ExamMarksEntryModel();
    } else {
      kLog("mGetExamMarksEntryModel status code is: ${res.statusCode}");
      return ExamMarksEntryListModel();
      //return <ClassName>[];
    }
  }

  static Future<bool> mSubmitExamMarks(
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
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch mSubmitExamMarks data");
      return true;
    } else {
      kLog("mSubmitExamMarks status code is: ${res.statusCode}");
      return false;
      //return <ClassName>[];
    }
  }
}
