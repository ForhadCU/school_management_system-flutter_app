import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/PUBLIC/landing_controller.dart';
import 'package:school_management_system/Controller/TEACHER/home/home_controller.dart';
import 'package:school_management_system/Controller/TEACHER/notice/notice_controller.dart';
import 'package:school_management_system/Controller/TEACHER/profile/profile_controller.dart';
import 'package:school_management_system/Controller/teach_home.dart';
import 'package:school_management_system/Views/PUBLIC/login/login.dart';
import 'package:school_management_system/Views/PUBLIC/notice/notice.dart';
import 'package:school_management_system/Views/PUBLIC/notification/notifications.dart';
import 'package:school_management_system/Views/TEACHER/home/home.dart';
import 'package:school_management_system/Views/TEACHER/notice/notice.dart';
import 'package:school_management_system/Views/TEACHER/notification/notification.dart';
import 'package:school_management_system/Views/TEACHER/profile/profile.dart';
import 'package:school_management_system/Views/student_library.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../student_library.dart';

class TeachDashboardController extends GetxController {
  static TeachDashboardController get to => Get.find();

  final List<Widget> screens = [
    const TeachHome(),
    const TeachNotice(),
    const TeachNotification(),
    const TeachProfile(),
  ];
  final RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // Get.lazyPut(() => StuHomeController());
    // Get.lazyPut(() => LandingController());
    // Get.lazyPut(() => StuNoticeController());
    // Get.lazyPut(() => ProfileController());
    Get.put(TeachHomeController());
    Get.put(TeachNoticeController());
    Get.put(TeachNoticeController());
    Get.put(TeachProfileController());
  }

  @override
  void onClose() {
    super.onClose();
  }

  void mOnItemTapped(int index) {
    selectedIndex.value = index;
  }
}
