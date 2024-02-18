import 'package:get/get.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Config/config.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get to => Get.find();
  late SharedPreferences sharedPrefarence;

  @override
  void onInit() async {
    super.onInit();

    await Future.delayed(Duration(milliseconds: 2000));
    // Get.offNamed(AppRoutes.launcherSlides);
    await mCheckSessionStatus();
  }

  mCheckSessionStatus() async {
    sharedPrefarence = await SharedPreferences.getInstance();
    final currentUserToken = sharedPrefarence.getString(kToken);
    final currentSiteModel = sharedPrefarence.getString(kSiteListModel);
    final currentUserType = sharedPrefarence.getString(kUserType);
    // AppLocalDataFactory.mGetAcademicGroupModel();

    if (currentSiteModel != null) {
      if (currentUserToken != null) {
        if (currentUserType == student) {
          Get.offAllNamed(AppRoutes.dashboard);
        } else {
          Get.offAllNamed(AppRoutes.teachDashboard);
        }
      } else {
        Get.offAllNamed(AppRoutes.landing);
      }
    } else {
      // Get.offAllNamed(AppRoutes.searchSchool);
      Get.offAllNamed(AppRoutes.launcherSlides);
    }
  }
}
