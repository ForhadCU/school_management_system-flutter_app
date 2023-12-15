import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Model/PUBLIC/siteHistory/about_us_api_model.dart';

import '../../Model/response_model.dart';
import '../../Utils/utils.dart';

class AboutUsApi {
  // make this class singleton
  AboutUsApi._internal();
  static final AboutUsApi _singleton = AboutUsApi._internal();
  factory AboutUsApi() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<AboutUs> mMethodName(Map<String, dynamic> payLoad) async {
    ResponseModel res =
        await CallAPI.getPublicData(ApiEndpoint.aboutUs, payLoad);
    // kLogger.d(res.body['result']);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      print("Successfully read data");
      AboutUsApiModel apiModel = AboutUsApiModel.fromMap(res.body);
      return apiModel.aboutUs!;
    } else {
      return AboutUs();
      //return <SiteHistoryApiM>[];
    }
  }
}
