import 'package:get/get.dart';

import '../../../Controller/student_library.dart';

class StuNoticeBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(StuNoticeController());
    Get.lazyPut(() => StuNoticeController());
  }
}
