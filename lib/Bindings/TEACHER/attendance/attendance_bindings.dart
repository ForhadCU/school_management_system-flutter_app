import 'package:get/get.dart';

import '../../../Controller/TEACHER/attendance/attendance_controller.dart';

class TeachAttendanceBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(TeachAttendanceController());
  }
}
