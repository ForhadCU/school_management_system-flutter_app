import 'package:get/get.dart';

import '../../../Controller/student_library.dart';

class HelpDeskBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HelpDeskController());
  }
}