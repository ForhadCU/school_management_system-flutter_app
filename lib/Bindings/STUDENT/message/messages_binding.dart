import 'package:get/get.dart';
import 'package:school_management_system/Controller/STUDENT/message/messages_ctrlr.dart';

class StuMessageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(StuMessageController());
  }
}
