import '../Utils/debouncer.dart';

class AppData {
  //make it singleTone class
  static final AppData _singleton = AppData._internal();
  factory AppData() {
    return _singleton;
  }
  AppData._internal();
  //code starts from here
  // String token = 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJyYW1lZXNAYWN1dGVhbmdsZS5pbyIsInNjb3BlcyI6W3siYXV0aG9yaXR5IjoiUk9MRV9BRE1JTiJSwiaXNzIjoiaHR0cDovL2V6Ym90LmNvbSIsImlhdCI6MTcwMDEwNzgyOSwiZXhwIjoxNzMxNjQzODI5fQ.OodibBwm4CgzOBWqre2s70yHDjrizXaGbELUhRQoN1g';
  String token = '';
  static const String api_access_key = "api_app_access_254R68495324Y1W123";
  static const String eduWorldTheworldHostname =
      "https://eduworld.theworld.com.bd";
  static const String eduWorldErpHostname = "https://eduworld.eduworlderp.com";
  List<String> userPrivileges = [];
  static Debouncer debouncer = Debouncer(milliseconds: 1500);
  static const String dummyUserid = "2315400002";
  static const String dummyUserPass = "123456";

  //APPDATA GLOBAL DATA
/*     RxList<ChargeStationModel> chargeStationModelList = RxList();
  RxList<ChargePointModel> chargePointModelList = RxList(); */
}

AppData appData = AppData();


class PageOrientation {
  // make this class singleton 
    PageOrientation._internal();
    static final PageOrientation _singleton = PageOrientation._internal();
    factory PageOrientation() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  static const String portrait = "portrate";
  static const String landscape = "landscape";
}
