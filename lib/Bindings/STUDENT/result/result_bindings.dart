import 'package:get/get.dart';

import '../../../Controller/student_library.dart';

class ResultBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ResultController());
  }
}