import 'package:school_management_system/Controller/PUBLIC/search_school_controller.dart';
import 'package:school_management_system/Model/PUBLIC/searchSchool/site_list_model.dart';

import '../../Model/response_model.dart';
import '../../Utils/utils.dart';

class SchoolSearchApi {
  // make this class singleton
  SchoolSearchApi._internal();
  static final SchoolSearchApi _singleton = SchoolSearchApi._internal();
  factory SchoolSearchApi() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances
  static const bodyKey = 'site_list';
  static final controller = SearchSchoolController.to;

  static Future<List<SitelistModel>> mGetAllSites(
      [Map<String, dynamic>? payLoad]) async {
    ResponseModel res = await CallAPI.getSiteData();
    // kLogger.d(res.body['result']);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      print("Successfully read data");
      controller.isAllSitesLoaded.value = true;
      return res.body[bodyKey]
          .map<SitelistModel>((e) => SitelistModel.fromMap(e))
          .toList();
    } else {
      hideLoading();
      showError("Internal server error");
      return <SitelistModel>[];
    }
  }
}
