import 'package:get/get.dart';

import '../../../Controller/student_library.dart';

class LogoutBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(LogoutController());
    Get.lazyPut(() => LogoutController());
  }
}
