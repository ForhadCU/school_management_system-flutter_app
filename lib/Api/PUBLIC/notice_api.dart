import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Model/PUBLIC/notice/notice_api_model.dart';

import '../../Model/response_model.dart';
import '../../Utils/utils.dart';

class NoticeApi {
  // make this class singleton
  NoticeApi._internal();
  static final NoticeApi _singleton = NoticeApi._internal();
  factory NoticeApi() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<NoticeApiModel> mGetNoticeApiModeldata(
      Map<String, dynamic> payLoad) async {
    ResponseModel res =
        await CallAPI.getPublicData(ApiEndpoint.allNotice, payLoad);
    // kLogger.d(res.body['result']);
    if (res.statusCode == 200) {
      print("Successfully read data");
      return NoticeApiModel.fromMap(res.body);
    } else {
      return NoticeApiModel();
    }
  }
}
