import '../../Config/config.dart';
import '../../Model/STUDENT/profile/stu_profile_info_model.dart';
import '../../Model/response_model.dart';
import '../../Utils/utils.dart';

class TeachProfileApis {
  // make this class singleton
  TeachProfileApis._internal();
  static final TeachProfileApis _singleton = TeachProfileApis._internal();
  factory TeachProfileApis() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<ProfileInfoModel> mGetProfileInfo(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.getStudentData(
        ApiEndpoint.employee_profile, payLoad, token);
    // kLogger.d(res.body['result']);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      print("Successfully read data");
      // kLog(res.body);
      return ProfileInfoModel.fromMap(res.body['student_profile']);
    } else {
      kLog("StatusCode: " + res.statusCode.toString());
      return ProfileInfoModel();
    }
  }
}
