import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/constants/constants.dart';
import 'package:school_management_system/Utils/screen_size.dart';

class TestController extends GetxController {
  static TestController get to => Get.find();

  @override
  void onInit() {
    kLogger.w(MediaQuery.of(kGlobContext).size.width);
    kLogger.w(AppScreenSize.mGetLongestSide(kGlobContext, 100));
    super.onInit();
  }
}
