import 'package:get/get.dart';

import '../../../Controller/TEACHER/home/home_controller.dart';
import '../../../Controller/TEACHER/profile/profile_controller.dart';
import '../../../Controller/student_library.dart';

class TeachHomeBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(TeachHomeController());
    Get.lazyPut(() => TeachHomeController());
  }
}
