import 'package:get/get.dart';

import '../../../Controller/student_library.dart';

class WebsiteBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(WebsiteController());
  }
}