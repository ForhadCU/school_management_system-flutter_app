import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Model/STUDENT/subjects/subject_model.dart';

import '../../../Model/response_model.dart';
import '../../../Utils/utils.dart';

class StuSubjectsApis {
  // make this class singleton
  StuSubjectsApis._internal();
  static final StuSubjectsApis _singleton = StuSubjectsApis._internal();
  factory StuSubjectsApis() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<List<StuSubjectModel>> mGetSubjectList(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.getStudentData(
        ApiEndpoint.stuSubjectList, payLoad, token);
    if (res.statusCode == 200) {
      kLog("Successfully fetch mGetSubjectList data");
      // kLogger.d(res.body[StuSubjectModel.getDataListJsonKey]);

      return res.body[StuSubjectModel.getDataListJsonKey]
          .map<StuSubjectModel>((e) => StuSubjectModel.fromMap(e))
          .toList();
    } else {
      hideLoading();
      showError("Internal server error");
      kLog("Failed! mGetSubjectList status code is: ${res.statusCode}");
      // return List<StuSubjectModel>();
      return <StuSubjectModel>[];
    }
  }
}
