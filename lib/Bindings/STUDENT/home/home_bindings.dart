import 'package:get/get.dart';

import '../../../Controller/student_library.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(StuHomeController());
    Get.lazyPut(() => StuHomeController());
  }
}
