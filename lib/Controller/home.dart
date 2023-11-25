import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  RxString monthName = "Dec".obs;
  RxInt dayNumber = 23.obs;
}
