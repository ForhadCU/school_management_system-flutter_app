import '../../../Config/config.dart';
import '../../../Model/response_model.dart';
import '../../../Utils/utils.dart';

class HomeApis {
  // make this class singleton
  HomeApis._internal();
  static final HomeApis _singleton = HomeApis._internal();
  factory HomeApis() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances
   Future<bool> mUserLogout(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res =
        await CallAPI.userLogout(ApiEndpoint.userLogout, payLoad, token);
    // kLogger.d(res.body);
    if (res.statusCode == 200 || res.statusCode == 401) {
      kLog("Successfully read mUserLogout data");
      return true;
    } else {
      showError("Authentication Failed");
      kLogger.e("Error in logout. Status code: ${res.body}");
      return false;
      //return <LoginApiModel>[];
    }
  }
}
