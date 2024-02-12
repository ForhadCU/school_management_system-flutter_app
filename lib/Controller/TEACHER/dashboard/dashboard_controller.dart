import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/TEACHER/home/home_controller.dart';
import 'package:school_management_system/Controller/TEACHER/notice/notice_controller.dart';
import 'package:school_management_system/Controller/TEACHER/profile/profile_controller.dart';
import 'package:school_management_system/Views/TEACHER/home/home.dart';
import 'package:school_management_system/Views/TEACHER/notice/notice.dart';
import 'package:school_management_system/Views/TEACHER/notification/notification.dart';
import 'package:school_management_system/Views/TEACHER/profile/profile.dart';

import '../../../Utils/custom_statusbar.dart';

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

    CustomStatusBar.mDarkStatusBar();

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
