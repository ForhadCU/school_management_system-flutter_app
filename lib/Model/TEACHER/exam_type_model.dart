import 'dart:convert';

class ExamTypeModel {
    List<ExamTypeListForAttandance>? examTypeList;
    String? mode;
    String? status;

    ExamTypeModel({
        this.examTypeList,
        this.mode,
        this.status,
    });

    factory ExamTypeModel.fromRawJson(String str) => ExamTypeModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ExamTypeModel.fromJson(Map<String, dynamic> json) => ExamTypeModel(
        examTypeList: json["exam_type_array"] == null ? [] : List<ExamTypeListForAttandance>.from(json["exam_type_array"]!.map((x) => ExamTypeListForAttandance.fromJson(x))),
        mode: json["mode"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "exam_type_array": examTypeList == null ? [] : List<dynamic>.from(examTypeList!.map((x) => x.toJson())),
        "mode": mode,
        "status": status,
    };
}

class ExamTypeListForAttandance {
    int? selectedStudentCount;
    int? passedStudentCount;
    int? failedStudentCount;
    bool? selectAll;
    int? academicExamTypeId;
    bool? loadingShow;
    AcademicExamType? academicExamType;

    ExamTypeListForAttandance({
        this.selectedStudentCount,
        this.passedStudentCount,
        this.failedStudentCount,
        this.selectAll,
        this.academicExamTypeId,
        this.loadingShow,
        this.academicExamType,
    });

    factory ExamTypeListForAttandance.fromRawJson(String str) => ExamTypeListForAttandance.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ExamTypeListForAttandance.fromJson(Map<String, dynamic> json) => ExamTypeListForAttandance(
        selectedStudentCount: json["selected_student_count"],
        passedStudentCount: json["passed_student_count"],
        failedStudentCount: json["failed_student_count"],
        selectAll: json["select_all"],
        academicExamTypeId: json["academic_exam_type_id"],
        loadingShow: json["loading_show"],
        academicExamType: json["academic_exam_type"] == null ? null : AcademicExamType.fromJson(json["academic_exam_type"]),
    );

    Map<String, dynamic> toJson() => {
        "selected_student_count": selectedStudentCount,
        "passed_student_count": passedStudentCount,
        "failed_student_count": failedStudentCount,
        "select_all": selectAll,
        "academic_exam_type_id": academicExamTypeId,
        "loading_show": loadingShow,
        "academic_exam_type": academicExamType?.toJson(),
    };
}

class AcademicExamType {
    int? id;
    String? marksType;
    int? status;
    dynamic deletedAt;
    String? headKey;

    AcademicExamType({
        this.id,
        this.marksType,
        this.status,
        this.deletedAt,
        this.headKey,
    });

    factory AcademicExamType.fromRawJson(String str) => AcademicExamType.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AcademicExamType.fromJson(Map<String, dynamic> json) => AcademicExamType(
        id: json["id"],
        marksType: json["marks_type"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        headKey: json["head_key"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "marks_type": marksType,
        "status": status,
        "deleted_at": deletedAt,
        "head_key": headKey,
    };
}
