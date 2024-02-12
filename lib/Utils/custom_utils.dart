import 'dart:convert';
import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../Config/config.dart';
import '../Singletones/app_data.dart';

extension TitleCase on String {
  String toTitleCase() {
    if (this == '') {
      return '';
    }

    final List<String> words = this.trim().split(' ');
    final List<String> capitalizedWords = words
        .map((word) => '${word[0].toUpperCase()}${word.substring(1)}')
        .toList();

    return capitalizedWords.join(' ');
  }
}

class Utils {
  //make it singleTone class
  static final Utils _singleton = Utils._internal();
  factory Utils() {
    return _singleton;
  }
  Utils._internal();

  Future<Map<String, dynamic>> loadJsonFromAsset(String path) async {
    String jsonString = await rootBundle.loadString(path);
    return json.decode(jsonString);
  }

// List<dynamic> calculateAvailabiliy(
//     List<EvPortModel> evPorts, bool isConnected) {
//   int available = 0,
//       busy = 0,
//       unAvailable = 0,
//       faulty = 0,
//       total = evPorts.length;
//   String trailing = '';
//   evPorts.forEach((element) {
//     kLog(element.ocppStatus);
//     if (element.ocppStatus == kAvailable || element.ocppStatus.isEmpty)
//       available++;
//     else if (element.ocppStatus == 'Charging')
//       busy++;
//     else if (element.ocppStatus == kFaulted)
//       faulty++;
//     else
//       unAvailable++;
//   });
//   if (available > 0)
//     trailing = '$kAvailable $available/$total';
//   else if (busy > 0)
//     trailing = kBusy;
//   else if (faulty > 0)
//     trailing = kFaulted;
//   else
//     trailing = kUnavailable;

//   //if charger is disconnected then show unavailable
//   if (!isConnected) {
//     trailing = kUnavailable;
//     available = 0;
//   }
//   return [trailing, available];
// }

  static String mMakeUserImageUrl(
      {required String imageLoc, required String alisName}) {
    return "${alisName}.${AppData.hostNameTheWorld}${imageLoc}";
  }

  int mCalculateDaysFromSecs({required int secs}) {
    return int.parse((secs / (3600 * 24)).floor().toString());
  }

  int mCalculateHoursFromSecs({required int secs}) {
    return int.parse(((secs % (3600 * 24)) / 3600).floor().toString());
  }

  int mCalculateMinsFromSecs({required int secs}) {
    return int.parse((((secs % (3600 * 24)) % 3600) / 60).floor().toString());
  }

  int mCalculateSecsFromSecs({required int secs}) {
    return int.parse((((secs % (3600 * 24)) % 3600) % 60).toString());
  }

  String getTimeFromTimeStamp(String timestamp, String format) {
    if (timestamp.isEmpty) return '00:00 AM';
    DateTime dateTime = DateTime.parse(timestamp);
    String formattedString = DateFormat(format).format(dateTime);
    // print(formattedString);
    return formattedString;
  }

  static Color mParseColorFromHexCode({required String hexCode}) {
    return Color(int.parse(hexCode.substring(1), radix: 16) + 0xFF000000);
  }

  String convertToPmFormat(String time) {
    if (time.isEmpty) return '00:00 AM';
    DateTime dateTime = DateTime.parse('2000-01-01 $time');
    String formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  }

  bool isTimeInRange(String startTime, String endTime) {
    if (startTime.isEmpty || endTime.isEmpty) return false;
    DateTime now = DateTime.now();
    DateFormat dateFormat = DateFormat('HH:mm');

    DateTime start = dateFormat.parse(startTime);
    DateTime end = dateFormat.parse(endTime);

    if (start.isAfter(end)) {
      // Handle case where start time is after end time (e.g., spanning midnight)
      end = end.add(Duration(days: 1));
    }

    if (now.isAfter(start) && now.isBefore(end)) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> getDownloadFolderpath() async {
    var directory;
    String path = '';
    if (Platform.isAndroid) {
      // directory = await getExternalStorageDirectory();
      kLog((await getExternalStorageDirectory()).toString());
      directory = Directory('/storage/emulated/0');
    } else if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    }
    path = '${directory.path}/Download';
    return path;
  }

  List<int> getTimeDifference(
      {required String startTime, required String endtime}) {
    if (startTime.isEmpty || endtime.isEmpty) return [0, 0];
    DateTime apiTime = DateTime.parse(startTime);

// Get the current time
    DateTime now = DateTime.now();
    if (endtime.isNotEmpty) now = DateTime.parse(endtime);

// Calculate the time difference in milliseconds
    int difference = now.difference(apiTime).inMilliseconds;

// Calculate the hours and minutes difference
    int hours = (difference / (1000 * 60 * 60)).floor();
    int minutes = ((difference / (1000 * 60)) % 60).floor();
    return [hours, minutes];
  }

  String extractPhoneNumber(String phoneNumber) {
    String result = phoneNumber.replaceAll(new RegExp(r'[^0-9]'), '');
    return "+$result";
  }

// Future<bool> getStoragePermission() async {
//   DeviceInfoPlugin plugin = DeviceInfoPlugin();
//   AndroidDeviceInfo android = await plugin.androidInfo;
//   if (android.version.sdkInt < 33) {
//     if (await Permission.storage.request().isGranted) {
//       return true;
//     } else if (await Permission.storage.request().isPermanentlyDenied) {
//       await openAppSettings();
//       return false;
//     } else if (await Permission.audio.request().isDenied) {
//       return false;
//     }
//   } else {
//     if (await Permission.photos.request().isGranted) {
//       return true;
//     } else if (await Permission.photos.request().isPermanentlyDenied) {
//       await openAppSettings();
//       return false;
//     } else if (await Permission.photos.request().isDenied) {
//       return false;
//     }
//   }
//   return false;
// }

  checkUserPrivilege(String section) {
    String result = '';
    section = section.trim();
    for (var element in appData.userPrivileges) {
      if (element.split('=>').first.replaceAll(' ', '_').toLowerCase().trim() ==
          section) {
        if (element.contains('view')) {
          result += 'view';
        } else if (element.contains('modify')) {
          result += 'modify';
        }
      }
    }
  }

  List<List<String>> getListFromExcelSheet(Uint8List bytes) {
    // var file = filePath;
    // Read the Excel file
    // var bytes = File(file).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);

    // Assuming the sheet is named 'Sheet1'
    var sheet = excel['Sheet1'];

    // Store the values in a variable (List<List<String>>)
    List<List<String>> values = [];

    // Iterate through rows and columns
    for (var row in sheet.rows) {
      List<String> rowValues = [];
      for (var cell in row) {
        if (cell != null) {
          rowValues.add(cell.value.toString());
        }
      }
      values.add(rowValues);
    }

    // Print the values or use them as needed
    for (var row in values) {
      print(row);
    }

    return values;
  }
}
