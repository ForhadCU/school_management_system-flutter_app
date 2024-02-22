import 'package:get/get.dart';
import 'package:school_management_system/Controller/TEACHER/profile/profile_controller.dart';

class TeachProfileBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(TeachProfileController());
    Get.lazyPut(() => TeachProfileController());
  }
}
