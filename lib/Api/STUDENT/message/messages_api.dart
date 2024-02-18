import 'package:school_management_system/Model/STUDENT/message/message_model.dart';

import '../../../Config/config.dart';
import '../../../Model/response_model.dart';
import '../../../Utils/utils.dart';

class StuMessageApis {
  // make this class singleton
  StuMessageApis._internal();
  static final StuMessageApis _singleton = StuMessageApis._internal();
  factory StuMessageApis() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<MessageModel> mGetMessageModel(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res =
        await CallAPI.getStudentData(ApiEndpoint.stuMessage, payLoad, token);
    kLogger.d(res.body);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch mGetMessageModel data");
      return MessageModel.fromMap(res.body[MessageModel.getDataListJsonKey]);
    } else {
      kLog("mGetMessageModel status code is: ${res.statusCode}");
      hideLoading();
      showError("Server failure");
      return MessageModel();
      //return <MessageModel>[];
    }
  }
}
