import 'package:get/get.dart';
import 'package:school_management_system/Controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(LoginController());
        Get.lazyPut(() => LoginController());

  }
}
