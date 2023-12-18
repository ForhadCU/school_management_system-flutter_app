import 'package:get/get.dart';

import '../../../Config/config.dart';

class StuHomeController extends GetxController {
  static StuHomeController get to => Get.find();

  /// variable declaration
  var drawerItems = [
    "My exam",
    "My result",
    "My Payment",
    "My routine",
    "My class",
    "Live Class",
    "Calendar",
    "Attendance",
    "My Quiz",
    "My subject",
    "Website",
    "Log out",
  ];

  @override
  void onInit() {
    super.onInit();
    kLog("Called Home init");
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// code goes here
}
