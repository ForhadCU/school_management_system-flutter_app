import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Config/config.dart';

class BaseController extends GetxController {
  static BaseController get to => Get.find();

  @override
  void onInit() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: AppColor.white,
    ));
    super.onInit();
  }
}
