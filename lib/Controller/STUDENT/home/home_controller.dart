import 'package:get/get.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:school_management_system/Utils/toast_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Config/config.dart';

class StuHomeController extends GetxController {
  static StuHomeController get to => Get.find();

  /// variable declaration
  var drawerItems = [
    "My exam",
    "My result",
    "My Payment",
    "My routine",
    "My class",
    "Live Class",
    "Calendar",
    "Attendance",
    "My Quiz",
    "My subject",
    "Website",
    "Help Desk",
    "Logout",
  ];

  @override
  void onInit() {
    super.onInit();
    kLog("Called Home init");
  }

  @override
  void onClose() {
    super.onClose();
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
