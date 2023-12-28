import 'package:get/get.dart';

import '../../../Controller/student_library.dart';

class AttendanceBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(StuAttendanceController());
  }
}
