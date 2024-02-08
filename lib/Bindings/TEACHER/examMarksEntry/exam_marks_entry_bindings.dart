import 'package:get/get.dart';
import 'package:school_management_system/Controller/TEACHER/examMarksEntry/exam_marks_entry_controller.dart';
import 'package:school_management_system/Controller/common/common_controller.dart';

class ExamMarksEntryBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ExamMarksEntryController());
    Get.put(CommonController());
  }
}
