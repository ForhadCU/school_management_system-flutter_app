import 'dart:convert';

import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/PUBLIC/search_school_controller.dart';
import 'package:school_management_system/Model/PUBLIC/searchSchool/site_list_model.dart';
import 'package:school_management_system/Utils/custom_statusbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingController extends GetxController {
  static LandingController get to => Get.find();

  final siteListModel = SitelistModel().obs;
  late final SharedPreferences sharedPreferences;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    CustomStatusBar.mDarkStatusBar();
    sharedPreferences = await SharedPreferences.getInstance();
    _mSetSiteDetailsModel();
  }

  _mSetSiteDetailsModel() {
    final String encodedJsonString = sharedPreferences.getString(kSiteListModel)!;
    Map<String, dynamic> decodedJson = jsonDecode(encodedJsonString);
    siteListModel.value = SitelistModel.fromMap(decodedJson);
    kLogger.w("selected school name: ${siteListModel.value.siteName}");
  }
}
