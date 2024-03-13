import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_management_system/Api/PUBLIC/school_search_api.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/PUBLIC/landing_controller.dart';
import 'package:school_management_system/Controller/common/common_controller.dart';
import 'package:school_management_system/Model/PUBLIC/searchSchool/site_list_model.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Routes/app_pages.dart';

class SearchSchoolController extends GetxController {
  static SearchSchoolController get to => Get.find();
  var allSitesList = Rxn<List<SitelistModel>>();
  RxList<SitelistModel> searchedSitesList = <SitelistModel>[].obs;
  TextEditingController textEditingControllerSearchSite =
      TextEditingController();
  var _siteListModel = SitelistModel().obs;
  late final SharedPreferences sharedPreferences;
  var isAllSitesLoaded = false.obs;
  var isVisibleCharWarning = true.obs;
  var isLoading = false.obs;
  var isFetchingSiteData = false.obs;

  @override
  void onInit() async {
    super.onInit();
    kLog("Search school init");
    sharedPreferences = await SharedPreferences.getInstance();
    await mGetAllSites();
  }

  @override
  onClose() async {
    /* Get. delete<SearchSchoolController>(force: true); */
    await Get.delete<SearchSchoolController>();
    kLog("Called OnClose");
  }

  mGetAllSites() async {
    // showLoading("Getting Site list");
    isFetchingSiteData.value = true;
    allSitesList.value = await SchoolSearchApi.mGetAllSites();

    if (allSitesList.value!.length > 0) {
      isAllSitesLoaded.value = true;
    }
    isFetchingSiteData.value = false;
    print(allSitesList.value!.length);
  }

  mSetSiteListModel(SitelistModel sitelistModel) async {
    _siteListModel.value = sitelistModel;
    bool isSet = await sharedPreferences.setString(
        kSiteListModel, jsonEncode(_siteListModel.value.toMap()));
    if (isSet) {
      final commonCtrlr = Get.put(CommonController());
      commonCtrlr.currentSitelistModel.value = sitelistModel;
      kLog(commonCtrlr.currentSitelistModel.value.siteAlias!);
      Get.offAllNamed(AppRoutes.landing);
    } else {
      kLog("Failed to save Site Data");
      ScaffoldMessenger.of(kGlobContext).showSnackBar(SnackBar(
        content: Text(
          "Failed",
          style: kBody.copyWith(color: Colors.white),
        ),
        duration: const Duration(milliseconds: 1500),
        backgroundColor: Colors.red,
      ));
    }
  }

  void mGetSearchResult(value) {
    // print(textEditingControllerSearchSite.text);
    mClearCurrentSearchList();

    value == null || value == ''
        ? null
        : {
            searchedSitesList.value = allSitesList.value!
                .where((element) =>
                    element.siteName!.isCaseInsensitiveContainsAny(value))
                .toList()
          };
    for (var element in searchedSitesList) {
      print(element.siteLogo);
    }
  }

  void mClearCurrentSearchList() {
    searchedSitesList.clear();
  }
}
