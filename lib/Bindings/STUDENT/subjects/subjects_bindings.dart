import 'package:get/get.dart';

import '../../../Controller/student_library.dart';

class SubjectsBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(StuSubjectsController());
    Get.lazyPut(() => StuSubjectsController());
  }
}
