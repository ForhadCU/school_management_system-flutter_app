
import '../Utils/debouncer.dart';

class AppData {
  //make it singleTone class
  static final AppData _singleton = AppData._internal();
  factory AppData() {
    return _singleton;
  }
  AppData._internal();
  //code starts from here
  String token = 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJyYW1lZXNAYWN1dGVhbmdsZS5pbyIsInNjb3BlcyI6W3siYXV0aG9yaXR5IjoiUk9MRV9BRE1JTiJSwiaXNzIjoiaHR0cDovL2V6Ym90LmNvbSIsImlhdCI6MTcwMDEwNzgyOSwiZXhwIjoxNzMxNjQzODI5fQ.OodibBwm4CgzOBWqre2s70yHDjrizXaGbELUhRQoN1g';
  List<String> userPrivileges = [];
  Debouncer debouncer = Debouncer(milliseconds: 1500);

  //APPDATA GLOBAL DATA
/*     RxList<ChargeStationModel> chargeStationModelList = RxList();
  RxList<ChargePointModel> chargePointModelList = RxList(); */
}

AppData appData = AppData();