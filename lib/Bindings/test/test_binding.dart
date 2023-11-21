import 'package:get/get.dart';
import 'package:school_management_system/Controller/test/test_controller.dart';

class TestBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TestController());
  }
}
