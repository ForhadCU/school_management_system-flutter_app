import 'package:get/get.dart';
import 'package:school_management_system/Controller/base_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BaseController());
  }
}
