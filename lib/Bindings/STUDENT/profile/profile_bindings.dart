import 'package:get/get.dart';

import '../../../Controller/student_library.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(StuProfileController());
  }
}
