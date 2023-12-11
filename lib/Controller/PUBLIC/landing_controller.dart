import 'package:get/get.dart';
import 'package:school_management_system/Utils/custom_statusbar.dart';

class LandingController extends GetxController {
  static LandingController get to => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    CustomStatusBar.mDarkStatusBar();
  }
}
