import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Api/PUBLIC/login_api.dart';
import 'package:school_management_system/Model/PUBLIC/login/login_model.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:school_management_system/Utils/api%20structure/payloads.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  TextEditingController textEditingControllerUsernameOrEmail =
      TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  var userModel = LoginApiModel().user.obs;
  var loginApiModel = LoginApiModel().obs;

  var isLoginViewVisible = true.obs;

  mUserLogin() async {
    await LoginApi.mUserLogin(PayLoads.mUserLogin(
            username: textEditingControllerUsernameOrEmail.text,
            password: textEditingControllerPassword.text))
        .then((LoginApiModel loginApiModel) {
      userModel.value = loginApiModel.user;
    });
    if (userModel.value != null) {
      // route to user
      Get.offAllNamed(AppRoutes.dashboard);
    } else{

    }
  }
}
