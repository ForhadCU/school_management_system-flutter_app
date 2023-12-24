import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Api/PUBLIC/login_api.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/PUBLIC/landing_controller.dart';
import 'package:school_management_system/Model/PUBLIC/login/login_model.dart';
import 'package:school_management_system/Model/PUBLIC/searchSchool/site_list_model.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:school_management_system/Singletones/app_data.dart';
import 'package:school_management_system/Utils/api%20structure/payloads.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  TextEditingController textEditingControllerUsernameOrEmail =
      TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  var userModel = LoginApiModel().user.obs;
  var loginApiModel = LoginApiModel().obs;
  var siteListModel = SitelistModel().obs;

  var isLoginViewVisible = true.obs;

  @override
  onInit() {
    super.onInit();
    _mInitialization();
  }

  mUserLogin() async {
    await LoginApi.mUserLogin(PayLoads.mUserLogin(
            api_access_key: AppData.api_access_key,
            username: textEditingControllerUsernameOrEmail.text,
            password: textEditingControllerPassword.text))
        .then((LoginApiModel loginApiModel) {
      this.loginApiModel.value = loginApiModel;
      userModel.value = loginApiModel.user;
    });
    if (userModel.value != null) {
      await _mSaveSessionToLocal();
      // route to user
      Get.offAllNamed(AppRoutes.dashboard);
    } else {
      kLog("userModel null");
    }
  }

  Future<void> _mSaveSessionToLocal() async {
    final sharedPreference = await SharedPreferences.getInstance();
    kLog("token: ${loginApiModel.value.token}");
    sharedPreference.setString(kToken, loginApiModel.value.token!);
  }

  void _mInitialization() {
    siteListModel.value = LandingController.to.siteListModel.value;
  }
}
