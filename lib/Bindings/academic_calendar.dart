import 'package:get/get.dart';

import '../Controller/academic_calendar.dart';

class AcademicCalendarBinding extends Bindings {
  static AcademicCalendarBinding get to => Get.find();

  @override
  void dependencies() {
    Get.put(AcademicCalendarController());
  }
}
