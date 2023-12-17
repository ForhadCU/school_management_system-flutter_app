import 'package:get/get.dart';
import 'package:school_management_system/Controller/notification.dart';

class NotificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NotificationController());
  }
}
