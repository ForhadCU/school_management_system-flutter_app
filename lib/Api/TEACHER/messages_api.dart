import 'package:school_management_system/Model/STUDENT/message/message_model.dart';

import '../../Config/config.dart';
import '../../Model/response_model.dart';
import '../../Utils/utils.dart';

class TeachMessageApis {
  // make this class singleton
  TeachMessageApis._internal();
  static final TeachMessageApis _singleton = TeachMessageApis._internal();
  factory TeachMessageApis() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<MessageModel> mGetMessageModel(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res =
        await CallAPI.getStudentData(ApiEndpoint.teachMessage, payLoad, token);
    // kLogger.d(res.body[MessageModel.getDataListJsonKey]);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch mGetMessageModel data");
      return MessageModel.fromMap(res.body[MessageModel.getDataListJsonKey]);
    } else {   hideLoading();
      showError("Server failure");
      kLog("mGetMessageModel status code is: ${res.statusCode}");
      return MessageModel();
      //return <MessageModel>[];
    }
  }
}
