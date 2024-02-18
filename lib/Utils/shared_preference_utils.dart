import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/PUBLIC/login/academic_group_model.dart';
import '../Model/PUBLIC/searchSchool/site_list_model.dart';

SharedPreferences? prefs;

Future<String?> testSaveString(String key, String value) async {
  // if (prefs == null) prefs = await SharedPreferences.getInstance();
  prefs ?? await SharedPreferences.getInstance();
  await prefs?.setString(key, value);
  return value;
}

saveInt(String key, int value) async {
  // if (prefs == null) prefs = await SharedPreferences.getInstance();
  prefs ?? await SharedPreferences.getInstance();
  prefs?.setInt(key, value);
}

Future<String?> testGetString(String key) async {
  // if (prefs == null) prefs = await SharedPreferences.getInstance();
  prefs ?? await SharedPreferences.getInstance();
  return prefs?.getString(key);
}

class AppLocalDataFactory {
  // make this class singleton
  AppLocalDataFactory._internal();
  static final AppLocalDataFactory _singleton = AppLocalDataFactory._internal();
  factory AppLocalDataFactory() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<SitelistModel> mGetSiteListModel() async {
    final SharedPreferences sharedPreference =
        await SharedPreferences.getInstance();
    if (sharedPreference.getString(kSiteListModel) != null) {
      Map<String, dynamic> decodedJson =
          jsonDecode(sharedPreference.getString(kSiteListModel)!);
      return SitelistModel.fromMap(decodedJson);
    } else {
      kLog("Empty data");
      return SitelistModel();
    }
  }

  static Future<AcademicGroup> mGetAcademicGroupModel() async {
    final SharedPreferences sharedPreference =
        await SharedPreferences.getInstance();
    Map<String, dynamic> decodedJson =
        jsonDecode(sharedPreference.getString(kAcademicGroup)!);
    return AcademicGroup.fromMap(decodedJson);
  }

  static Future<String> mGetToken() async {
    final SharedPreferences sharedPreference =
        await SharedPreferences.getInstance();
    String str = sharedPreference.getString(kToken) ?? "";
    return str;
  }

  static Future<String> mGetUserType() async {
    final SharedPreferences sharedPreference =
        await SharedPreferences.getInstance();
    String str = sharedPreference.getString(kUserType) ?? "";
    return str;
  }
}
