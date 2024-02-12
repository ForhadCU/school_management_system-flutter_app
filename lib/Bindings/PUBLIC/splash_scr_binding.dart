import 'package:get/get.dart';
import 'package:school_management_system/Controller/PUBLIC/splash_scr_ctrlr.dart';

class SplashScreenBindig extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
  }
}
