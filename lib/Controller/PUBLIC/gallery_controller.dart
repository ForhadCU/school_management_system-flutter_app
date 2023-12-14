import 'package:get/get.dart';

class GalleryController extends GetxController {
  static GalleryController get to => Get.find();

  var dropdownValue = Rxn<String>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _mInitiatevalue();
  }

  void _mInitiatevalue() {
    dropdownValue.value = "Date";
  }

  void mUpdateDropdownValue(String s) {
    dropdownValue.value = s;
  }
}
