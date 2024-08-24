import 'dart:convert';

class LeaveHistoryListModel {
  LeaveHistory? leaveHistory;
  String? mode;
  String? status;

  LeaveHistoryListModel({
    this.leaveHistory,
    this.mode,
    this.status,
  });

  factory LeaveHistoryListModel.fromJson(String str) =>
      LeaveHistoryListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LeaveHistoryListModel.fromMap(Map<String, dynamic> json) =>
      LeaveHistoryListModel(
        leaveHistory: json["leave_history"] == null
            ? LeaveHistory()
            : LeaveHistory.fromMap(json["leave_history"]),
        mode: json["mode"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "leave_history": leaveHistory?.toMap(),
        "mode": mode,
        "status": status,
      };
}

class LeaveHistory {
  int? currentPage;
  List<LeaveHistoryData>? dataList;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  dynamic perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  LeaveHistory({
    this.currentPage,
    this.dataList,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory LeaveHistory.fromJson(String str) =>
      LeaveHistory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LeaveHistory.fromMap(Map<String, dynamic> json) => LeaveHistory(
        currentPage: json["current_page"],
        dataList: json["data"] == null
            ? []
            : List<LeaveHistoryData>.from(
                json["data"]!.map((x) => LeaveHistoryData.fromMap(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "current_page": currentPage,
        "data": dataList == null
            ? []
            : List<dynamic>.from(dataList!.map((x) => x.toMap())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class LeaveHistoryData {
  int? id;
  int? siteEmployeeLeaveGenerateId;
  int? employeeHistoryId;
  int? spendLeaveDays;
  int? remainingDays;
  String? fromDate;
  DateTime? toDate;
  dynamic reason;
  dynamic approvedOrCancelledBy;
  DateTime? requestDate;
  dynamic approveDate;
  dynamic cancelDate;
  String? leaveStatus;
  int? siteId;
  int? academicGroupId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? status;
  int? approveStatus;
  SiteEmployeeLeaveGenerate? siteEmployeeLeaveGenerate;

  LeaveHistoryData({
    this.id,
    this.siteEmployeeLeaveGenerateId,
    this.employeeHistoryId,
    this.spendLeaveDays,
    this.remainingDays,
    this.fromDate,
    this.toDate,
    this.reason,
    this.approvedOrCancelledBy,
    this.requestDate,
    this.approveDate,
    this.cancelDate,
    this.leaveStatus,
    this.siteId,
    this.academicGroupId,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.approveStatus,
    this.siteEmployeeLeaveGenerate,
  });

  factory LeaveHistoryData.fromJson(String str) =>
      LeaveHistoryData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LeaveHistoryData.fromMap(Map<String, dynamic> json) =>
      LeaveHistoryData(
        id: json["id"],
        siteEmployeeLeaveGenerateId: json["site_employee_leave_generate_id"],
        employeeHistoryId: json["employee_history_id"],
        spendLeaveDays: json["spend_leave_days"],
        remainingDays: json["remaining_days"],
        fromDate: json["from_date"],
        toDate:
            json["to_date"] == null ? null : DateTime.parse(json["to_date"]),
        reason: json["reason"],
        approvedOrCancelledBy: json["approved_or_cancelled_by"],
        requestDate: json["request_date"] == null
            ? null
            : DateTime.parse(json["request_date"]),
        approveDate: json["approve_date"],
        cancelDate: json["cancel_date"],
        leaveStatus: json["leave_status"],
        siteId: json["site_id"],
        academicGroupId: json["academic_group_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        status: json["status"],
        approveStatus: json["approve_status"],
        siteEmployeeLeaveGenerate: json["site_employee_leave_generate"] == null
            ? SiteEmployeeLeaveGenerate()
            : SiteEmployeeLeaveGenerate.fromMap(
                json["site_employee_leave_generate"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "site_employee_leave_generate_id": siteEmployeeLeaveGenerateId,
        "employee_history_id": employeeHistoryId,
        "spend_leave_days": spendLeaveDays,
        "remaining_days": remainingDays,
        "from_date": fromDate,
        "to_date":
            "${toDate!.year.toString().padLeft(4, '0')}-${toDate!.month.toString().padLeft(2, '0')}-${toDate!.day.toString().padLeft(2, '0')}",
        "reason": reason,
        "approved_or_cancelled_by": approvedOrCancelledBy,
        "request_date":
            "${requestDate!.year.toString().padLeft(4, '0')}-${requestDate!.month.toString().padLeft(2, '0')}-${requestDate!.day.toString().padLeft(2, '0')}",
        "approve_date": approveDate,
        "cancel_date": cancelDate,
        "leave_status": leaveStatus,
        "site_id": siteId,
        "academic_group_id": academicGroupId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "status": status,
        "approve_status": approveStatus,
        "site_employee_leave_generate": siteEmployeeLeaveGenerate?.toMap(),
      };
}

class SiteEmployeeLeaveGenerate {
  int? id;
  int? siteLeavePolicyId;
  dynamic employeePreviousHistoryId;
  int? employeeHistoryId;
  dynamic academicFiscalYearId;
  int? academicYearId;
  dynamic previousLeaveDaysRemaining;
  int? leaveDays;
  int? status;
  int? siteId;
  int? academicGroupId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? leaveUseStatus;
  SiteLeavePolicy? siteLeavePolicy;

  SiteEmployeeLeaveGenerate({
    this.id,
    this.siteLeavePolicyId,
    this.employeePreviousHistoryId,
    this.employeeHistoryId,
    this.academicFiscalYearId,
    this.academicYearId,
    this.previousLeaveDaysRemaining,
    this.leaveDays,
    this.status,
    this.siteId,
    this.academicGroupId,
    this.createdAt,
    this.updatedAt,
    this.leaveUseStatus,
    this.siteLeavePolicy,
  });

  factory SiteEmployeeLeaveGenerate.fromJson(String str) =>
      SiteEmployeeLeaveGenerate.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SiteEmployeeLeaveGenerate.fromMap(Map<String, dynamic> json) =>
      SiteEmployeeLeaveGenerate(
        id: json["id"],
        siteLeavePolicyId: json["site_leave_policy_id"],
        employeePreviousHistoryId: json["employee_previous_history_id"],
        employeeHistoryId: json["employee_history_id"],
        academicFiscalYearId: json["academic_fiscal_year_id"],
        academicYearId: json["academic_year_id"],
        previousLeaveDaysRemaining: json["previous_leave_days_remaining"],
        leaveDays: json["leave_days"],
        status: json["status"],
        siteId: json["site_id"],
        academicGroupId: json["academic_group_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        leaveUseStatus: json["leave_use_status"],
        siteLeavePolicy: json["site_leave_policy"] == null
            ? SiteLeavePolicy()
            : SiteLeavePolicy.fromMap(json["site_leave_policy"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "site_leave_policy_id": siteLeavePolicyId,
        "employee_previous_history_id": employeePreviousHistoryId,
        "employee_history_id": employeeHistoryId,
        "academic_fiscal_year_id": academicFiscalYearId,
        "academic_year_id": academicYearId,
        "previous_leave_days_remaining": previousLeaveDaysRemaining,
        "leave_days": leaveDays,
        "status": status,
        "site_id": siteId,
        "academic_group_id": academicGroupId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "leave_use_status": leaveUseStatus,
        "site_leave_policy": siteLeavePolicy?.toMap(),
      };
}

class SiteLeavePolicy {
  int? id;
  int? academicLeaveTypeId;
  int? academicLeaveCategoryId;
  String? policyTitle;
  int? leaveDays;
  int? addToNextYear;
  int? wagesPayable;
  int? employeeDesignationId;
  dynamic policyDetails;
  int? status;
  int? siteId;
  int? academicGroupId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? multipleGenerate;
  int? genderId;
  AcademicLeave? academicLeaveType;
  AcademicLeave? academicLeaveCategory;

  SiteLeavePolicy({
    this.id,
    this.academicLeaveTypeId,
    this.academicLeaveCategoryId,
    this.policyTitle,
    this.leaveDays,
    this.addToNextYear,
    this.wagesPayable,
    this.employeeDesignationId,
    this.policyDetails,
    this.status,
    this.siteId,
    this.academicGroupId,
    this.createdAt,
    this.updatedAt,
    this.multipleGenerate,
    this.genderId,
    this.academicLeaveType,
    this.academicLeaveCategory,
  });

  factory SiteLeavePolicy.fromJson(String str) =>
      SiteLeavePolicy.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SiteLeavePolicy.fromMap(Map<String, dynamic> json) => SiteLeavePolicy(
        id: json["id"],
        academicLeaveTypeId: json["academic_leave_type_id"],
        academicLeaveCategoryId: json["academic_leave_category_id"],
        policyTitle: json["policy_title"],
        leaveDays: json["leave_days"],
        addToNextYear: json["add_to_next_year"],
        wagesPayable: json["wages_payable"],
        employeeDesignationId: json["employee_designation_id"],
        policyDetails: json["policy_details"],
        status: json["status"],
        siteId: json["site_id"],
        academicGroupId: json["academic_group_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        multipleGenerate: json["multiple_generate"],
        genderId: json["gender_id"],
        academicLeaveType: json["academic_leave_type"] == null
            ? AcademicLeave()
            : AcademicLeave.fromMap(json["academic_leave_type"]),
        academicLeaveCategory: json["academic_leave_category"] == null
            ? AcademicLeave()
            : AcademicLeave.fromMap(json["academic_leave_category"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "academic_leave_type_id": academicLeaveTypeId,
        "academic_leave_category_id": academicLeaveCategoryId,
        "policy_title": policyTitle,
        "leave_days": leaveDays,
        "add_to_next_year": addToNextYear,
        "wages_payable": wagesPayable,
        "employee_designation_id": employeeDesignationId,
        "policy_details": policyDetails,
        "status": status,
        "site_id": siteId,
        "academic_group_id": academicGroupId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "multiple_generate": multipleGenerate,
        "gender_id": genderId,
        "academic_leave_type": academicLeaveType?.toMap(),
        "academic_leave_category": academicLeaveCategory?.toMap(),
      };
}

class AcademicLeave {
  int? id;
  String? name;
  HeadKey? headKey;
  int? status;
  dynamic createdAt;
  dynamic updatedAt;
  String? shortName;

  AcademicLeave({
    this.id,
    this.name,
    this.headKey,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.shortName,
  });

  factory AcademicLeave.fromJson(String str) =>
      AcademicLeave.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AcademicLeave.fromMap(Map<String, dynamic> json) => AcademicLeave(
        id: json["id"],
        name: json["name"]!,
        headKey: headKeyValues.map[json["head_key"]]!,
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        shortName: json["short_name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "head_key": headKeyValues.reverse[headKey],
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "short_name": shortName,
      };
}

enum HeadKey { GENERAL }

final headKeyValues = EnumValues({"general": HeadKey.GENERAL});

enum Name { CASUAL_LEAVE, GENERAL }

final nameValues =
    EnumValues({"Casual Leave": "CASUAL_LEAVE", "General": "GENERAL"});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
