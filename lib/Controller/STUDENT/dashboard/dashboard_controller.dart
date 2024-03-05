import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Views/student_library.dart';

import '../../../Views/STUDENT/home/home.dart';
import '../../../Views/STUDENT/notice/notice.dart';
import '../../../Views/STUDENT/profile/profile.dart';

import '../../../Utils/custom_statusbar.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find();

  final List<Widget> screens = [
    StuHome(),
    StudentNotice(),
    StuNotification(),
    Profile(),
  ];
  final RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    CustomStatusBar.mDarkStatusBar();
/* 
    Get.put(StuHomeController());
    Get.put(StuNotificationController());
    Get.put(StuNoticeController());
    Get.put(StuProfileController()); */
  }

  @override
  void onClose() {
    super.onClose();
  }

  void mOnItemTapped(int index) {
    selectedIndex.value = index;
  }
}
