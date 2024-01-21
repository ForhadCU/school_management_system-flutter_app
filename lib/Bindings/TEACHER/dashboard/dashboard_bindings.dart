import 'package:get/get.dart';
import 'package:school_management_system/Controller/TEACHER/dashboard/dashboard_controller.dart';


class TeachDashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(TeachDashboardController());
  }
}
