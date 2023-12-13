// To parse this JSON data, do
//
//     final academicGroupListApiModel = academicGroupListApiModelFromMap(jsonString);

import 'dart:convert';

AcademicGroupListApiModel academicGroupListApiModelFromMap(String str) => AcademicGroupListApiModel.fromMap(json.decode(str));

String academicGroupListApiModelToMap(AcademicGroupListApiModel data) => json.encode(data.toMap());

class AcademicGroupListApiModel {
    final List<AcademicGroupList>? academicGroupList;
    final String? mode;
    final String? status;

    AcademicGroupListApiModel({
        this.academicGroupList,
        this.mode,
        this.status,
    });

    AcademicGroupListApiModel copyWith({
        List<AcademicGroupList>? academicGroupList,
        String? mode,
        String? status,
    }) => 
        AcademicGroupListApiModel(
            academicGroupList: academicGroupList ?? this.academicGroupList,
            mode: mode ?? this.mode,
            status: status ?? this.status,
        );

    factory AcademicGroupListApiModel.fromMap(Map<String, dynamic> json) => AcademicGroupListApiModel(
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
    final int? id;
    final String? academicGroupName;
    final String? academicKey;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final dynamic deletedAt;
    final dynamic serial;

    AcademicGroupList({
        this.id,
        this.academicGroupName,
        this.academicKey,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.serial,
    });

    AcademicGroupList copyWith({
        int? id,
        String? academicGroupName,
        String? academicKey,
        DateTime? createdAt,
        DateTime? updatedAt,
        dynamic deletedAt,
        dynamic serial,
    }) => 
        AcademicGroupList(
            id: id ?? this.id,
            academicGroupName: academicGroupName ?? this.academicGroupName,
            academicKey: academicKey ?? this.academicKey,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            deletedAt: deletedAt ?? this.deletedAt,
            serial: serial ?? this.serial,
        );

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
