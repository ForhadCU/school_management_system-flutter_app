import 'dart:convert';

class LeaveBalanceListModel {
  List<LeaveBalanceList>? leaveBalanceList;
  String? mode;
  String? status;

  LeaveBalanceListModel({
    this.leaveBalanceList,
    this.mode,
    this.status,
  });

  factory LeaveBalanceListModel.fromJson(String str) =>
      LeaveBalanceListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LeaveBalanceListModel.fromMap(Map<String, dynamic> json) =>
      LeaveBalanceListModel(
        leaveBalanceList: json["leave_balance_list"] == null
            ? []
            : List<LeaveBalanceList>.from(json["leave_balance_list"]!
                .map((x) => LeaveBalanceList.fromMap(x))),
        mode: json["mode"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "leave_balance_list": leaveBalanceList == null
            ? []
            : List<dynamic>.from(leaveBalanceList!.map((x) => x.toMap())),
        "mode": mode,
        "status": status,
      };
}

class LeaveBalanceList {
  String? leaveType;
  String? leaveCategory;
  int? totalDays;
  int? spendDays;
  int? remainingDays;

  LeaveBalanceList({
    this.leaveType,
    this.leaveCategory,
    this.totalDays,
    this.spendDays,
    this.remainingDays,
  });

  factory LeaveBalanceList.fromJson(String str) =>
      LeaveBalanceList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LeaveBalanceList.fromMap(Map<String, dynamic> json) =>
      LeaveBalanceList(
        leaveType: json["leave_type"],
        leaveCategory: json["leave_category"],
        totalDays: json["total_days"],
        spendDays: json["spend_days"],
        remainingDays: json["remaining_days"],
      );

  Map<String, dynamic> toMap() => {
        "leave_type": leaveType,
        "leave_category": leaveCategory,
        "total_days": totalDays,
        "spend_days": spendDays,
        "remaining_days": remainingDays,
      };
}
