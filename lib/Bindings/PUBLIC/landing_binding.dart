import 'package:get/get.dart';
import 'package:school_management_system/Controller/PUBLIC/landing_controller.dart';

class LandingBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(LandingController());
        Get.lazyPut(() => LandingController());

  }
}
