import 'package:get/get.dart';

import '../../Controller/PUBLIC/about_us_controller.dart';

class SiteHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AboutUsController());
  }
}
