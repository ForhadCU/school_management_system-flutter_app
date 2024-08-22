import 'package:get/get.dart';

import '../../../Controller/TEACHER/leave/leave_controller.dart';

class TeachLeaveBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeachLeaveController());
  }
}
