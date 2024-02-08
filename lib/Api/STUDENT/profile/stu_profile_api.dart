import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Model/STUDENT/profile/stu_profile_info_model.dart';

import '../../../Model/response_model.dart';
import '../../../Utils/utils.dart';

class ProfileApis {
  // make this class singleton
  ProfileApis._internal();
  static final ProfileApis _singleton = ProfileApis._internal();
  factory ProfileApis() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances
  static Future<ProfileInfoModel> mGetProfileInfo(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.getStudentData(
        ApiEndpoint.stuProfileInfo, payLoad, token);
    // kLogger.d(res.body['result']);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      print("Successfully mGetProfileInfo read data");
      // kLog(res.body);
      return ProfileInfoModel.fromMap(res.body['student_profile']);
    } else {
      kLog("StatusCode: " + res.statusCode.toString());
      return ProfileInfoModel();
    }
  }
}
