import 'package:get/get.dart';

import '../../../Controller/TEACHER/message/messages_ctrlr.dart';

class TeachMessageBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(TeachMessageController());
    Get.lazyPut(() => TeachMessageController());
  }
}
