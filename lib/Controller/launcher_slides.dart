import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:get/get.dart';

import '../Utils/custom_statusbar.dart';

class LauncherSlidesController extends GetxController {
  static LauncherSlidesController get to => Get.find();
  AnimationController? animationController;
  Animation<double>? _animation;

  @override
  void onInit() {
    super.onInit();
    CustomStatusBar.mDarkStatusBar(true);
  }

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
