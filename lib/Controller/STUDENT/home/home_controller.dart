import 'package:get/get.dart';
import 'package:school_management_system/Api/STUDENT/profile/stu_profile_api.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:school_management_system/Utils/custom_utils.dart';
import 'package:school_management_system/Utils/toast_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Api/PUBLIC/login_api.dart';
import '../../../Config/config.dart';
import '../../../Model/PUBLIC/login/academic_group_model.dart';
import '../../../Model/STUDENT/profile/stu_profile_info_model.dart';
import '../../../Singletones/app_data.dart';
import '../../../Utils/api structure/payloads.dart';
import '../../../Utils/custom_statusbar.dart';
import '../../../Utils/utils.dart';

class StuHomeController extends GetxController {
  static StuHomeController get to => Get.find();

  /// variable declaration
  var drawerItems = [
    {
      "name": "My exam",
      "iconUri": StudentAssetLocation.my_exam_base_ic,
    },
    {"name": "My result", "iconUri": StudentAssetLocation.my_result_base_ic},
    {"name": "My Payment", "iconUri": StudentAssetLocation.my_payments_base_ic},
    // {"name": "My routine", "iconUri": StudentAssetLocation.my_routine_base_ic},
    {"name": "My class", "iconUri": StudentAssetLocation.my_class_base_ic},
    {"name": "Live Class", "iconUri": StudentAssetLocation.live_class_base_ic},
    {
      "name": "Calendar",
      "iconUri": StudentAssetLocation.academic_calendar_base_ic
    },
    {"name": "Attendance", "iconUri": StudentAssetLocation.attendance_base_ic},
    {"name": "My Quiz", "iconUri": StudentAssetLocation.my_quiz_base_ic},
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
  void onClose() {
    super.onClose();
  }

  _mInitialization() async {
    token = await AppLocalDataFactory.mGetToken();
    designition.value = await AppLocalDataFactory.mGetUserType();

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
                : "My routine" == drawerItem
                    ? Get.toNamed(AppRoutes.routine)
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
                                            ? Get.toNamed(AppRoutes.subjects)
                                            : "Website" == drawerItem
                                                ? Get.toNamed(AppRoutes.website)
                                                : "Help Desk" == drawerItem
                                                    ? Get.toNamed(
                                                        AppRoutes.helpdesk)
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
}
