import 'dart:convert';

class PubAcademicGroupResponseModel {
    List<AcademicGroupList>? academicGroupList;
    String? mode;
    String? status;

    PubAcademicGroupResponseModel({
        this.academicGroupList,
        this.mode,
        this.status,
    });

    factory PubAcademicGroupResponseModel.fromJson(String str) => PubAcademicGroupResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PubAcademicGroupResponseModel.fromMap(Map<String, dynamic> json) => PubAcademicGroupResponseModel(
        academicGroupList: json["academic_group_list"] == null ? [] : List<AcademicGroupList>.from(json["academic_group_list"]!.map((x) => AcademicGroupList.fromMap(x))),
        mode: json["mode"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "academic_group_list": academicGroupList == null ? [] : List<dynamic>.from(academicGroupList!.map((x) => x.toMap())),
        "mode": mode,
        "status": status,
    };
}

class AcademicGroupList {
    int? id;
    String? academicGroupName;
    String? academicKey;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    dynamic serial;

    AcademicGroupList({
        this.id,
        this.academicGroupName,
        this.academicKey,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.serial,
    });

    factory AcademicGroupList.fromJson(String str) => AcademicGroupList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AcademicGroupList.fromMap(Map<String, dynamic> json) => AcademicGroupList(
        id: json["id"],
        academicGroupName: json["academic_group_name"],
        academicKey: json["academic_key"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        serial: json["serial"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "academic_group_name": academicGroupName,
        "academic_key": academicKey,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "serial": serial,
    };
}
