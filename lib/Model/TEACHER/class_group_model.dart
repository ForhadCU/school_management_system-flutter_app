import 'dart:convert';

class ClassGroupModel {
    final List<TeachAcademicGroup>? academicGroupList;
    final List<dynamic>? academicSectionList;
    final List<AcademicSessionBasedOnGroup>? academicSessionList;
    final List<dynamic>? academicBatchList;
    final String? mode;
    final String? status;

    ClassGroupModel({
        this.academicGroupList,
        this.academicSectionList,
        this.academicSessionList,
        this.academicBatchList,
        this.mode,
        this.status,
    });

    ClassGroupModel copyWith({
        List<TeachAcademicGroup>? academicGroupList,
        List<dynamic>? academicSectionList,
        List<AcademicSessionBasedOnGroup>? academicSessionList,
        List<dynamic>? academicBatchList,
        String? mode,
        String? status,
    }) => 
        ClassGroupModel(
            academicGroupList: academicGroupList ?? this.academicGroupList,
            academicSectionList: academicSectionList ?? this.academicSectionList,
            academicSessionList: academicSessionList ?? this.academicSessionList,
            academicBatchList: academicBatchList ?? this.academicBatchList,
            mode: mode ?? this.mode,
            status: status ?? this.status,
        );

    factory ClassGroupModel.fromJson(String str) => ClassGroupModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ClassGroupModel.fromMap(Map<String, dynamic> json) => ClassGroupModel(
        academicGroupList: json["academic_group_list"] == null ? [] : List<TeachAcademicGroup>.from(json["academic_group_list"]!.map((x) => TeachAcademicGroup.fromMap(x))),
        academicSectionList: json["academic_section_list"] == null ? [] : List<dynamic>.from(json["academic_section_list"]!.map((x) => x)),
        academicSessionList: json["academic_session_list"] == null ? [] : List<AcademicSessionBasedOnGroup>.from(json["academic_session_list"]!.map((x) => AcademicSessionBasedOnGroup.fromMap(x))),
        academicBatchList: json["academic_batch_list"] == null ? [] : List<dynamic>.from(json["academic_batch_list"]!.map((x) => x)),
        mode: json["mode"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "academic_group_list": academicGroupList == null ? [] : List<dynamic>.from(academicGroupList!.map((x) => x.toMap())),
        "academic_section_list": academicSectionList == null ? [] : List<dynamic>.from(academicSectionList!.map((x) => x)),
        "academic_session_list": academicSessionList == null ? [] : List<dynamic>.from(academicSessionList!.map((x) => x.toMap())),
        "academic_batch_list": academicBatchList == null ? [] : List<dynamic>.from(academicBatchList!.map((x) => x)),
        "mode": mode,
        "status": status,
    };
}

class TeachAcademicGroup {
    final int? id;
    final String? groupName;

    TeachAcademicGroup({
        this.id,
        this.groupName,
    });

    TeachAcademicGroup copyWith({
        int? id,
        String? groupName,
    }) => 
        TeachAcademicGroup(
            id: id ?? this.id,
            groupName: groupName ?? this.groupName,
        );

    factory TeachAcademicGroup.fromJson(String str) => TeachAcademicGroup.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TeachAcademicGroup.fromMap(Map<String, dynamic> json) => TeachAcademicGroup(
        id: json["id"],
        groupName: json["group_name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "group_name": groupName,
    };
}

class AcademicSessionBasedOnGroup {
    final int? id;
    final String? sessionName;

    AcademicSessionBasedOnGroup({
        this.id,
        this.sessionName,
    });

    AcademicSessionBasedOnGroup copyWith({
        int? id,
        String? sessionName,
    }) => 
        AcademicSessionBasedOnGroup(
            id: id ?? this.id,
            sessionName: sessionName ?? this.sessionName,
        );

    factory AcademicSessionBasedOnGroup.fromJson(String str) => AcademicSessionBasedOnGroup.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AcademicSessionBasedOnGroup.fromMap(Map<String, dynamic> json) => AcademicSessionBasedOnGroup(
        id: json["id"],
        sessionName: json["session_name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "session_name": sessionName,
    };
}
