import 'dart:convert';

class LeaveTypeAndCategoryListModel {
    List<LeaveList>? leaveTypeList;
    List<LeaveList>? leaveCategoryList;
    String? mode;
    String? status;

    LeaveTypeAndCategoryListModel({
        this.leaveTypeList,
        this.leaveCategoryList,
        this.mode,
        this.status,
    });

    factory LeaveTypeAndCategoryListModel.fromJson(String str) => LeaveTypeAndCategoryListModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LeaveTypeAndCategoryListModel.fromMap(Map<String, dynamic> json) => LeaveTypeAndCategoryListModel(
        leaveTypeList: json["leave_type_list"] == null ? [] : List<LeaveList>.from(json["leave_type_list"]!.map((x) => LeaveList.fromMap(x))),
        leaveCategoryList: json["leave_category_list"] == null ? [] : List<LeaveList>.from(json["leave_category_list"]!.map((x) => LeaveList.fromMap(x))),
        mode: json["mode"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "leave_type_list": leaveTypeList == null ? [] : List<dynamic>.from(leaveTypeList!.map((x) => x.toMap())),
        "leave_category_list": leaveCategoryList == null ? [] : List<dynamic>.from(leaveCategoryList!.map((x) => x.toMap())),
        "mode": mode,
        "status": status,
    };
}

class LeaveList {
    int? id;
    String? name;
    String? headKey;
    int? status;
    dynamic createdAt;
    dynamic updatedAt;
    String? shortName;

    LeaveList({
        this.id,
        this.name,
        this.headKey,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.shortName,
    });

    factory LeaveList.fromJson(String str) => LeaveList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LeaveList.fromMap(Map<String, dynamic> json) => LeaveList(
        id: json["id"],
        name: json["name"],
        headKey: json["head_key"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        shortName: json["short_name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "head_key": headKey,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "short_name": shortName,
    };
}
