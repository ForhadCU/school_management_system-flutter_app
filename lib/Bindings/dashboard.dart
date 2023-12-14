import 'package:get/get.dart';
import 'package:school_management_system/Controller/dashboard.dart';
import 'package:school_management_system/Controller/home.dart';
import 'package:school_management_system/Controller/login.dart';
import 'package:school_management_system/Controller/notification.dart';

import '../Controller/PUBLIC/notice_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(NoticeController());
    Get.put(NotificationController());
    Get.put(LoginController());
  }
}
