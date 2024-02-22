import 'package:get/get.dart';

import '../../../Controller/student_library.dart';

class ExamBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(StuExamController());
    Get.lazyPut(() => StuExamController());
  }
}
