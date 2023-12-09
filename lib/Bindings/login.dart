import 'package:get/get.dart';
import 'package:school_management_system/Controller/login.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
