import 'package:get/get.dart';

import '../../Controller/PUBLIC/site_history_controller.dart';

class SiteHistoryBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(SiteHistoryController());
  }
}
