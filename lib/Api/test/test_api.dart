import 'package:get/get.dart';
import 'package:school_management_system/Model/PUBLIC/searchSchool/site_list_model.dart';

import '../../Model/response_model.dart';
import '../../Utils/utils.dart';

class TestApi  {
  // make this class singleton 
    TestApi._internal();
    static final TestApi _singleton = TestApi._internal();
    factory TestApi() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances

  Future<List<SitelistModel>> mSearchUsers(
      {required String email, required String username}) async {
    ResponseModel res = await CallAPI.getData('appusers', {
      "page": "0",
      "size": "10",
      if (email.isNotEmpty) "email": email,
      if (username.isNotEmpty) "userName": username,
    });

    /// when search a particular user
    // ResponseModel res = await CallAPI().getData('appusers', {"page": 0, "size": 12, "email": "joshirakesh7782@gmail.com"});
    // kLogger.d(res.body['result']);
    if (res.statusCode == 200 && res.body['success'] == true) {
      print("Successfully read data");
      return res.body['result']['content']
          .map<SitelistModel>((e) => SitelistModel.fromMap(e))
          .toList();
    } else {
      return <SitelistModel>[];
    }
  }


}
