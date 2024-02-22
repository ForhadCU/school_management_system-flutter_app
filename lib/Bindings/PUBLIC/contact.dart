import 'package:get/get.dart';

import '../../Controller/PUBLIC/contact_controller.dart';

class ContactBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(ContactController());
    Get.lazyPut(() => ContactController());
  }
}
