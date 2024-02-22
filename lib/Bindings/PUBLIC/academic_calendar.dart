import 'package:get/get.dart';

import '../../Controller/PUBLIC/academic_calendar_controller.dart';

class AcademicCalendarBinding extends Bindings {
  static AcademicCalendarBinding get to => Get.find();

  @override
  void dependencies() {
    // Get.put(AcademicCalendarController());
    Get.lazyPut(() => AcademicCalendarController());
  }
}
