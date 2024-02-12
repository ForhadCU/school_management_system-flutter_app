import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Model/STUDENT/attendance/attend_data_model.dart';

import '../../Model/STUDENT/attendance/attend_list_model.dart';
import '../../Model/response_model.dart';
import '../../Utils/utils.dart';

class TeachAttendanceApis {
  // make this class singleton
  TeachAttendanceApis._internal();
  static final TeachAttendanceApis _singleton = TeachAttendanceApis._internal();
  factory TeachAttendanceApis() {
    return _singleton;
  }

  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<AttendanceListModel> mGetAttendanceListModel(
      Map<String, dynamic> payLoad, token) async {
    kLog(payLoad);

    ResponseModel res = await CallAPI.getTeacherData(
        ApiEndpoint.teachAttendance, payLoad, token);
    if (res.statusCode == 200) {
      kLogger.d(res.body[AttendanceListModel.getParentJsonKeyForTeacher]);

      kLog("Successfully fetch mGetAttendanceListModel data");
      return AttendanceListModel.fromMap(
              res.body[AttendanceListModel.getParentJsonKeyForTeacher])
          /*  .map<StuAttendanceDataModel>((e) => StuAttendanceDataModel.fromMap(e))
          .toList() */
          ;
    } else {
      kLog("mGetAttendanceListModel status code is: ${res.statusCode}");
      showError("Server failure");
      return AttendanceListModel();
    }
  }
}
