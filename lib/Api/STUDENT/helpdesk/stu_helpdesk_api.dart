import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Model/STUDENT/helpdesk/stu_helpdesk_model.dart';

import '../../../Model/response_model.dart';
import '../../../Utils/utils.dart';

class HelpdeskApi {
  // make this class singleton
  HelpdeskApi._internal();
  static final HelpdeskApi _singleton = HelpdeskApi._internal();
  factory HelpdeskApi() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<List<HelpDeskModel>> mGetStuHelpDeskModelList(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res =
        await CallAPI.getStudentData(ApiEndpoint.stuHelpDesk, payLoad, token);
    // kLogger.d(res.body['result']);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      print("Successfully read data");
      // print(res.body);
      return res.body['help_desk_list']
          .map<HelpDeskModel>((e) => HelpDeskModel.fromMap(e))
          .toList();
    } else {
      // return List<StuHelpDeskModel>();
      return <HelpDeskModel>[];
    }
  }
}
