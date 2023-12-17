import 'package:get/get.dart';

import '../../../Controller/student_library.dart';

class PaymentsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PaymentsController());
  }
}