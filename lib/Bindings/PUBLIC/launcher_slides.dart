import 'package:get/get.dart';
import 'package:school_management_system/Controller/launcher_slides.dart';

class LaucherSlidesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LauncherSlidesController());
  }
}
