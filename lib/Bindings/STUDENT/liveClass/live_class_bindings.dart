import 'package:get/get.dart';

import '../../../Controller/student_library.dart';

class LiveClassBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(LiveClassController());
    Get.lazyPut(() => LiveClassController());
  }
}
