import 'package:school_management_system/Model/PUBLIC/result/academic_class_group_res_model.dart';
import 'package:school_management_system/Model/PUBLIC/result/academic_class_res_model.dart';
import 'package:school_management_system/Model/PUBLIC/result/academic_group_res_model.dart';
import 'package:school_management_system/Model/PUBLIC/result/academic_section_res_model.dart';

import '../../Config/config.dart';
import '../../Model/PUBLIC/result/academic_year_res_model.dart';
import '../../Model/PUBLIC/result/exam_result_res_model.dart';
import '../../Model/response_model.dart';
import '../../Utils/utils.dart';

class PublicResultApis {
  // make this class singleton
  PublicResultApis._internal();
  static final PublicResultApis _singleton = PublicResultApis._internal();
  factory PublicResultApis() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<PubAcademicGroupResponseModel>
      mGetPubAcademicGroupResponseModel(Map<String, dynamic> payLoad) async {
    kLog("Payload: ${payLoad}");
    ResponseModel res = await CallAPI.getPublicData(
      hasLoading: true,
      ApiEndpoint.academicGroupList,
      payLoad,
    );
    // kLogger.d(res.body);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch mGetPubAcademicGroupResponseModel data");
      return PubAcademicGroupResponseModel.fromMap(res.body);
    } else {
      hideLoading();
      showError("No Academic Group Found!");
      kLog(
          "mGetPubAcademicGroupResponseModel status code is: ${res.statusCode}");
      return PubAcademicGroupResponseModel();
      //return <ClassName>[];
    }
  }

  static Future<PubAcademicVersionYearResponseModel> mGetVersionYearShiftModel(
      Map<String, dynamic> payLoad) async {
    kLog("Payload: ${payLoad}");
    ResponseModel res = await CallAPI.getPublicData(
      hasLoading: false,
      ApiEndpoint.academicgroupWiseVersionYearShift,
      payLoad,
    );
    // kLogger.d(res.body);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch PubAcademicVersionYearResponseModel data");
      return PubAcademicVersionYearResponseModel.fromMap(res.body);
    } else {
      hideLoading();
      showError("No Year Found");
      kLog(
          "PubAcademicVersionYearResponseModel status code is: ${res.statusCode}");
      return PubAcademicVersionYearResponseModel();
      //return <ClassName>[];
    }
  }

  static Future<PubAcademicClassResponseModel> mGetDeptClasslistModel(
      Map<String, dynamic> payLoad) async {
    kLog("Payload: ${payLoad}");
    ResponseModel res = await CallAPI.getPublicData(
      hasLoading: false,
      ApiEndpoint.academic_year_version_shift_based_department_class,
      payLoad,
    );
    // kLogger.d(res.body);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch mGetDeptClasslistModel data");
      return PubAcademicClassResponseModel.fromMap(res.body);
    } else {
      hideLoading();
      showError("No Class Found!");
      kLog("mGetDeptClasslistModel status code is: ${res.statusCode}");
      return PubAcademicClassResponseModel();
      //return <ClassName>[];
    }
  }

  static Future<PubAcademicClassGroupResModel> mGetClassGroupResModel(
      Map<String, dynamic> payLoad) async {
    kLog("Payload: ${payLoad}");
    ResponseModel res = await CallAPI.getPublicData(
      hasLoading: false,
      ApiEndpoint.academic_year_shift_class_based_class_groups_and_exam_list,
      payLoad,
    );
    // kLogger.d(res.body);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch mGetClassGroupResModel data");
      return PubAcademicClassGroupResModel.fromMap(res.body);
    } else {
      hideLoading();
      showError("No Class Group Found!");
      kLog("mGetClassGroupResModel status code is: ${res.statusCode}");
      return PubAcademicClassGroupResModel();
      //return <ClassName>[];
    }
  }

  static Future<PubAcademicSectionResModel> mGetSectionResModel(
      Map<String, dynamic> payLoad) async {
    kLog("Payload: ${payLoad}");
    ResponseModel res = await CallAPI.getPublicData(
      hasLoading: false,
      ApiEndpoint.academic_year_shift_class_or_class_group_based_section,
      payLoad,
    );
    // kLogger.d(res.body);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch mGetSectionResModel data");
      return PubAcademicSectionResModel.fromMap(res.body);
    } else {
      hideLoading();
      showError("No Section Found!");
      kLog("mGetSectionResModel status code is: ${res.statusCode}");
      return PubAcademicSectionResModel();
      //return <ClassName>[];
    }
  }
  static Future<PubExamResultResModel> mGetPubExamResultResModel(
      Map<String, dynamic> payLoad) async {
    kLog("Payload: ${payLoad}");
    ResponseModel res = await CallAPI.getPublicData(
      hasLoading: true,
      ApiEndpoint.academic_exam_result,
      payLoad,
    );
    kLogger.d(res.body);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch mGetPubExamResultResModel data");
      return PubExamResultResModel.fromMap(res.body);
    } else {
      hideLoading();
      showError("No Result Found!");
      kLog("mGetPubExamResultResModel status code is: ${res.statusCode}");
      return PubExamResultResModel();
      //return <ClassName>[];
    }
  }
}
