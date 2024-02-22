import '../../Config/config.dart';
import '../../Model/TEACHER/version_year_shift_model.dart';
import '../../Model/response_model.dart';
import '../../Utils/utils.dart';

class TeachTestApi {
  // make this class singleton 
    TeachTestApi._internal();
    static final TeachTestApi _singleton = TeachTestApi._internal();
    factory TeachTestApi() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances


   static Future<VersionYearShiftModel> mGetVersionYearShiftModel(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.getTeacherData(
        isShowLoading: false,
        ApiEndpoint.academic_version_year_shift_list,
        payLoad,
        token);
    // kLogger.d(res.body);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch mGetVersionYearShiftModel data");
      return VersionYearShiftModel.fromMap(res.body);
    } else {
      hideLoading();
      showError("Server failure");
      kLog("mGetVersionYearShiftModel status code is: ${res.statusCode}");
      return VersionYearShiftModel();
      //return <ClassName>[];
    }
  }
}