import 'dart:convert';

class ExamDistributionListModel {
    final List<EmployeePaperDistribution>? employeePaperDistributionList;
    final String? mode;
    final String? status;

    ExamDistributionListModel({
        this.employeePaperDistributionList,
        this.mode,
        this.status,
    });

    ExamDistributionListModel copyWith({
        List<EmployeePaperDistribution>? employeePaperDistributionList,
        String? mode,
        String? status,
    }) => 
        ExamDistributionListModel(
            employeePaperDistributionList: employeePaperDistributionList ?? this.employeePaperDistributionList,
            mode: mode ?? this.mode,
            status: status ?? this.status,
        );

    factory ExamDistributionListModel.fromJson(String str) => ExamDistributionListModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ExamDistributionListModel.fromMap(Map<String, dynamic> json) => ExamDistributionListModel(
        employeePaperDistributionList: json["employee_paper_distribution_list"] == null ? [] : List<EmployeePaperDistribution>.from(json["employee_paper_distribution_list"]!.map((x) => EmployeePaperDistribution.fromMap(x))),
        mode: json["mode"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "employee_paper_distribution_list": employeePaperDistributionList == null ? [] : List<dynamic>.from(employeePaperDistributionList!.map((x) => x.toMap())),
        "mode": mode,
        "status": status,
    };
}

class EmployeePaperDistribution {
    final int? id;
    final int? academicGroupId;
    final int? academicVersionId;
    final int? academicYearId;
    final int? academicShiftId;
    final int? academicClassId;
    final int? academicDepartmentId;
    final int? academicClassGroupId;
    final dynamic academicSectionId;
    final dynamic academicSessionId;
    final int? academicSubjectId;
    final int? siteSubjectGroupConditionSettingId;
    final int? userId;
    final int? siteExamDeclareId;
    final int? examinationId;
    final int? academicExamTypeId;
    final int? rollFrom;
    final int? rollTo;
    final int? siteId;
    final int? status;
    final dynamic createdAt;
    final DateTime? updatedAt;
    final dynamic marksUpdateAt;
    final dynamic department;
    final StClass? stClass;
    final ClassGroup? classGroup;
    final dynamic session;
    final dynamic section;
    final DistributedAcademicExamType? academicExamType;

    EmployeePaperDistribution({
        this.id,
        this.academicGroupId,
        this.academicVersionId,
        this.academicYearId,
        this.academicShiftId,
        this.academicClassId,
        this.academicDepartmentId,
        this.academicClassGroupId,
        this.academicSectionId,
        this.academicSessionId,
        this.academicSubjectId,
        this.siteSubjectGroupConditionSettingId,
        this.userId,
        this.siteExamDeclareId,
        this.examinationId,
        this.academicExamTypeId,
        this.rollFrom,
        this.rollTo,
        this.siteId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.marksUpdateAt,
        this.department,
        this.stClass,
        this.classGroup,
        this.session,
        this.section,
        this.academicExamType,
    });

    EmployeePaperDistribution copyWith({
        int? id,
        int? academicGroupId,
        int? academicVersionId,
        int? academicYearId,
        int? academicShiftId,
        int? academicClassId,
        int? academicDepartmentId,
        int? academicClassGroupId,
        dynamic academicSectionId,
        dynamic academicSessionId,
        int? academicSubjectId,
        int? siteSubjectGroupConditionSettingId,
        int? userId,
        int? siteExamDeclareId,
        int? examinationId,
        int? academicExamTypeId,
        int? rollFrom,
        int? rollTo,
        int? siteId,
        int? status,
        dynamic createdAt,
        DateTime? updatedAt,
        dynamic marksUpdateAt,
        dynamic department,
        StClass? stClass,
        ClassGroup? classGroup,
        dynamic session,
        dynamic section,
        DistributedAcademicExamType? academicExamType,
    }) => 
        EmployeePaperDistribution(
            id: id ?? this.id,
            academicGroupId: academicGroupId ?? this.academicGroupId,
            academicVersionId: academicVersionId ?? this.academicVersionId,
            academicYearId: academicYearId ?? this.academicYearId,
            academicShiftId: academicShiftId ?? this.academicShiftId,
            academicClassId: academicClassId ?? this.academicClassId,
            academicDepartmentId: academicDepartmentId ?? this.academicDepartmentId,
            academicClassGroupId: academicClassGroupId ?? this.academicClassGroupId,
            academicSectionId: academicSectionId ?? this.academicSectionId,
            academicSessionId: academicSessionId ?? this.academicSessionId,
            academicSubjectId: academicSubjectId ?? this.academicSubjectId,
            siteSubjectGroupConditionSettingId: siteSubjectGroupConditionSettingId ?? this.siteSubjectGroupConditionSettingId,
            userId: userId ?? this.userId,
            siteExamDeclareId: siteExamDeclareId ?? this.siteExamDeclareId,
            examinationId: examinationId ?? this.examinationId,
            academicExamTypeId: academicExamTypeId ?? this.academicExamTypeId,
            rollFrom: rollFrom ?? this.rollFrom,
            rollTo: rollTo ?? this.rollTo,
            siteId: siteId ?? this.siteId,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            marksUpdateAt: marksUpdateAt ?? this.marksUpdateAt,
            department: department ?? this.department,
            stClass: stClass ?? this.stClass,
            classGroup: classGroup ?? this.classGroup,
            session: session ?? this.session,
            section: section ?? this.section,
            academicExamType: academicExamType ?? this.academicExamType,
        );

    factory EmployeePaperDistribution.fromJson(String str) => EmployeePaperDistribution.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EmployeePaperDistribution.fromMap(Map<String, dynamic> json) => EmployeePaperDistribution(
        id: json["id"],
        academicGroupId: json["academic_group_id"],
        academicVersionId: json["academic_version_id"],
        academicYearId: json["academic_year_id"],
        academicShiftId: json["academic_shift_id"],
        academicClassId: json["academic_class_id"],
        academicDepartmentId: json["academic_department_id"],
        academicClassGroupId: json["academic_class_group_id"],
        academicSectionId: json["academic_section_id"],
        academicSessionId: json["academic_session_id"],
        academicSubjectId: json["academic_subject_id"],
        siteSubjectGroupConditionSettingId: json["site_subject_group_condition_setting_id"],
        userId: json["user_id"],
        siteExamDeclareId: json["site_exam_declare_id"],
        examinationId: json["examination_id"],
        academicExamTypeId: json["academic_exam_type_id"],
        rollFrom: json["roll_from"],
        rollTo: json["roll_to"],
        siteId: json["site_id"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        marksUpdateAt: json["marks_update_at"],
        department: json["department"],
        stClass: json["st_class"] == null ? null : StClass.fromMap(json["st_class"]),
        classGroup: json["class_group"] == null ? null : ClassGroup.fromMap(json["class_group"]),
        session: json["session"],
        section: json["section"],
        academicExamType: json["academic_exam_type"] == null ? null : DistributedAcademicExamType.fromMap(json["academic_exam_type"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "academic_group_id": academicGroupId,
        "academic_version_id": academicVersionId,
        "academic_year_id": academicYearId,
        "academic_shift_id": academicShiftId,
        "academic_class_id": academicClassId,
        "academic_department_id": academicDepartmentId,
        "academic_class_group_id": academicClassGroupId,
        "academic_section_id": academicSectionId,
        "academic_session_id": academicSessionId,
        "academic_subject_id": academicSubjectId,
        "site_subject_group_condition_setting_id": siteSubjectGroupConditionSettingId,
        "user_id": userId,
        "site_exam_declare_id": siteExamDeclareId,
        "examination_id": examinationId,
        "academic_exam_type_id": academicExamTypeId,
        "roll_from": rollFrom,
        "roll_to": rollTo,
        "site_id": siteId,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
        "marks_update_at": marksUpdateAt,
        "department": department,
        "st_class": stClass?.toMap(),
        "class_group": classGroup?.toMap(),
        "session": session,
        "section": section,
        "academic_exam_type": academicExamType?.toMap(),
    };
}

class DistributedAcademicExamType {
    final int? id;
    final String? marksType;
    final int? status;
    final dynamic deletedAt;
    final String? headKey;

    DistributedAcademicExamType({
        this.id,
        this.marksType,
        this.status,
        this.deletedAt,
        this.headKey,
    });

    DistributedAcademicExamType copyWith({
        int? id,
        String? marksType,
        int? status,
        dynamic deletedAt,
        String? headKey,
    }) => 
        DistributedAcademicExamType(
            id: id ?? this.id,
            marksType: marksType ?? this.marksType,
            status: status ?? this.status,
            deletedAt: deletedAt ?? this.deletedAt,
            headKey: headKey ?? this.headKey,
        );

    factory DistributedAcademicExamType.fromJson(String str) => DistributedAcademicExamType.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DistributedAcademicExamType.fromMap(Map<String, dynamic> json) => DistributedAcademicExamType(
        id: json["id"],
        marksType: json["marks_type"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        headKey: json["head_key"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "marks_type": marksType,
        "status": status,
        "deleted_at": deletedAt,
        "head_key": headKey,
    };
}

class ClassGroup {
    final int? id;
    final String? groupName;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final dynamic deletedAt;

    ClassGroup({
        this.id,
        this.groupName,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    ClassGroup copyWith({
        int? id,
        String? groupName,
        DateTime? createdAt,
        DateTime? updatedAt,
        dynamic deletedAt,
    }) => 
        ClassGroup(
            id: id ?? this.id,
            groupName: groupName ?? this.groupName,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            deletedAt: deletedAt ?? this.deletedAt,
        );

    factory ClassGroup.fromJson(String str) => ClassGroup.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ClassGroup.fromMap(Map<String, dynamic> json) => ClassGroup(
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

class StClass {
    final int? id;
    final String? className;
    final int? academicGroupPresent;
    final int? serialNo;
    final String? note;
    final int? status;
    final dynamic createdAt;
    final dynamic updatedAt;
    final dynamic deletedAt;
    final dynamic minimumBirthDate;

    StClass({
        this.id,
        this.className,
        this.academicGroupPresent,
        this.serialNo,
        this.note,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.minimumBirthDate,
    });

    StClass copyWith({
        int? id,
        String? className,
        int? academicGroupPresent,
        int? serialNo,
        String? note,
        int? status,
        dynamic createdAt,
        dynamic updatedAt,
        dynamic deletedAt,
        dynamic minimumBirthDate,
    }) => 
        StClass(
            id: id ?? this.id,
            className: className ?? this.className,
            academicGroupPresent: academicGroupPresent ?? this.academicGroupPresent,
            serialNo: serialNo ?? this.serialNo,
            note: note ?? this.note,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            deletedAt: deletedAt ?? this.deletedAt,
            minimumBirthDate: minimumBirthDate ?? this.minimumBirthDate,
        );

    factory StClass.fromJson(String str) => StClass.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory StClass.fromMap(Map<String, dynamic> json) => StClass(
        id: json["id"],
        className: json["class_name"],
        academicGroupPresent: json["academic_group_present"],
        serialNo: json["serial_no"],
        note: json["note"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
        minimumBirthDate: json["minimum_birth_date"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "class_name": className,
        "academic_group_present": academicGroupPresent,
        "serial_no": serialNo,
        "note": note,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
        "minimum_birth_date": minimumBirthDate,
    };
}
