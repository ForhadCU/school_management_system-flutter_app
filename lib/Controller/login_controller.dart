import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:school_management_system/Api/PUBLIC/login_api.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/PUBLIC/landing_controller.dart';
import 'package:school_management_system/Model/PUBLIC/login/academic_group_model.dart';
import 'package:school_management_system/Model/PUBLIC/login/login_model.dart';
import 'package:school_management_system/Model/PUBLIC/searchSchool/site_list_model.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:school_management_system/Singletones/app_data.dart';
import 'package:school_management_system/Utils/api%20structure/payloads.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  TextEditingController textEditingControllerUsernameOrEmail =
      TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  var userModel = LoginApiModel().user.obs;
  var loginApiModel = LoginApiModel().obs;
  var siteListModel = SitelistModel().obs;
  var selectedAcademicGroupName = Rxn<String>();
  var academicGroupList = <AcademicGroup>[].obs;
  var academicGroup = AcademicGroup().obs;

  var isLoginViewVisible = true.obs;
  var token = '';
  var isLoading = true.obs;

  @override
  onInit() async {
    super.onInit();
    kLog("<<Login init>>");
    await _mInitialization();
    await mGetAcademicGroupList();
  }

  mUpdateAcademicGroupSelection(
      String value, AcademicGroup selectedAcademicGroup) {
    selectedAcademicGroupName.value = value;
    academicGroup.value = selectedAcademicGroup;
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
      /* await _mSaveSessionToLocal();
      Get.offNamed(AppRoutes.academicGroup); */
      // await mGetAcademicGroupList();
      await _mSaveSessionToLocal();
      // route to user
      if (userModel.value!.userType == student) {
        // await _mSaveSessionToLocal();

        Get.offAllNamed(AppRoutes.dashboard);
      } else {
        await mGetAcademicGroupList();
        Get.offAllNamed(AppRoutes.teachDashboard);
      }
    } else {
      kLog("userModel null");
    }
  }

  Future<void> _mSaveSessionToLocal() async {
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setString(kToken, loginApiModel.value.token!);
    sharedPreference.setString(kUserType, userModel.value!.userType!);
    token = loginApiModel.value.token!;
    if (token.isNotEmpty) {
      kLog("Saved Token");
    } else {
      Logger().d("Token not Found");
    }
  }

  Future<void> mSaveAcademicGroupToLocal() async {
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setString(
        kAcademicGroup, jsonEncode(academicGroup.value.toMap()));
    /* kLog(
        "ID: ${await AppLocalDataFactory.mGetAcademicGroupModel().then((value) => value.id!)}"); */
  }

  _mInitialization() async {
    siteListModel.value = LandingController.to.siteListModel.value;
    token = await AppLocalDataFactory.mGetToken();

    // siteListModel.value = await AppLocalDataFactory.mGetSiteListModel();
  }

  mGetAcademicGroupList() async {
    if (token.isNotEmpty) {
      academicGroupList.value = await LoginApi.mGetAcademicGroupList(
          PayLoads.employAcademicGroupList(
              api_access_key: AppData.api_access_key),
          token);
      academicGroup.value = academicGroupList.first;
      await mSaveAcademicGroupToLocal();
      // kLog(academicGroupList.length);
    } else {
      kLog("Empty Token");
    }
  }

  mGoToHome() {
    if (selectedAcademicGroupName.value != null) {
      Get.offAllNamed(AppRoutes.teachDashboard);
    } else {
      ScaffoldMessenger.of(kGlobContext).showSnackBar(SnackBar(
        content: Text(
          "Select your group",
          style: kBody.copyWith(color: Colors.black),
        ),
        backgroundColor: Colors.amber,
        duration: const Duration(milliseconds: 1500),
      ));
    }
  }
}
