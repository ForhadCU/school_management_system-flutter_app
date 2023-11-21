import 'package:get/get.dart';
import 'package:school_management_system/Controller/home.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
