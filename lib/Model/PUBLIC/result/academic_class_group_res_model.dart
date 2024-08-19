import 'dart:convert';

class PubAcademicClassGroupResModel {
    List<AcademicClassGroupList>? academicClassGroupList;
    List<dynamic>? sectionList;
    List<dynamic>? sessionList;
    List<dynamic>? batchList;
    List<ResultList>? resultList;
    String? mode;
    String? status;

    PubAcademicClassGroupResModel({
        this.academicClassGroupList,
        this.sectionList,
        this.sessionList,
        this.batchList,
        this.resultList,
        this.mode,
        this.status,
    });

    factory PubAcademicClassGroupResModel.fromJson(String str) => PubAcademicClassGroupResModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PubAcademicClassGroupResModel.fromMap(Map<String, dynamic> json) => PubAcademicClassGroupResModel(
        academicClassGroupList: json["academic_class_group_list"] == null ? [] : List<AcademicClassGroupList>.from(json["academic_class_group_list"]!.map((x) => AcademicClassGroupList.fromMap(x))),
        sectionList: json["section_list"] == null ? [] : List<dynamic>.from(json["section_list"]!.map((x) => x)),
        sessionList: json["session_list"] == null ? [] : List<dynamic>.from(json["session_list"]!.map((x) => x)),
        batchList: json["batch_list"] == null ? [] : List<dynamic>.from(json["batch_list"]!.map((x) => x)),
        resultList: json["result_list"] == null ? [] : List<ResultList>.from(json["result_list"]!.map((x) => ResultList.fromMap(x))),
        mode: json["mode"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "academic_class_group_list": academicClassGroupList == null ? [] : List<dynamic>.from(academicClassGroupList!.map((x) => x.toMap())),
        "section_list": sectionList == null ? [] : List<dynamic>.from(sectionList!.map((x) => x)),
        "session_list": sessionList == null ? [] : List<dynamic>.from(sessionList!.map((x) => x)),
        "batch_list": batchList == null ? [] : List<dynamic>.from(batchList!.map((x) => x)),
        "result_list": resultList == null ? [] : List<dynamic>.from(resultList!.map((x) => x.toMap())),
        "mode": mode,
        "status": status,
    };
}

class AcademicClassGroupList {
    int? id;
    String? groupName;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;

    AcademicClassGroupList({
        this.id,
        this.groupName,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory AcademicClassGroupList.fromJson(String str) => AcademicClassGroupList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AcademicClassGroupList.fromMap(Map<String, dynamic> json) => AcademicClassGroupList(
        id: json["id"],
        groupName: json["group_name"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "group_name": groupName,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
    };
}

class ResultList {
    int? id;
    String? name;

    ResultList({
        this.id,
        this.name,
    });

    factory ResultList.fromJson(String str) => ResultList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ResultList.fromMap(Map<String, dynamic> json) => ResultList(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
    };
}
