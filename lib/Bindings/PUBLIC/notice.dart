import 'package:get/get.dart';

import '../../Controller/PUBLIC/notice_controller.dart';

class NoticeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(NoticeController());
    Get.lazyPut(() => NoticeController());
  }
}
