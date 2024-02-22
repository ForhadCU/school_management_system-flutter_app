import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/TEACHER/notification/notification_controller.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

class TeachNotificationBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(TeachNotificationController());
    Get.lazyPut(() => TeachNotificationController());
  }
}
