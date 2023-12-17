import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/custom_statusbar.dart';

class LauncherSlidesController extends GetxController {
  static LauncherSlidesController get to => Get.find();
  AnimationController? animationController;
  Animation<double>? _animation;
  late SharedPreferences sharedPrefarence;

  @override
  void onInit() {
    super.onInit();
    mInitialization();
    CustomStatusBar.mDarkStatusBar(true);
  }

  mCheckSessionStatus() async {
    sharedPrefarence = await SharedPreferences.getInstance();
    final currentUserToken = sharedPrefarence.getString(kToken);
    final currentSiteModel = sharedPrefarence.getString(kSiteListModel);

    if (currentSiteModel != null) {
      if (currentUserToken != null) {
        Get.offAllNamed(AppRoutes.dashboard);
      } else {
        Get.offAllNamed(AppRoutes.landing);
      }
    } else {
      Get.offAllNamed(AppRoutes.searchSchool);
    }
  }

  void mInitialization() async {}

/*     void mAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = Tween<double>(
      begin: 60,
      end: 110,
    ).animate(animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
        setState(() {});
      });
    animationController.forward();
  } */
}
