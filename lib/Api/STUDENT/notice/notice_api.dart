import '../../../Config/config.dart';
import '../../../Model/PUBLIC/notice/notice_api_model.dart';
import '../../../Model/response_model.dart';
import '../../../Utils/utils.dart';

class StuNoticeApi {
  // make this class singleton
  StuNoticeApi._internal();
  static final StuNoticeApi _singleton = StuNoticeApi._internal();
  factory StuNoticeApi() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<NoticeApiModel> mGetNoticeApiModeldata(
      Map<String, dynamic> payLoad) async {
    kLog(payLoad);
    ResponseModel res =
        await CallAPI.getPublicData(ApiEndpoint.allNotice, payLoad);
    kLogger.d(res.body);
    if (res.statusCode == 200) {
      print("Successfully read data");
      return NoticeApiModel.fromMap(res.body);
    } else {
      return NoticeApiModel();
    }
  }
}
