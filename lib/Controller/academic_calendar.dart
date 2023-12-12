import 'package:get/get.dart';

class AcademicCalendarController extends GetxController {
  static AcademicCalendarController get to => Get.find();

  var focusDay = DateTime.now().obs;
  var lastDay = DateTime.now().add(
    const Duration(
      days: 5,
    ),
  );
  var firstDay = DateTime.now().subtract(Duration(days: 300));
  var initialSelectedDateList = [
    DateTime.now().add(Duration(days: 1)),
    DateTime.now().subtract(Duration(days: 30))
  ];
  // Rx<DateTime?> selectedDay = Rx<DateTime?>(null);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
