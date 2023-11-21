import 'package:get/get.dart';

import '../Controller/contact.dart';

class ContactBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(ContactController());
  }
}