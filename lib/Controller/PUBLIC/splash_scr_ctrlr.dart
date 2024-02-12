import 'package:get/get.dart';
import 'package:school_management_system/Routes/app_pages.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get to => Get.find();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    await Future.delayed(Duration(milliseconds: 2000));
    Get.offNamed(AppRoutes.launcherSlides);
  }
}
