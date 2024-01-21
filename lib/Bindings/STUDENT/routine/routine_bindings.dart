import 'package:get/get.dart';

import '../../../Controller/student_library.dart';

class RoutineBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(StuRoutineController());
  }
}
