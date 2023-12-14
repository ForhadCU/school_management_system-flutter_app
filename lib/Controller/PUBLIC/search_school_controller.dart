import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_management_system/Api/PUBLIC/school_search_api.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/PUBLIC/landing_controller.dart';
import 'package:school_management_system/Model/PUBLIC/searchSchool/site_list_model.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchSchoolController extends GetxController {
  static SearchSchoolController get to => Get.find();

  var allSitesList = Rxn<List<SitelistModel>>();
  RxList<SitelistModel> searchedSitesList = <SitelistModel>[].obs;
  TextEditingController textEditingControllerSearchSite =
      TextEditingController();
  var _siteListModel = SitelistModel().obs;
  late final SharedPreferences sharedPreferences;

  var isAllSitesLoaded = false.obs;

  @override
  void onInit() async {
    super.onInit();
    sharedPreferences = await SharedPreferences.getInstance();
    await mGetAllSites();
  }

  mGetAllSites() async {
    showLoading("Getting Site list");

    allSitesList.value = await SchoolSearchApi.mGetAllSites();

    print(allSitesList.value!.length);
  }

  mSetSiteListModel(SitelistModel sitelistModel) {
    _siteListModel.value = sitelistModel;
    sharedPreferences.setString(
        kSiteListModel, jsonEncode(_siteListModel.value.toMap()));
  }

  void mGetSearchResult(value) {
    print(textEditingControllerSearchSite.text);
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
