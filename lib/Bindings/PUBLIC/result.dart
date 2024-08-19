import 'package:get/get.dart';
import 'package:school_management_system/Controller/PUBLIC/result_controller.dart';

import '../../Controller/common/common_controller.dart';

class PublicResultBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommonController());

    Get.lazyPut(() => PublicResultController());
  }
}
