import 'package:school_management_system/Config/config.dart';
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
    ResponseModel res =
        await CallAPI.userLogin(ApiEndpoint.userLogin, payLoad);
    // kLogger.d(res.body['result']);
    if (res.statusCode == 200) {
      kLog("Successfully read data");
      return LoginApiModel.fromMap(res.body);
    } else {
      showError("Authentication Failed");
      kLogger.e("Error in login. Status code: ${res.body}");
      return LoginApiModel();
      //return <LoginApiModel>[];
    }
  }
}
