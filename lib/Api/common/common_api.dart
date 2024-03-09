import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Model/TEACHER/dept_classlist_model.dart';
import 'package:school_management_system/Model/TEACHER/distribution_list_model.dart';
import 'package:school_management_system/Model/TEACHER/exam_subject_list_model.dart';
import 'package:school_management_system/Model/TEACHER/examination_list_model.dart';
import 'package:school_management_system/Model/TEACHER/version_year_shift_model.dart';

import '../../Model/TEACHER/class_group_model.dart';
import '../../Model/TEACHER/examAttendance/exam_attendance_list_model.dart';
import '../../Model/TEACHER/section_session_model.dart';
import '../../Model/response_model.dart';
import '../../Utils/utils.dart';

class CommonApis {
  // make this class singleton
  CommonApis._internal();
  static final CommonApis _singleton = CommonApis._internal();
  factory CommonApis() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<VersionYearShiftModel> mGetVersionYearShiftModel(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.getTeacherData(
        isShowLoading: false,
        ApiEndpoint.academic_version_year_shift_list,
        payLoad,
        token);
    // kLogger.d(res.body);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch mGetVersionYearShiftModel data");
      return VersionYearShiftModel.fromMap(res.body);
    } else {
      hideLoading();
      showError("Server failure");
      kLog("mGetVersionYearShiftModel status code is: ${res.statusCode}");
      return VersionYearShiftModel();
      //return <ClassName>[];
    }
  }

  static Future<DeptClasslistModel> mGetDeptClasslistModel(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.getTeacherData(
        ApiEndpoint.version_year_shift_based_department_class, payLoad, token,
        isShowLoading: false);
    // kLogger.d(res.body);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch mGetDeptClasslistModel data");
      return DeptClasslistModel.fromMap(res.body);
    } else {
      hideLoading();
      showError("Server failure");
      kLog("mGetDeptClasslistModel status code is: ${res.statusCode}");
      return DeptClasslistModel();
      //return <ClassName>[];
    }
  }

  static Future<ClassGroupModel> mGetClassGroupModel(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.getTeacherData(
        isShowLoading: false,
        ApiEndpoint
            .version_year_shift_based_section_or_class_group_session_by_class,
        payLoad,
        token);
    // kLogger.d(res.body);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch mGetClassGroupModel data");
      return ClassGroupModel.fromMap(res.body);
    } else {
      hideLoading();
      showError("Server failure");
      kLog("mGetClassGroupModel status code is: ${res.statusCode}");
      return ClassGroupModel();
      //return <ClassName>[];
    }
  }

  static Future<SectionSessionModel> mGetSectionSessionModel(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.getTeacherData(
        isShowLoading: false,
        ApiEndpoint.site_class_base_section,
        payLoad,
        token);
    // kLogger.d(res.body);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch mGetSectionSessionModel data");
      return SectionSessionModel.fromMap(res.body);
    } else {
      kLog("mGetSectionSessionModel status code is: ${res.statusCode}");
      return SectionSessionModel();
      //return <ClassName>[];
    }
  }

  static Future<ExaminationListModel> mGetExaminationListModel(
      Map<String, dynamic> payLoad, String token) async {
    kLog(payLoad);
    ResponseModel res = await CallAPI.getTeacherData(
        isShowLoading: false,
        ApiEndpoint.department_class_base_examination_list_by_employee,
        payLoad,
        token);
    // kLogger.d(res.body);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch mGetExaminationListModel data");
      return ExaminationListModel.fromMap(res.body);
      // return ExaminationListModel();
    } else {
      kLog("mGetExaminationListModel status code is: ${res.statusCode}");
      return ExaminationListModel();
      //return <ClassName>[];
    }
  }

  static Future<ExamSubjectListModel> mGetExamSubjectListModel(
      Map<String, dynamic> payLoad, String token) async {
    kLog(payLoad);
    ResponseModel res = await CallAPI.getTeacherData(
        isShowLoading: false,
        ApiEndpoint.examination_base_subject_list_by_employee,
        payLoad,
        token);
    kLogger.d(res.body);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch mGetExamSubjectListModel data");
      return ExamSubjectListModel.fromMap(res.body);
      // return ExamSubjectListModel();
    } else {
      kLog("mGetExamSubjectListModel status code is: ${res.statusCode}");
      return ExamSubjectListModel();
      //return <ClassName>[];
    }
  }

  static Future<ExamDistributionListModel> mGetExamDistributionListModel(
      Map<String, dynamic> payLoad, String token) async {
    ResponseModel res = await CallAPI.getTeacherData(
        isShowLoading: false,
        ApiEndpoint.attendance_paper_list_by_employee,
        payLoad,
        token);
    // kLogger.d(res.body);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch mGetExamDistributionListModel data");
      return ExamDistributionListModel.fromMap(res.body);
      // return ExamDistributionListModel();
    } else {
      kLog("mGetExamDistributionListModel status code is: ${res.statusCode}");
      return ExamDistributionListModel();
      //return <ClassName>[];
    }
  }
}
