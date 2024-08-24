import 'package:school_management_system/Model/TEACHER/leave/leave_balance_list_model.dart';
import 'package:school_management_system/Model/TEACHER/leave/leave_history_list_model.dart';
import 'package:school_management_system/Model/TEACHER/leave/leave_type_and_category_model.dart';

import '../../Config/config.dart';
import '../../Model/response_model.dart';
import '../../Utils/utils.dart';

class LeaveApis {
  // make this class singleton
  LeaveApis._internal();
  static final LeaveApis _singleton = LeaveApis._internal();
  factory LeaveApis() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<bool> mSubmitLeaveApplication(
      {
      // required Map<String, dynamic> bodyData,
      required String token,
      required Map<String, dynamic> payload}) async {
    kLog(payload);
    ResponseModel res = await CallAPI.postTeacherData(
      endPoint: ApiEndpoint.leave_aplication_submit,
      bodyData: {},
      token: token,
      payload: payload,
    );
    kLogger.d(res.body);
    if (res.statusCode == 200) {
      kLog("Successfully submit mSubmitLeaveApplication data");
      return true;
    } else {
      hideLoading();
      if (res.statusCode == 411) {
        showError("Sorry! you requested for exsessivedays!");
      } else {
        showError("Failed");
      }
      kLog("mSubmitLeaveApplication status code is: ${res.statusCode}");
      return false;
      //return <ClassName>[];
    }
  }

  static Future<LeaveTypeAndCategoryListModel> mGetLeaveTypeAndCategory(
      {required Map<String, dynamic> payLoad, required String token}) async {
    kLog(payLoad);
    ResponseModel res = await CallAPI.getTeacherData(
        ApiEndpoint.leave_type_and_category_list, payLoad, token);
    kLogger.d(res.body);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch mGetLeaveTypeAndCategory data");
      return LeaveTypeAndCategoryListModel.fromMap(res.body);
    } else {
      hideLoading();
      showError("Failed");
      kLog("mGetLeaveTypeAndCategory status code is: ${res.statusCode}");
      return LeaveTypeAndCategoryListModel();
      //return <ClassName>[];
    }
  }

  static Future<LeaveHistoryListModel> mGetLeaveHistory(
      {required Map<String, dynamic> payLoad, required String token}) async {
    kLog(payLoad);
    ResponseModel res = await CallAPI.getTeacherData(
        ApiEndpoint.leave_history_list, payLoad, token);
    kLogger.d(res.body);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch mGetLeaveHistory data");
      return LeaveHistoryListModel.fromMap(res.body);
    } else {
      hideLoading();
      showError("Failed");
      kLog("mGetLeaveHistory status code is: ${res.statusCode}");
      return LeaveHistoryListModel();
      //return <ClassName>[];
    }
  }

  static Future<LeaveBalanceListModel> mGetLeaveBalance(
      {required Map<String, dynamic> payLoad, required String token}) async {
    kLog(payLoad);
    ResponseModel res = await CallAPI.getTeacherData(
        ApiEndpoint.leave_balance_list, payLoad, token);
    kLogger.d(res.body);
    if (res.statusCode == 200 && res.body['mode'] == "success") {
      kLog("Successfully fetch mGetLeaveBalance data");
      return LeaveBalanceListModel.fromMap(res.body);
    } else {
      hideLoading();
      showError("Failed");
      kLog("mGetLeaveBalance status code is: ${res.statusCode}");
      return LeaveBalanceListModel();
      //return <ClassName>[];
    }
  }
}
