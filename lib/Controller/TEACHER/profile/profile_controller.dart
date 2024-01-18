import 'package:get/get.dart';
import 'package:school_management_system/Api/STUDENT/profile/stu_profile_api.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Model/PUBLIC/searchSchool/site_list_model.dart';
import 'package:school_management_system/Model/STUDENT/profile/stu_profile_info_model.dart';
import 'package:school_management_system/Singletones/app_data.dart';
import 'package:school_management_system/Utils/api%20structure/payloads.dart';
import 'package:school_management_system/Utils/utils.dart';

class TeachProfileController extends GetxController {
  static TeachProfileController get to => Get.find();
/* 
  /// variable declaration
  var token = "".obs;
  var siteListModel = SitelistModel().obs;
  var stuProfileInfoModel = StudentProfileInfoModel().obs;

  @override
  void onInit() async {
    super.onInit();
    kLog("Profile Controller init");
    await _mInitialization();
    await _mGetProfileInfo();
  }

  @override
  void onClose() {
    super.onClose();
  }

  _mInitialization() async {
    token.value = await AppLocalDataFactory.mGetToken();
    siteListModel.value = await AppLocalDataFactory.mGetSiteListModel();
  }

  _mGetProfileInfo() async {
    stuProfileInfoModel.value = await ProfileApis.mGetProfileInfo(
        {"api_access_key": AppData.api_access_key}, token.value);
    kLog("stuProfileInfoModel username: ${stuProfileInfoModel.value.username}");
  } */

  /// code goes here
}
