import 'package:get/get.dart';
import 'package:school_management_system/Controller/TEACHER/helpdesk/helpdesk_controller.dart';

import '../../../Controller/student_library.dart';

class TeachHelpDeskBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(TeachHelpDeskController());
  }
}
