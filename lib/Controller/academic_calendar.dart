import 'package:get/get.dart';

class AcademicCalendarController extends GetxController {
  static AcademicCalendarController get to => Get.find();
  Map<DateTime, List<dynamic>> events = {
    DateTime.now(): ['Event 1'],
    DateTime.now().add(Duration(days: 1)): ['Event 2'],
    DateTime.now().add(Duration(days: 3)): ['Event 3'],
  };
  var focusDay = DateTime.now().obs;
  Rx<DateTime?> selectedDay = Rx<DateTime?>(null);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void onDaySelected(DateTime selected, DateTime focused) {
    selectedDay.value = selected;
    focusDay.value = focused;
    
  }

  void onRangeSelected(DateTime start, DateTime end, DateTime focused) {
    selectedDay.value = null;
  }
}
