import 'package:get/get.dart';
import 'package:school_management_system/Controller/teach_home.dart';

import '../../../Controller/TEACHER/home/home_controller.dart';
import '../../../Controller/student_library.dart';

class TeachHomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(TeachHomeController());
  }
}
