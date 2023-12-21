import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/PUBLIC/landing_controller.dart';
import 'package:school_management_system/Views/PUBLIC/login/login.dart';
import 'package:school_management_system/Views/PUBLIC/notice/notice.dart';
import 'package:school_management_system/Views/PUBLIC/notification/notifications.dart';
import 'package:school_management_system/Views/student_library.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../student_library.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find();

  final List<Widget> screens = [
    const StuHome(),
    const StudentNotice(),
    const Notifications(),
    const Profile(),
  ];
  final RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // Get.lazyPut(() => StuHomeController());
    // Get.lazyPut(() => LandingController());
    // Get.lazyPut(() => StuNoticeController());
    // Get.lazyPut(() => ProfileController());
    Get.put(StuHomeController());
    Get.put(StuNotificationController());
    Get.put(StuNoticeController());
    Get.put(StuProfileController());
  }

  @override
  void onClose() {
    super.onClose();
  }

  void mOnItemTapped(int index) {
    selectedIndex.value = index;
  }
}
