import 'package:get/get.dart';

import '../../../Controller/student_library.dart';

class NoticeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(StuNoticeController());
  }
}
