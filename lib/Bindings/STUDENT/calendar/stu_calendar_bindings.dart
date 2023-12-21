import 'package:get/get.dart';

import '../../../Controller/student_library.dart';

class StuCalendarBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(StuCalendarController());
  }
}
