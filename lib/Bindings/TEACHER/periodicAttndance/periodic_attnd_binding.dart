import 'package:get/get.dart';
import 'package:school_management_system/Controller/TEACHER/periodicAttnd/periodic_attnd_ctrlr.dart';

class TeachPeriodicAttendanceBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(TeachPeriodicAttendanceController());
  }
}
