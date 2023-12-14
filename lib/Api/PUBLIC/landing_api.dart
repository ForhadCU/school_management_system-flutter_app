import 'package:get/get.dart';
import 'package:school_management_system/Utils/custom_statusbar.dart';

class LandingApi extends GetxController {
  // make this class singleton 
    LandingApi._internal();
    static final LandingApi _singleton = LandingApi._internal();
    factory LandingApi() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
}
