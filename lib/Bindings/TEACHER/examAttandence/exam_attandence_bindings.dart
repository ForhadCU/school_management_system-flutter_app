import 'package:get/get.dart';
import 'package:school_management_system/Controller/TEACHER/examAttandence/exam_attandence_controller.dart';



class ExamAttendanceBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ExamAttendanceController());
  }
}
