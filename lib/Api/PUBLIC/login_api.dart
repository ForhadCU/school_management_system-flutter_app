import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Model/PUBLIC/login/academic_group_model.dart';
import 'package:school_management_system/Model/PUBLIC/login/login_model.dart';

import '../../Model/response_model.dart';
import '../../Utils/utils.dart';

class LoginApi {
  // make this class singleton
  LoginApi._internal();
  static final LoginApi _singleton = LoginApi._internal();
  factory LoginApi() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<LoginApiModel> mUserLogin(Map<String, dynamic> payLoad) async {
    ResponseModel res = await CallAPI.userLogin(ApiEndpoint.userLogin, payLoad);
    // kLogger.d(res.body['result']);
    if (res.statusCode == 200) {
      kLog("Successfully read mUserLogin data");
      return LoginApiModel.fromMap(res.body);
    } else {
      showError("Authentication Failed");
      kLogger.e("Error in login. Status code: ${res.body}");
      return LoginApiModel();
      //return <LoginApiModel>[];
    }
  }

  static Future<List<AcademicGroup>> mGetAcademicGroupList(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.getStudentData(
        ApiEndpoint.academic_group_list_employee, payLoad, token);
    kLogger.d(res.body);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch mGetAcademicGroupList data");
      return AcademicGroupListModel.fromMap(res.body).academicGroupList!;
    } else {
      hideLoading();
      showError("Internal server error");
      kLog("mGetAcademicGroupList status code is: ${res.statusCode}");
      return <AcademicGroup>[];
      //return <AcademicGroupListModel  >[];
    }
  }
}
