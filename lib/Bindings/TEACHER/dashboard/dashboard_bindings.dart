import 'package:get/get.dart';
import 'package:school_management_system/Controller/TEACHER/dashboard/dashboard_controller.dart';
import 'package:school_management_system/Controller/TEACHER/notification/notification_controller.dart';
import '../../../Controller/TEACHER/home/home_controller.dart';
import '../../../Controller/TEACHER/notice/notice_controller.dart';
import '../../../Controller/TEACHER/profile/profile_controller.dart';

class TeachDashboardBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(TeachDashboardController());
    Get.lazyPut(() => TeachDashboardController());
    Get.lazyPut(() => TeachHomeController());
    Get.lazyPut(() => TeachNoticeController());
    Get.lazyPut(() => TeachNotificationController());
    Get.lazyPut(() => TeachProfileController());
  }
}
