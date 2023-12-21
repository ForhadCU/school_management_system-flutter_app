import 'package:school_management_system/Utils/utils.dart';

import '../../../Config/config.dart';
import '../../../Model/STUDENT/calendar/stu_acdemic_grp_model.dart';
import '../../../Model/STUDENT/calendar/stu_calendar_model.dart';
import '../../../Model/response_model.dart';

class StuCalendarApis {
  // make this class singleton
  StuCalendarApis._internal();
  static final StuCalendarApis _singleton = StuCalendarApis._internal();
  factory StuCalendarApis() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<List<StuAcademicGroupModel>> mGetAcademicGroupList(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.getStudentData(
        ApiEndpoint.academic_group_list, payLoad, token);
    // kLogger.d(res.body['result']);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      print("Successfully read data");
      return res.body['academic_group_list']
          .map<StuAcademicGroupModel>((e) => StuAcademicGroupModel.fromMap(e))
          .toList();
    } else {
      return <StuAcademicGroupModel>[];
    }
  }

  static Future<List<List<StuEventDateList>>> mGetEventDateList(
      /* Map<String, dynamic> payLoad, */ String token) async {
    ResponseModel res = await CallAPI.getStudentData(
        ApiEndpoint.stuAcademicCalendar, {}, token);
    // kLogger.d(res.body['result']);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      print("Successfully read data");
      StuMonthWiseEventCalendarApiModel monthWiseEventCalendarApiModel =
          StuMonthWiseEventCalendarApiModel.fromMap(res.body);
      return monthWiseEventCalendarApiModel
          .monthWiseCalendarData!.eventDateList!;
    } else {
      print(res.body);
      return [<StuEventDateList>[]];
      //return <List<EventDateList>>[];
    }
  }
}
