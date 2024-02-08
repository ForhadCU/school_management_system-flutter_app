import 'package:get/get.dart';
import 'package:school_management_system/Controller/TEACHER/routine/routine_controller.dart';
import 'package:school_management_system/Controller/common/common_controller.dart';

import '../../../Controller/student_library.dart';

class TeachRoutineBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(TeachRoutineController());
    Get.put(CommonController());
  }
}
