import 'package:get/get.dart';
import 'package:school_management_system/Controller/TEACHER/notice/notice_controller.dart';

import '../../../Controller/student_library.dart';

class TeachNoticeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(TeachNoticeController());
  }
}
