import 'package:get/get.dart';

class NoticeController extends GetxController {
  static NoticeController get to => Get.find();

  var dropdownValue = Rxn<String>();
  var noticeTitle = "Notice Tile".obs;
  var noticeDate = "July 24, 2023".obs;
  var noticeTag = "This is notice tag".obs;
  var noticeBody = "This is notice Body".obs;


  void mUpdateDropdownValue(String s) {
    dropdownValue.value = s;
  }
}
