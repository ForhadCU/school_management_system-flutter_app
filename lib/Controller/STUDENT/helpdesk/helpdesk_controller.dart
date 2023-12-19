import 'package:get/get.dart';
import 'package:school_management_system/Routes/app_pages.dart';

class HelpDeskController extends GetxController {
  static HelpDeskController get to => Get.find();

  /// variable declaration

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// code goes here
  mTappedOnHelpDeskItem() {
    Get.toNamed(AppRoutes.helpdeskDetails);
  }
}
