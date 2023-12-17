import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Views/STUDENT/home/home.dart';
import 'package:school_management_system/Views/PUBLIC/login/login.dart';
import 'package:school_management_system/Views/PUBLIC/notice/notice.dart';
import 'package:school_management_system/Views/PUBLIC/notification/notifications.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find();

  final List<Widget> screens = [
      Home(),
    const Notice(),
    const Notifications(),
    const Login(),
  ];
  final RxInt selectedIndex = 0.obs;

  void mOnItemTapped(int index) {
    selectedIndex.value = index;
  }
}
