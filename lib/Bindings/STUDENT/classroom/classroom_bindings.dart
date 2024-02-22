import 'package:get/get.dart';

import '../../../Controller/student_library.dart';

class ClassroomBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(ClassroomController());
    Get.lazyPut(() => ClassroomController());
  }
}
