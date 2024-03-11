import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Model/STUDENT/helpdesk/stu_helpdesk_model.dart';

import '../../../Model/response_model.dart';
import '../../../Utils/utils.dart';

class TeachHelpdeskApi {
  // make this class singleton
  TeachHelpdeskApi._internal();
  static final TeachHelpdeskApi _singleton = TeachHelpdeskApi._internal();
  factory TeachHelpdeskApi() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<List<HelpDeskModel>> mGeTeachHelpDeskModelList(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.getTeacherData(
        ApiEndpoint.employee_helpdesk_list, payLoad, token);
    kLogger.d(res.body);
    if (res.statusCode == 200) {
      print("Successfully read mGeTeachHelpDeskModelList data");
      // print(res.body);
      return res.body['help_desk_list']
          .map<HelpDeskModel>((e) => HelpDeskModel.fromMap(e))
          .toList();
    } else {
      hideLoading();
      showError("Internal server error");
      // return List<StuHelpDeskModel>();
      return <HelpDeskModel>[];
    }
  }
}
