import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Model/PUBLIC/academicCalendar/academic_grp_api_model.dart';
import 'package:school_management_system/Model/PUBLIC/academicCalendar/monthwise_event_cal_api_model.dart';

import '../../Model/response_model.dart';
import '../../Utils/utils.dart';

class AcademicCalendarApi {
  // make this class singleton
  AcademicCalendarApi._internal();
  static final AcademicCalendarApi _singleton = AcademicCalendarApi._internal();
  factory AcademicCalendarApi() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<List<AcademicGroupModel>> mGetAcademicGroupList(
      Map<String, dynamic> payLoad) async {
    ResponseModel res =
        await CallAPI.getPublicData(ApiEndpoint.academic_group_list, payLoad);
    // kLogger.d(res.body['result']);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      print("Successfully read data");
      return res.body['academic_group_list']
          .map<AcademicGroupModel>((e) => AcademicGroupModel.fromMap(e))
          .toList();
    } else {
      return <AcademicGroupModel>[];
    }
  }

  static Future<List<List<EventDateList>>> mGetEventDateList(
      Map<String, dynamic> payLoad) async {
    ResponseModel res = await CallAPI.getPublicData(
        ApiEndpoint.monthwise_calendar_list, payLoad);
    // kLogger.d(res.body['result']);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      print("Successfully read data");
      MonthWiseEventCalendarApiModel monthWiseEventCalendarApiModel =
          MonthWiseEventCalendarApiModel.fromMap(res.body);
      print(res.body);
      return monthWiseEventCalendarApiModel
          .monthWiseCalendarData!.eventDateList!;
    } else {
      print(res.body);
      return [<EventDateList>[]];
      //return <List<EventDateList>>[];
    }
  }
}
