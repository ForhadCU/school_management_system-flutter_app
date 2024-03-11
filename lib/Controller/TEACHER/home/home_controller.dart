import 'dart:convert';

import 'package:get/get.dart';
import 'package:school_management_system/Api/TEACHER/profile_api.dart';
import 'package:school_management_system/Controller/TEACHER/examAttandence/exam_attandence_controller.dart';
import 'package:school_management_system/Controller/TEACHER/profile/profile_controller.dart';
import 'package:school_management_system/Controller/TEACHER/test/test_ctrlr.dart';
import 'package:school_management_system/Controller/common/common_controller.dart';
import 'package:school_management_system/Model/PUBLIC/academicCalendar/academic_grp_api_model.dart';
import 'package:school_management_system/Model/PUBLIC/searchSchool/site_list_model.dart';
import 'package:school_management_system/Model/TEACHER/profile/teach_profile_info_model.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Api/PUBLIC/login_api.dart';
import '../../../Api/STUDENT/home/home_api.dart';
import '../../../Api/STUDENT/profile/stu_profile_api.dart';
import '../../../Config/config.dart';
import 'package:school_management_system/Model/PUBLIC/login/academic_group_model.dart';
import '../../../Model/STUDENT/profile/stu_profile_info_model.dart';
import '../../../Singletones/app_data.dart';
import '../../../Utils/api structure/payloads.dart';

class TeachHomeController extends GetxController {
  static TeachHomeController get to => Get.find();

  /// variable declaration
  var drawerItems = [
    {
      "name": "Exam Attendance",
      "iconUri": StudentAssetLocation.attendance_base_ic
    },
    {
      "name": "Exam Mark Entry",
      "iconUri": StudentAssetLocation.my_exam_base_ic
    },
    {"name": "My Routine", "iconUri": StudentAssetLocation.routine_base_ic},
    {"name": "My Attendance", "iconUri": StudentAssetLocation.attendance_base_ic},
    {
      "name": "Periodic Attendance",
      "iconUri": StudentAssetLocation.periodic_attend_base_ic
    },
    {"name": "Messages", "iconUri": StudentAssetLocation.message_ic},
    {"name": "Help Desk", "iconUri": StudentAssetLocation.help_desk_base_ic},
    {"name": "Website", "iconUri": PublicAssetLocation.ic_web},
    {"name": "Logout", "iconUri": StudentAssetLocation.logout},
  ];

  var profileInfoModel = TeachProfileInfoModel().obs;
  var designition = "".obs;
  // var groupName = "College".obs;
  var selectedAcademicGroup = AcademicGroup().obs;
  // var academicGroupList = <AcademicGroupModel>[].obs;
  var academicGroupList = <AcademicGroup>[].obs;

  var token = '';
  var siteListModel = SitelistModel().obs;

  @override
  void onInit() async {
    super.onInit();
    kLog("Called Home init");
    /* kLog(await AppLocalDataFactory.mGetAcademicGroupModel()
        .then((value) => value.academicGroupName!)); */
    await _mInitialization();
    await mGetAcademicGroupList();
    await _mGetProfileInfo();
  }

  @override
  void onClose() {
    super.onClose();
  }

  _mInitialization() async {
    token = await AppLocalDataFactory.mGetToken();
    designition.value = await AppLocalDataFactory.mGetUserType();
    siteListModel.value = await AppLocalDataFactory.mGetSiteListModel();
    kLog("SiteAlis: ${siteListModel.value.siteAlias}");
    kLog("Designition: ${designition.value}");

    // siteListModel.value = await AppLocalDataFactory.mGetSiteListModel();
  }

  _mGetProfileInfo() async {
    profileInfoModel.value = await TeachProfileApis.mGetProfileInfo(
        PayLoads.teachProfileInfo(
            api_access_key: AppData.api_access_key,
            academic_group_id: selectedAcademicGroup.value.id.toString()),
        token);
  }

  mGetAcademicGroupList() async {
    if (token.isNotEmpty) {
      academicGroupList.value = await LoginApi.mGetAcademicGroupList(
          PayLoads.employAcademicGroupList(
              api_access_key: AppData.api_access_key),
          token);
      // kLog(academicGroupList.length);

      if (academicGroupList.isNotEmpty) {
        await AppLocalDataFactory.mGetAcademicGroupModel().then((value) {
          for (var item in academicGroupList) {
            if (item.academicGroupName == value.academicGroupName) {
              selectedAcademicGroup.value = item;
            }
          }
        });
      }
    } else {
      kLog("Empty Token");
    }
  }

  /// code goes here
  mNavigateTo(String drawerItem) {
    "Exam Mark Entry" == drawerItem
        ? Get.toNamed(AppRoutes.examMarksEntry)
        : "Exam Attendance" == drawerItem
            ? Get.toNamed(AppRoutes.examAttendance)
            /* : "My Payment" == drawerItem
                ? Get.toNamed(AppRoutes.payments)
                
                    : "My class" == drawerItem
                        ? Get.toNamed(AppRoutes.classroom)
                        : "Live Class" == drawerItem
                            ? Get.toNamed(AppRoutes.liveClass)
                            : "Calendar" == drawerItem
                                ? Get.toNamed(AppRoutes.calendar)
                                : "Attendance" == drawerItem
                                    ? Get.toNamed(AppRoutes.attendance)
                                    : "My Quiz" == drawerItem
                                        ? Get.toNamed(AppRoutes.quiz)
                                        : "My subject" == drawerItem
                                            ? Get.toNamed(AppRoutes.subjects) */
            : "My Routine" == drawerItem
                ? Get.toNamed(AppRoutes.teachRoutine)
                /*  : "Website" == drawerItem
                    ? Get.toNamed(AppRoutes.website)
                    */
                : "My Attendance" == drawerItem
                    ? Get.toNamed(AppRoutes.teachAttendance)
                    : "Periodic Attendance" == drawerItem
                        ? Get.toNamed(AppRoutes.teachPeriodicAttnd)
                        : "Messages" == drawerItem
                            ? Get.toNamed(AppRoutes.teachMessage)
                            : "Help Desk" == drawerItem
                                ? Get.toNamed(AppRoutes.teachHelpdesk)
                                : "Website" == drawerItem
                                    ? {mGotoWebsite()}
                                    : "Logout" == drawerItem
                                        ? mLogutUser()
                                        : null;
  }

  mLogutUser() async {
    var isLogout = await HomeApis()
        .mUserLogout({"api_access_key": AppData.api_access_key}, token);
    if (isLogout) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.remove(kToken);
      Get.offAllNamed(AppRoutes.landing);
    }
  }

  void mChangeSelectedAcademicGroup(AcademicGroup? selectedModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    selectedAcademicGroup.value = selectedModel!;

    await sharedPreferences.setString(
        kAcademicGroup, jsonEncode(selectedModel.toMap()));
  }

  mGotoWebsite() async {
    if (siteListModel.value.domainName != null) {
      if (!await launchUrl(
          Uri.parse(AppData.https + siteListModel.value.domainName))) {
        throw Exception('Could not launch ${siteListModel.value.domainName}');
      }
    } else {
      if (!await launchUrl(Uri.parse(
          "${AppData.https}${siteListModel.value.siteAlias}.${AppData.hostNameShort}"))) {
        throw Exception(
            'Could not launch ${siteListModel.value.siteAlias}.${AppData.hostNameShort}');
      }
    }
  }
}
