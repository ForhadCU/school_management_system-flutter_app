import 'package:get/get.dart';
import 'package:school_management_system/Controller/TEACHER/test/test_ctrlr.dart';

class TeachTestBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeachTestCtrlr());
  }
}
