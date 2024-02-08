import 'dart:convert';

class ExamSubjectListModel {
    final List<SubjectGorupConditionSetting>? subjectGorupConditionSettingList;
    final String? mode;
    final String? status;

    ExamSubjectListModel({
        this.subjectGorupConditionSettingList,
        this.mode,
        this.status,
    });

    ExamSubjectListModel copyWith({
        List<SubjectGorupConditionSetting>? subjectGorupConditionSettingList,
        String? mode,
        String? status,
    }) => 
        ExamSubjectListModel(
            subjectGorupConditionSettingList: subjectGorupConditionSettingList ?? this.subjectGorupConditionSettingList,
            mode: mode ?? this.mode,
            status: status ?? this.status,
        );

    factory ExamSubjectListModel.fromJson(String str) => ExamSubjectListModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ExamSubjectListModel.fromMap(Map<String, dynamic> json) => ExamSubjectListModel(
        subjectGorupConditionSettingList: json["subject_gorup_condition_setting_list"] == null ? [] : List<SubjectGorupConditionSetting>.from(json["subject_gorup_condition_setting_list"]!.map((x) => SubjectGorupConditionSetting.fromMap(x))),
        mode: json["mode"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "subject_gorup_condition_setting_list": subjectGorupConditionSettingList == null ? [] : List<dynamic>.from(subjectGorupConditionSettingList!.map((x) => x.toMap())),
        "mode": mode,
        "status": status,
    };
}

class SubjectGorupConditionSetting {
    final int? id;
    final int? academicSubjectId;
    final List<dynamic>? academicClassGroups;
    final List<dynamic>? academicSubjectConditions;
    final String? subjectName;
    final AcademicSubject? academicSubject;

    SubjectGorupConditionSetting({
        this.id,
        this.academicSubjectId,
        this.academicClassGroups,
        this.academicSubjectConditions,
        this.subjectName,
        this.academicSubject,
    });

    SubjectGorupConditionSetting copyWith({
        int? id,
        int? academicSubjectId,
        List<dynamic>? academicClassGroups,
        List<dynamic>? academicSubjectConditions,
        String? subjectName,
        AcademicSubject? academicSubject,
    }) => 
        SubjectGorupConditionSetting(
            id: id ?? this.id,
            academicSubjectId: academicSubjectId ?? this.academicSubjectId,
            academicClassGroups: academicClassGroups ?? this.academicClassGroups,
            academicSubjectConditions: academicSubjectConditions ?? this.academicSubjectConditions,
            subjectName: subjectName ?? this.subjectName,
            academicSubject: academicSubject ?? this.academicSubject,
        );

    factory SubjectGorupConditionSetting.fromJson(String str) => SubjectGorupConditionSetting.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SubjectGorupConditionSetting.fromMap(Map<String, dynamic> json) => SubjectGorupConditionSetting(
        id: json["id"],
        academicSubjectId: json["academic_subject_id"],
        academicClassGroups: json["academic_class_groups"] == null ? [] : List<dynamic>.from(json["academic_class_groups"]!.map((x) => x)),
        academicSubjectConditions: json["academic_subject_conditions"] == null ? [] : List<dynamic>.from(json["academic_subject_conditions"]!.map((x) => x)),
        subjectName: json["subject_name"],
        academicSubject: json["academic_subject"] == null ? null : AcademicSubject.fromMap(json["academic_subject"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "academic_subject_id": academicSubjectId,
        "academic_class_groups": academicClassGroups == null ? [] : List<dynamic>.from(academicClassGroups!.map((x) => x)),
        "academic_subject_conditions": academicSubjectConditions == null ? [] : List<dynamic>.from(academicSubjectConditions!.map((x) => x)),
        "subject_name": subjectName,
        "academic_subject": academicSubject?.toMap(),
    };
}

class AcademicSubject {
    final int? id;
    final int? belongsToAcademicGroup;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? subjectName;
    final List<Translation>? translations;

    AcademicSubject({
        this.id,
        this.belongsToAcademicGroup,
        this.createdAt,
        this.updatedAt,
        this.subjectName,
        this.translations,
    });

    AcademicSubject copyWith({
        int? id,
        int? belongsToAcademicGroup,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? subjectName,
        List<Translation>? translations,
    }) => 
        AcademicSubject(
            id: id ?? this.id,
            belongsToAcademicGroup: belongsToAcademicGroup ?? this.belongsToAcademicGroup,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            subjectName: subjectName ?? this.subjectName,
            translations: translations ?? this.translations,
        );

    factory AcademicSubject.fromJson(String str) => AcademicSubject.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AcademicSubject.fromMap(Map<String, dynamic> json) => AcademicSubject(
        id: json["id"],
        belongsToAcademicGroup: json["belongs_to_academic_group"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        subjectName: json["subject_name"],
        translations: json["translations"] == null ? [] : List<Translation>.from(json["translations"]!.map((x) => Translation.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "belongs_to_academic_group": belongsToAcademicGroup,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "subject_name": subjectName,
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x.toMap())),
    };
}

class Translation {
    final int? id;
    final String? academicSubjectId;
    final String? subjectName;
    final String? locale;

    Translation({
        this.id,
        this.academicSubjectId,
        this.subjectName,
        this.locale,
    });

    Translation copyWith({
        int? id,
        String? academicSubjectId,
        String? subjectName,
        String? locale,
    }) => 
        Translation(
            id: id ?? this.id,
            academicSubjectId: academicSubjectId ?? this.academicSubjectId,
            subjectName: subjectName ?? this.subjectName,
            locale: locale ?? this.locale,
        );

    factory Translation.fromJson(String str) => Translation.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Translation.fromMap(Map<String, dynamic> json) => Translation(
        id: json["id"],
        academicSubjectId: json["academic_subject_id"],
        subjectName: json["subject_name"],
        locale: json["locale"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "academic_subject_id": academicSubjectId,
        "subject_name": subjectName,
        "locale": locale,
    };
}
