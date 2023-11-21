import 'package:get/get.dart';

import '../Controller/site_history.dart';

class SiteHistoryBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(SiteHistoryController());
  }
}
