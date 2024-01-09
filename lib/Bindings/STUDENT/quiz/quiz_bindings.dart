import 'package:get/get.dart';

import '../../../Controller/student_library.dart';

class QuizBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(StuQuizController());
  }
}
