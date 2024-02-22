import 'package:get/get.dart';

import '../../../Controller/student_library.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(DashboardController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => StuHomeController());
    Get.lazyPut(() => StuNotificationController());
    Get.lazyPut(() => StuNoticeController());
    Get.lazyPut(() => StuProfileController());
  }
}
