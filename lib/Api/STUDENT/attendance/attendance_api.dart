import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Model/STUDENT/attendance/attendance_model.dart';

import '../../../Model/response_model.dart';
import '../../../Utils/utils.dart';

class StuAttendanceApis {
  // make this class singleton
  StuAttendanceApis._internal();
  static final StuAttendanceApis _singleton = StuAttendanceApis._internal();
  factory StuAttendanceApis() {
    return _singleton;
  }

  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<List<StuAttendanceModel>> mGetStuAttendanceList(
      Map<String, dynamic> payLoad, token) async {
    ResponseModel res = await CallAPI.getStudentData(
        ApiEndpoint.stuDateWiseAttendanceList, payLoad, token);
    if (res.statusCode == 200) {
      // kLogger.d(res.body[StuAttendanceModel.getParentJsonKey]);

      kLog("Successfully fetch mGetStuAttendanceList data");
      return res.body[StuAttendanceModel.getParentJsonKey]
              [StuAttendanceModel.getDataListJsonKey]
          .map<StuAttendanceModel>((e) => StuAttendanceModel.fromMap(e))
          .toList();
    } else {
      kLog("mGetStuAttendanceList status code is: ${res.statusCode}");
      showError("Server failure");
      return <StuAttendanceModel>[];
    }
  }
}
