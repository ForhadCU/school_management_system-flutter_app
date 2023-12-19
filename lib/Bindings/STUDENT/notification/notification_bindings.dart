import 'package:get/get.dart';

import '../../../Controller/student_library.dart';

class NotificationBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(StuNotificationController());
  }
}
