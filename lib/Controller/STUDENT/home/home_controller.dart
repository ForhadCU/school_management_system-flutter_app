import 'package:get/get.dart';
import 'package:school_management_system/Api/STUDENT/profile/stu_profile_api.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:school_management_system/Utils/custom_utils.dart';
import 'package:school_management_system/Utils/toast_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Api/PUBLIC/login_api.dart';
import '../../../Config/config.dart';
import '../../../Model/PUBLIC/login/academic_group_model.dart';
import '../../../Model/PUBLIC/searchSchool/site_list_model.dart';
import '../../../Model/STUDENT/profile/stu_profile_info_model.dart';
import '../../../Singletones/app_data.dart';
import '../../../Utils/api structure/payloads.dart';
import '../../../Utils/custom_statusbar.dart';
import '../../../Utils/utils.dart';
import '../../PUBLIC/search_school_controller.dart';

class StuHomeController extends GetxController {
  static StuHomeController get to => Get.find();

  /// variable declaration
  var drawerItems = [
    {
      "name": "My exam",
      "iconUri": StudentAssetLocation.my_exam_base_ic,
    },
    {"name": "My Routine", "iconUri": StudentAssetLocation.attendance_base_ic},
    {"name": "My result", "iconUri": StudentAssetLocation.my_result_base_ic},
    {"name": "My Payment", "iconUri": StudentAssetLocation.my_payments_base_ic},
/*     {"name": "My class", "iconUri": StudentAssetLocation.my_class_base_ic},
    {"name": "Live Class", "iconUri": StudentAssetLocation.live_class_base_ic}, */
    {
      "name": "Calendar",
      "iconUri": StudentAssetLocation.academic_calendar_base_ic
    },
    {"name": "Attendance", "iconUri": StudentAssetLocation.attendance_base_ic},

    {"name": "My Quiz", "iconUri": StudentAssetLocation.my_quiz_base_ic},
    {"name": "Messages", "iconUri": StudentAssetLocation.message_ic},
    // {"name": "Website", "iconUri": PublicAssetLocation.ic_web},

    {"name": "Help Desk", "iconUri": StudentAssetLocation.help_desk_base_ic},
    {"name": "Logout", "iconUri": StudentAssetLocation.logout},
  ];

  /*  var userName = "User Name".obs;
  var designition = "Designition".obs;
  var groupName = "College".obs; */

  var profileInfoModel = ProfileInfoModel().obs;
  var designition = "".obs;
  // var groupName = "College".obs;
  var selectedAcademicGroup = AcademicGroup().obs;
  // var academicGroupList = <AcademicGroupModel>[].obs;
  var academicGroupList = <AcademicGroup>[].obs;

  var siteListModel = SitelistModel();

  var token = '';

  @override
  void onInit() async {
    super.onInit();
    kLog("Called Home init");
    CustomStatusBar.mDarkStatusBar();

    await _mInitialization();
    // await mGetAcademicGroupList();
    await _mGetProfileInfo();
  }

  @override
  void onClose() async {
    super.onClose();
    // await Get.delete<SearchSchoolController>();
  }

  _mInitialization() async {
    token = await AppLocalDataFactory.mGetToken();
    designition.value = await AppLocalDataFactory.mGetUserType();
    siteListModel = await AppLocalDataFactory.mGetSiteListModel();

    // siteListModel.value = await AppLocalDataFactory.mGetSiteListModel();
  }

  _mGetProfileInfo() async {
    profileInfoModel.value = await ProfileApis.mGetProfileInfo(
        PayLoads.teachProfileInfo(
            api_access_key: AppData.api_access_key,
            academic_group_id: selectedAcademicGroup.value.id.toString()),
        token);
  }

  mGetAcademicGroupList() async {
    print("Callded");
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
    "My exam" == drawerItem
        ? Get.toNamed(AppRoutes.exam)
        : "My result" == drawerItem
            ? Get.toNamed(AppRoutes.result)
            : "My Payment" == drawerItem
                ? Get.toNamed(AppRoutes.payments)
                : "My Routine" == drawerItem
                    ? Get.toNamed(AppRoutes.routine)
                    /*   : "My class" == drawerItem
                        ? Get.toNamed(AppRoutes.classroom)
                        : "Live Class" == drawerItem
                            ? Get.toNamed(AppRoutes.liveClass)
                             */
                    : "Calendar" == drawerItem
                        ? Get.toNamed(AppRoutes.calendar)
                        : "Attendance" == drawerItem
                            ? Get.toNamed(AppRoutes.attendance)
                            : "My Quiz" == drawerItem
                                ? Get.toNamed(AppRoutes.quiz)
                                : "My subject" == drawerItem
                                    ? Get.toNamed(AppRoutes.subjects)
                                    : "Website" == drawerItem
                                        ? Get.toNamed(AppRoutes.website)
                                        : "Help Desk" == drawerItem
                                            ? Get.toNamed(AppRoutes.helpdesk)
                                            : "Messages" == drawerItem
                                                ? Get.toNamed(
                                                    AppRoutes.stuMessage)
                                                : "Logout" == drawerItem
                                                    ? mLogutUser()
                                                    : null;
  }

  mLogutUser() async {
    // showLoading("Loggin Out...");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();

    // hideLoading();
    Get.offNamed(AppRoutes.searchSchool);
  }

  mGotoWebsite() async {
    if (siteListModel.domainName != null) {
      if (!await launchUrl(
          Uri.parse(AppData.https + siteListModel.domainName))) {
        throw Exception('Could not launch ${siteListModel.domainName}');
      } 
    }else {
        if (!await launchUrl(Uri.parse(
            "${AppData.https}${siteListModel.siteAlias}.${AppData.hostNameTheWorld}"))) {
          throw Exception(
              'Could not launch ${siteListModel.siteAlias}.${AppData.hostNameTheWorld}');
        }
      }
  }
}
