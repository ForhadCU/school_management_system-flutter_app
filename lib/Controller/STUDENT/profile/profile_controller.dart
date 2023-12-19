import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();

  /// variable declaration

  @override
  void onInit() {
    super.onInit();
    kLog("Profile Controller init");
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// code goes here
}
