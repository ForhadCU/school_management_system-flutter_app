import 'package:get/get.dart';
import 'package:school_management_system/Controller/notice.dart';

class NoticeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NoticeController());
  }
}
