import 'dart:convert';

class StuResultDetailsModel {
  static String get getDataListJsonKey => "result_array";

  final int? academicResultPrimaryTypeId;
  final String? resultTypeName;
  final int? studentHistoryId;
  final int? failSubjectCount;
  final double? gpa;
  final String? grade;
  final int? studentRank;
  final dynamic siteResultPrimarySettingId;
  final List<SubjectList>? subjectList;
  final List<TableHeader>? tableHeader;
  final Map<String, HighestMark>? highestMarks;
  final StudentHistory? studentHistory;
  final int? resultTypeId;
  final int? resultShowInTableBellowStatusPresent;
  final int? totalStudent;
  final String? studentPhoto;
  final int? classtestIsPresent;
  final int? combineSubjectPresent;
  final String? finalGradeWithoutOptional;
  final int? finalPointWithoutOptional;
  final int? id;
  final String? rawObtainMarksPercentage;
  final int? sumOfObtainPercentTotalMarks;
  final int? sumOfObtainRawTotalMarks;
  final int? sumOfRawTotalMarks;
  final int? sumOfObtainTotalMarksForShow;
  final String? sumOfObtainTotalPercentForShow;
  final dynamic academicDays;
  final dynamic presentDays;
  final dynamic absentDays;
  final dynamic behaviour;
  final dynamic culturalActivities;
  final dynamic bncc;
  final dynamic debate;
  final dynamic scout;
  final dynamic sports;
  final dynamic others;

  StuResultDetailsModel({
    this.academicResultPrimaryTypeId,
    this.resultTypeName,
    this.studentHistoryId,
    this.failSubjectCount,
    this.gpa,
    this.grade,
    this.studentRank,
    this.siteResultPrimarySettingId,
    this.subjectList,
    this.tableHeader,
    this.highestMarks,
    this.studentHistory,
    this.resultTypeId,
    this.resultShowInTableBellowStatusPresent,
    this.totalStudent,
    this.studentPhoto,
    this.classtestIsPresent,
    this.combineSubjectPresent,
    this.finalGradeWithoutOptional,
    this.finalPointWithoutOptional,
    this.id,
    this.rawObtainMarksPercentage,
    this.sumOfObtainPercentTotalMarks,
    this.sumOfObtainRawTotalMarks,
    this.sumOfRawTotalMarks,
    this.sumOfObtainTotalMarksForShow,
    this.sumOfObtainTotalPercentForShow,
    this.academicDays,
    this.presentDays,
    this.absentDays,
    this.behaviour,
    this.culturalActivities,
    this.bncc,
    this.debate,
    this.scout,
    this.sports,
    this.others,
  });

  StuResultDetailsModel copyWith({
    int? academicResultPrimaryTypeId,
    String? resultTypeName,
    int? studentHistoryId,
    int? failSubjectCount,
    double? gpa,
    String? grade,
    int? studentRank,
    dynamic siteResultPrimarySettingId,
    List<SubjectList>? subjectList,
    List<TableHeader>? tableHeader,
    Map<String, HighestMark>? highestMarks,
    StudentHistory? studentHistory,
    int? resultTypeId,
    int? resultShowInTableBellowStatusPresent,
    int? totalStudent,
    String? studentPhoto,
    int? classtestIsPresent,
    int? combineSubjectPresent,
    String? finalGradeWithoutOptional,
    int? finalPointWithoutOptional,
    int? id,
    String? rawObtainMarksPercentage,
    int? sumOfObtainPercentTotalMarks,
    int? sumOfObtainRawTotalMarks,
    int? sumOfRawTotalMarks,
    int? sumOfObtainTotalMarksForShow,
    String? sumOfObtainTotalPercentForShow,
    dynamic academicDays,
    dynamic presentDays,
    dynamic absentDays,
    dynamic behaviour,
    dynamic culturalActivities,
    dynamic bncc,
    dynamic debate,
    dynamic scout,
    dynamic sports,
    dynamic others,
  }) =>
      StuResultDetailsModel(
        academicResultPrimaryTypeId:
            academicResultPrimaryTypeId ?? this.academicResultPrimaryTypeId,
        resultTypeName: resultTypeName ?? this.resultTypeName,
        studentHistoryId: studentHistoryId ?? this.studentHistoryId,
        failSubjectCount: failSubjectCount ?? this.failSubjectCount,
        gpa: gpa ?? this.gpa,
        grade: grade ?? this.grade,
        studentRank: studentRank ?? this.studentRank,
        siteResultPrimarySettingId:
            siteResultPrimarySettingId ?? this.siteResultPrimarySettingId,
        subjectList: subjectList ?? this.subjectList,
        tableHeader: tableHeader ?? this.tableHeader,
        highestMarks: highestMarks ?? this.highestMarks,
        studentHistory: studentHistory ?? this.studentHistory,
        resultTypeId: resultTypeId ?? this.resultTypeId,
        resultShowInTableBellowStatusPresent:
            resultShowInTableBellowStatusPresent ??
                this.resultShowInTableBellowStatusPresent,
        totalStudent: totalStudent ?? this.totalStudent,
        studentPhoto: studentPhoto ?? this.studentPhoto,
        classtestIsPresent: classtestIsPresent ?? this.classtestIsPresent,
        combineSubjectPresent:
            combineSubjectPresent ?? this.combineSubjectPresent,
        finalGradeWithoutOptional:
            finalGradeWithoutOptional ?? this.finalGradeWithoutOptional,
        finalPointWithoutOptional:
            finalPointWithoutOptional ?? this.finalPointWithoutOptional,
        id: id ?? this.id,
        rawObtainMarksPercentage:
            rawObtainMarksPercentage ?? this.rawObtainMarksPercentage,
        sumOfObtainPercentTotalMarks:
            sumOfObtainPercentTotalMarks ?? this.sumOfObtainPercentTotalMarks,
        sumOfObtainRawTotalMarks:
            sumOfObtainRawTotalMarks ?? this.sumOfObtainRawTotalMarks,
        sumOfRawTotalMarks: sumOfRawTotalMarks ?? this.sumOfRawTotalMarks,
        sumOfObtainTotalMarksForShow:
            sumOfObtainTotalMarksForShow ?? this.sumOfObtainTotalMarksForShow,
        sumOfObtainTotalPercentForShow: sumOfObtainTotalPercentForShow ??
            this.sumOfObtainTotalPercentForShow,
        academicDays: academicDays ?? this.academicDays,
        presentDays: presentDays ?? this.presentDays,
        absentDays: absentDays ?? this.absentDays,
        behaviour: behaviour ?? this.behaviour,
        culturalActivities: culturalActivities ?? this.culturalActivities,
        bncc: bncc ?? this.bncc,
        debate: debate ?? this.debate,
        scout: scout ?? this.scout,
        sports: sports ?? this.sports,
        others: others ?? this.others,
      );

  factory StuResultDetailsModel.fromJson(String str) =>
      StuResultDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StuResultDetailsModel.fromMap(Map<String, dynamic> json) =>
      StuResultDetailsModel(
        academicResultPrimaryTypeId: json["academic_result_primary_type_id"],
        resultTypeName: json["result_type_name"],
        studentHistoryId: json["student_history_id"],
        failSubjectCount: json["fail_subject_count"],
        gpa: json["gpa"]?.toDouble(),
        grade: json["grade"],
        studentRank: json["student_rank"],
        siteResultPrimarySettingId: json["site_result_primary_setting_id"],
        subjectList: json["subject_list"] == null
            ? []
            : List<SubjectList>.from(
                json["subject_list"]!.map((x) => SubjectList.fromMap(x))),
        tableHeader: json["table_header"] == null
            ? []
            : List<TableHeader>.from(
                json["table_header"]!.map((x) => TableHeader.fromMap(x))),
        highestMarks: Map.from(json["highest_marks"]!).map(
            (k, v) => MapEntry<String, HighestMark>(k, HighestMark.fromMap(v))),
        studentHistory: json["student_history"] == null
            ? null
            : StudentHistory.fromMap(json["student_history"]),
        resultTypeId: json["result_type_id"],
        resultShowInTableBellowStatusPresent:
            json["result_show_in_table_bellow_status_present"],
        totalStudent: json["total_student"],
        studentPhoto: json["student_photo"],
        classtestIsPresent: json["classtest_is_present"],
        combineSubjectPresent: json["combine_subject_present"],
        finalGradeWithoutOptional: json["final_grade_without_optional"],
        finalPointWithoutOptional: json["final_point_without_optional"],
        id: json["id"],
        rawObtainMarksPercentage: json["raw_obtain_marks_percentage"],
        sumOfObtainPercentTotalMarks: json["sum_of_obtain_percent_total_marks"],
        sumOfObtainRawTotalMarks: json["sum_of_obtain_raw_total_marks"],
        sumOfRawTotalMarks: json["sum_of_raw_total_marks"],
        sumOfObtainTotalMarksForShow:
            json["sum_of_obtain_total_marks_for_show"],
        sumOfObtainTotalPercentForShow:
            json["sum_of_obtain_total_percent_for_show"],
        academicDays: json["academic_days"],
        presentDays: json["present_days"],
        absentDays: json["absent_days"],
        behaviour: json["behaviour"],
        culturalActivities: json["cultural_activities"],
        bncc: json["bncc"],
        debate: json["debate"],
        scout: json["scout"],
        sports: json["sports"],
        others: json["others"],
      );

  Map<String, dynamic> toMap() => {
        "academic_result_primary_type_id": academicResultPrimaryTypeId,
        "result_type_name": resultTypeName,
        "student_history_id": studentHistoryId,
        "fail_subject_count": failSubjectCount,
        "gpa": gpa,
        "grade": grade,
        "student_rank": studentRank,
        "site_result_primary_setting_id": siteResultPrimarySettingId,
        "subject_list": subjectList == null
            ? []
            : List<dynamic>.from(subjectList!.map((x) => x.toMap())),
        "table_header": tableHeader == null
            ? []
            : List<dynamic>.from(tableHeader!.map((x) => x.toMap())),
        "highest_marks": Map.from(highestMarks!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "student_history": studentHistory?.toMap(),
        "result_type_id": resultTypeId,
        "result_show_in_table_bellow_status_present":
            resultShowInTableBellowStatusPresent,
        "total_student": totalStudent,
        "student_photo": studentPhoto,
        "classtest_is_present": classtestIsPresent,
        "combine_subject_present": combineSubjectPresent,
        "final_grade_without_optional": finalGradeWithoutOptional,
        "final_point_without_optional": finalPointWithoutOptional,
        "id": id,
        "raw_obtain_marks_percentage": rawObtainMarksPercentage,
        "sum_of_obtain_percent_total_marks": sumOfObtainPercentTotalMarks,
        "sum_of_obtain_raw_total_marks": sumOfObtainRawTotalMarks,
        "sum_of_raw_total_marks": sumOfRawTotalMarks,
        "sum_of_obtain_total_marks_for_show": sumOfObtainTotalMarksForShow,
        "sum_of_obtain_total_percent_for_show": sumOfObtainTotalPercentForShow,
        "academic_days": academicDays,
        "present_days": presentDays,
        "absent_days": absentDays,
        "behaviour": behaviour,
        "cultural_activities": culturalActivities,
        "bncc": bncc,
        "debate": debate,
        "scout": scout,
        "sports": sports,
        "others": others,
      };
}

class HighestMark {
  final int? examDependentAcademicSubjectId;
  final int? obtainRawTotalMarks;

  HighestMark({
    this.examDependentAcademicSubjectId,
    this.obtainRawTotalMarks,
  });

  HighestMark copyWith({
    int? examDependentAcademicSubjectId,
    int? obtainRawTotalMarks,
  }) =>
      HighestMark(
        examDependentAcademicSubjectId: examDependentAcademicSubjectId ??
            this.examDependentAcademicSubjectId,
        obtainRawTotalMarks: obtainRawTotalMarks ?? this.obtainRawTotalMarks,
      );

  factory HighestMark.fromJson(String str) =>
      HighestMark.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HighestMark.fromMap(Map<String, dynamic> json) => HighestMark(
        examDependentAcademicSubjectId:
            json["exam_dependent_academic_subject_id"],
        obtainRawTotalMarks: json["obtain_raw_total_marks"],
      );

  Map<String, dynamic> toMap() => {
        "exam_dependent_academic_subject_id": examDependentAcademicSubjectId,
        "obtain_raw_total_marks": obtainRawTotalMarks,
      };
}

class StudentHistory {
  final int? id;
  final int? userId;
  final int? academicShiftId;
  final int? academicClassId;
  final dynamic academicDepartmentId;
  final int? academicSessionId;
  final int? academicStudentCategoryId;
  final dynamic boardRegistrationNumber;
  final int? academicClassGroupId;
  final int? academicSectionId;
  final int? academicYearId;
  final int? studentRollNumber;
  final dynamic registrationNo;
  final String? fullName;
  final String? studentFullRollNumber;
  final Student? student;
  final Year? year;
  final Shift? shift;
  final dynamic department;
  final StClass? stClass;
  final ClassGroup? classGroup;
  final Session? session;
  final dynamic section;

  StudentHistory({
    this.id,
    this.userId,
    this.academicShiftId,
    this.academicClassId,
    this.academicDepartmentId,
    this.academicSessionId,
    this.academicStudentCategoryId,
    this.boardRegistrationNumber,
    this.academicClassGroupId,
    this.academicSectionId,
    this.academicYearId,
    this.studentRollNumber,
    this.registrationNo,
    this.fullName,
    this.studentFullRollNumber,
    this.student,
    this.year,
    this.shift,
    this.department,
    this.stClass,
    this.classGroup,
    this.session,
    this.section,
  });

  StudentHistory copyWith({
    int? id,
    int? userId,
    int? academicShiftId,
    int? academicClassId,
    dynamic academicDepartmentId,
    int? academicSessionId,
    int? academicStudentCategoryId,
    dynamic boardRegistrationNumber,
    int? academicClassGroupId,
    int? academicSectionId,
    int? academicYearId,
    int? studentRollNumber,
    dynamic registrationNo,
    String? fullName,
    String? studentFullRollNumber,
    Student? student,
    Year? year,
    Shift? shift,
    dynamic department,
    StClass? stClass,
    ClassGroup? classGroup,
    Session? session,
    dynamic section,
  }) =>
      StudentHistory(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        academicShiftId: academicShiftId ?? this.academicShiftId,
        academicClassId: academicClassId ?? this.academicClassId,
        academicDepartmentId: academicDepartmentId ?? this.academicDepartmentId,
        academicSessionId: academicSessionId ?? this.academicSessionId,
        academicStudentCategoryId:
            academicStudentCategoryId ?? this.academicStudentCategoryId,
        boardRegistrationNumber:
            boardRegistrationNumber ?? this.boardRegistrationNumber,
        academicClassGroupId: academicClassGroupId ?? this.academicClassGroupId,
        academicSectionId: academicSectionId ?? this.academicSectionId,
        academicYearId: academicYearId ?? this.academicYearId,
        studentRollNumber: studentRollNumber ?? this.studentRollNumber,
        registrationNo: registrationNo ?? this.registrationNo,
        fullName: fullName ?? this.fullName,
        studentFullRollNumber:
            studentFullRollNumber ?? this.studentFullRollNumber,
        student: student ?? this.student,
        year: year ?? this.year,
        shift: shift ?? this.shift,
        department: department ?? this.department,
        stClass: stClass ?? this.stClass,
        classGroup: classGroup ?? this.classGroup,
        session: session ?? this.session,
        section: section ?? this.section,
      );

  factory StudentHistory.fromJson(String str) =>
      StudentHistory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StudentHistory.fromMap(Map<String, dynamic> json) => StudentHistory(
        id: json["id"],
        userId: json["user_id"],
        academicShiftId: json["academic_shift_id"],
        academicClassId: json["academic_class_id"],
        academicDepartmentId: json["academic_department_id"],
        academicSessionId: json["academic_session_id"],
        academicStudentCategoryId: json["academic_student_category_id"],
        boardRegistrationNumber: json["board_registration_number"],
        academicClassGroupId: json["academic_class_group_id"],
        academicSectionId: json["academic_section_id"],
        academicYearId: json["academic_year_id"],
        studentRollNumber: json["student_roll_number"],
        registrationNo: json["registration_no"],
        fullName: json["full_name"],
        studentFullRollNumber: json["student_full_roll_number"],
        student:
            json["student"] == null ? null : Student.fromMap(json["student"]),
        year: json["year"] == null ? null : Year.fromMap(json["year"]),
        shift: json["shift"] == null ? null : Shift.fromMap(json["shift"]),
        department: json["department"],
        stClass:
            json["st_class"] == null ? null : StClass.fromMap(json["st_class"]),
        classGroup: json["class_group"] == null
            ? null
            : ClassGroup.fromMap(json["class_group"]),
        session:
            json["session"] == null ? null : Session.fromMap(json["session"]),
        section: json["section"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "academic_shift_id": academicShiftId,
        "academic_class_id": academicClassId,
        "academic_department_id": academicDepartmentId,
        "academic_session_id": academicSessionId,
        "academic_student_category_id": academicStudentCategoryId,
        "board_registration_number": boardRegistrationNumber,
        "academic_class_group_id": academicClassGroupId,
        "academic_section_id": academicSectionId,
        "academic_year_id": academicYearId,
        "student_roll_number": studentRollNumber,
        "registration_no": registrationNo,
        "full_name": fullName,
        "student_full_roll_number": studentFullRollNumber,
        "student": student?.toMap(),
        "year": year?.toMap(),
        "shift": shift?.toMap(),
        "department": department,
        "st_class": stClass?.toMap(),
        "class_group": classGroup?.toMap(),
        "session": session?.toMap(),
        "section": section,
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

  factory ClassGroup.fromJson(String str) =>
      ClassGroup.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ClassGroup.fromMap(Map<String, dynamic> json) => ClassGroup(
        id: json["id"],
        groupName: json["group_name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
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

class Session {
  final int? id;
  final String? sessionName;
  final int? serialNo;
  final int? status;
  final dynamic createdAt;
  final dynamic updatedAt;

  Session({
    this.id,
    this.sessionName,
    this.serialNo,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Session copyWith({
    int? id,
    String? sessionName,
    int? serialNo,
    int? status,
    dynamic createdAt,
    dynamic updatedAt,
  }) =>
      Session(
        id: id ?? this.id,
        sessionName: sessionName ?? this.sessionName,
        serialNo: serialNo ?? this.serialNo,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Session.fromJson(String str) => Session.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Session.fromMap(Map<String, dynamic> json) => Session(
        id: json["id"],
        sessionName: json["session_name"],
        serialNo: json["serial_no"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "session_name": sessionName,
        "serial_no": serialNo,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Shift {
  final int? id;
  final int? status;
  final dynamic createdAt;
  final dynamic updatedAt;
  final String? shiftName;
  final List<ShiftTranslation>? translations;

  Shift({
    this.id,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.shiftName,
    this.translations,
  });

  Shift copyWith({
    int? id,
    int? status,
    dynamic createdAt,
    dynamic updatedAt,
    String? shiftName,
    List<ShiftTranslation>? translations,
  }) =>
      Shift(
        id: id ?? this.id,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        shiftName: shiftName ?? this.shiftName,
        translations: translations ?? this.translations,
      );

  factory Shift.fromJson(String str) => Shift.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Shift.fromMap(Map<String, dynamic> json) => Shift(
        id: json["id"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        shiftName: json["shift_name"],
        translations: json["translations"] == null
            ? []
            : List<ShiftTranslation>.from(
                json["translations"]!.map((x) => ShiftTranslation.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "shift_name": shiftName,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toMap())),
      };
}

class ShiftTranslation {
  final int? id;
  final int? academicShiftId;
  final String? shiftName;
  final String? locale;
  final dynamic createdAt;
  final dynamic updatedAt;

  ShiftTranslation({
    this.id,
    this.academicShiftId,
    this.shiftName,
    this.locale,
    this.createdAt,
    this.updatedAt,
  });

  ShiftTranslation copyWith({
    int? id,
    int? academicShiftId,
    String? shiftName,
    String? locale,
    dynamic createdAt,
    dynamic updatedAt,
  }) =>
      ShiftTranslation(
        id: id ?? this.id,
        academicShiftId: academicShiftId ?? this.academicShiftId,
        shiftName: shiftName ?? this.shiftName,
        locale: locale ?? this.locale,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ShiftTranslation.fromJson(String str) =>
      ShiftTranslation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShiftTranslation.fromMap(Map<String, dynamic> json) =>
      ShiftTranslation(
        id: json["id"],
        academicShiftId: json["academic_shift_id"],
        shiftName: json["shift_name"],
        locale: json["locale"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "academic_shift_id": academicShiftId,
        "shift_name": shiftName,
        "locale": locale,
        "created_at": createdAt,
        "updated_at": updatedAt,
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

class Student {
  final int? id;
  final String? fullName;
  final String? studentFullRollNumber;
  final String? firstName;
  final dynamic lastName;
  final String? address;
  final dynamic spouseName;
  final String? motherName;
  final String? fatherName;
  final String? permanentAddress;
  final LatestPhoto? latestPhoto;
  final List<StudentTranslation>? translations;

  Student({
    this.id,
    this.fullName,
    this.studentFullRollNumber,
    this.firstName,
    this.lastName,
    this.address,
    this.spouseName,
    this.motherName,
    this.fatherName,
    this.permanentAddress,
    this.latestPhoto,
    this.translations,
  });

  Student copyWith({
    int? id,
    String? fullName,
    String? studentFullRollNumber,
    String? firstName,
    dynamic lastName,
    String? address,
    dynamic spouseName,
    String? motherName,
    String? fatherName,
    String? permanentAddress,
    LatestPhoto? latestPhoto,
    List<StudentTranslation>? translations,
  }) =>
      Student(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        studentFullRollNumber:
            studentFullRollNumber ?? this.studentFullRollNumber,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        address: address ?? this.address,
        spouseName: spouseName ?? this.spouseName,
        motherName: motherName ?? this.motherName,
        fatherName: fatherName ?? this.fatherName,
        permanentAddress: permanentAddress ?? this.permanentAddress,
        latestPhoto: latestPhoto ?? this.latestPhoto,
        translations: translations ?? this.translations,
      );

  factory Student.fromJson(String str) => Student.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Student.fromMap(Map<String, dynamic> json) => Student(
        id: json["id"],
        fullName: json["full_name"],
        studentFullRollNumber: json["student_full_roll_number"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        address: json["address"],
        spouseName: json["spouse_name"],
        motherName: json["mother_name"],
        fatherName: json["father_name"],
        permanentAddress: json["permanent_address"],
        latestPhoto: json["latest_photo"] == null
            ? null
            : LatestPhoto.fromMap(json["latest_photo"]),
        translations: json["translations"] == null
            ? []
            : List<StudentTranslation>.from(json["translations"]!
                .map((x) => StudentTranslation.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "full_name": fullName,
        "student_full_roll_number": studentFullRollNumber,
        "first_name": firstName,
        "last_name": lastName,
        "address": address,
        "spouse_name": spouseName,
        "mother_name": motherName,
        "father_name": fatherName,
        "permanent_address": permanentAddress,
        "latest_photo": latestPhoto?.toMap(),
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toMap())),
      };
}

class LatestPhoto {
  final int? id;
  final int? userId;
  final int? imageableId;
  final String? imageableType;
  final String? name;
  final String? path;
  final dynamic extension;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  LatestPhoto({
    this.id,
    this.userId,
    this.imageableId,
    this.imageableType,
    this.name,
    this.path,
    this.extension,
    this.createdAt,
    this.updatedAt,
  });

  LatestPhoto copyWith({
    int? id,
    int? userId,
    int? imageableId,
    String? imageableType,
    String? name,
    String? path,
    dynamic extension,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      LatestPhoto(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        imageableId: imageableId ?? this.imageableId,
        imageableType: imageableType ?? this.imageableType,
        name: name ?? this.name,
        path: path ?? this.path,
        extension: extension ?? this.extension,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory LatestPhoto.fromJson(String str) =>
      LatestPhoto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LatestPhoto.fromMap(Map<String, dynamic> json) => LatestPhoto(
        id: json["id"],
        userId: json["user_id"],
        imageableId: json["imageable_id"],
        imageableType: json["imageable_type"],
        name: json["name"],
        path: json["path"],
        extension: json["extension"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "imageable_id": imageableId,
        "imageable_type": imageableType,
        "name": name,
        "path": path,
        "extension": extension,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class StudentTranslation {
  final int? id;
  final int? userId;
  final String? firstName;
  final dynamic lastName;
  final String? fatherName;
  final String? motherName;
  final dynamic spouseName;
  final String? address;
  final String? permanentAddress;
  final String? locale;
  final dynamic localGuardianName;

  StudentTranslation({
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.fatherName,
    this.motherName,
    this.spouseName,
    this.address,
    this.permanentAddress,
    this.locale,
    this.localGuardianName,
  });

  StudentTranslation copyWith({
    int? id,
    int? userId,
    String? firstName,
    dynamic lastName,
    String? fatherName,
    String? motherName,
    dynamic spouseName,
    String? address,
    String? permanentAddress,
    String? locale,
    dynamic localGuardianName,
  }) =>
      StudentTranslation(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        fatherName: fatherName ?? this.fatherName,
        motherName: motherName ?? this.motherName,
        spouseName: spouseName ?? this.spouseName,
        address: address ?? this.address,
        permanentAddress: permanentAddress ?? this.permanentAddress,
        locale: locale ?? this.locale,
        localGuardianName: localGuardianName ?? this.localGuardianName,
      );

  factory StudentTranslation.fromJson(String str) =>
      StudentTranslation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StudentTranslation.fromMap(Map<String, dynamic> json) =>
      StudentTranslation(
        id: json["id"],
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        fatherName: json["father_name"],
        motherName: json["mother_name"],
        spouseName: json["spouse_name"],
        address: json["address"],
        permanentAddress: json["permanent_address"],
        locale: json["locale"],
        localGuardianName: json["local_guardian_name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "father_name": fatherName,
        "mother_name": motherName,
        "spouse_name": spouseName,
        "address": address,
        "permanent_address": permanentAddress,
        "locale": locale,
        "local_guardian_name": localGuardianName,
      };
}

class Year {
  final int? id;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? yearName;
  final int? serialNo;
  final int? siteId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? status;

  Year({
    this.id,
    this.startDate,
    this.endDate,
    this.yearName,
    this.serialNo,
    this.siteId,
    this.createdAt,
    this.updatedAt,
    this.status,
  });

  Year copyWith({
    int? id,
    DateTime? startDate,
    DateTime? endDate,
    String? yearName,
    int? serialNo,
    int? siteId,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? status,
  }) =>
      Year(
        id: id ?? this.id,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        yearName: yearName ?? this.yearName,
        serialNo: serialNo ?? this.serialNo,
        siteId: siteId ?? this.siteId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        status: status ?? this.status,
      );

  factory Year.fromJson(String str) => Year.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Year.fromMap(Map<String, dynamic> json) => Year(
        id: json["id"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        yearName: json["year_name"],
        serialNo: json["serial_no"],
        siteId: json["site_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "year_name": yearName,
        "serial_no": serialNo,
        "site_id": siteId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "status": status,
      };
}

class SubjectList {
  final int? obtainTotalMarksInTermExamForShow;
  final int? obtainTotalMarksInClassTestForShow;
  final int? obtainTotalMarksForShow;
  final int? totalMarksInTermExam;
  final int? totalMarksInClassTest;
  final int? obtainRawTotalMarksInTermExam;
  final int? obtainRawTotalMarksInClassTest;
  final int? obtainTotalMarksInTermExam;
  final int? obtainTotalMarksInClassTest;
  final int? obtainRawTotalMarks;
  final int? obtainPercentTotalMarks;
  final int? rawTotalMarks;
  final int? examDependentAcademicSubjectId;
  final int? subjectPosition;
  final String? examDependentAcademicSubject;
  final String? subjectCode;
  final int? dependentOptionalAcademicSubjectStatus;
  final double? subjectCountablePoint;
  final int? resultShowInTableBellowStatus;
  final int? subjectBasePassFailStatus;
  final int? obtainSubjectTotalMarks;
  final int? subjectMarksPercentage;
  final double? subjectPoint;
  final String? subjectGrade;
  final List<IndivisualStudentSubjectList>? indivisualStudentSubjectList;
  final int? subjectCount;
  final List<DependentSubjectListElement>? dependentSubjectList;

  SubjectList({
    this.obtainTotalMarksInTermExamForShow,
    this.obtainTotalMarksInClassTestForShow,
    this.obtainTotalMarksForShow,
    this.totalMarksInTermExam,
    this.totalMarksInClassTest,
    this.obtainRawTotalMarksInTermExam,
    this.obtainRawTotalMarksInClassTest,
    this.obtainTotalMarksInTermExam,
    this.obtainTotalMarksInClassTest,
    this.obtainRawTotalMarks,
    this.obtainPercentTotalMarks,
    this.rawTotalMarks,
    this.examDependentAcademicSubjectId,
    this.subjectPosition,
    this.examDependentAcademicSubject,
    this.subjectCode,
    this.dependentOptionalAcademicSubjectStatus,
    this.subjectCountablePoint,
    this.resultShowInTableBellowStatus,
    this.subjectBasePassFailStatus,
    this.obtainSubjectTotalMarks,
    this.subjectMarksPercentage,
    this.subjectPoint,
    this.subjectGrade,
    this.indivisualStudentSubjectList,
    this.subjectCount,
    this.dependentSubjectList,
  });

  SubjectList copyWith({
    int? obtainTotalMarksInTermExamForShow,
    int? obtainTotalMarksInClassTestForShow,
    int? obtainTotalMarksForShow,
    int? totalMarksInTermExam,
    int? totalMarksInClassTest,
    int? obtainRawTotalMarksInTermExam,
    int? obtainRawTotalMarksInClassTest,
    int? obtainTotalMarksInTermExam,
    int? obtainTotalMarksInClassTest,
    int? obtainRawTotalMarks,
    int? obtainPercentTotalMarks,
    int? rawTotalMarks,
    int? examDependentAcademicSubjectId,
    int? subjectPosition,
    String? examDependentAcademicSubject,
    String? subjectCode,
    int? dependentOptionalAcademicSubjectStatus,
    double? subjectCountablePoint,
    int? resultShowInTableBellowStatus,
    int? subjectBasePassFailStatus,
    int? obtainSubjectTotalMarks,
    int? subjectMarksPercentage,
    double? subjectPoint,
    String? subjectGrade,
    List<IndivisualStudentSubjectList>? indivisualStudentSubjectList,
    int? subjectCount,
    List<DependentSubjectListElement>? dependentSubjectList,
  }) =>
      SubjectList(
        obtainTotalMarksInTermExamForShow: obtainTotalMarksInTermExamForShow ??
            this.obtainTotalMarksInTermExamForShow,
        obtainTotalMarksInClassTestForShow:
            obtainTotalMarksInClassTestForShow ??
                this.obtainTotalMarksInClassTestForShow,
        obtainTotalMarksForShow:
            obtainTotalMarksForShow ?? this.obtainTotalMarksForShow,
        totalMarksInTermExam: totalMarksInTermExam ?? this.totalMarksInTermExam,
        totalMarksInClassTest:
            totalMarksInClassTest ?? this.totalMarksInClassTest,
        obtainRawTotalMarksInTermExam:
            obtainRawTotalMarksInTermExam ?? this.obtainRawTotalMarksInTermExam,
        obtainRawTotalMarksInClassTest: obtainRawTotalMarksInClassTest ??
            this.obtainRawTotalMarksInClassTest,
        obtainTotalMarksInTermExam:
            obtainTotalMarksInTermExam ?? this.obtainTotalMarksInTermExam,
        obtainTotalMarksInClassTest:
            obtainTotalMarksInClassTest ?? this.obtainTotalMarksInClassTest,
        obtainRawTotalMarks: obtainRawTotalMarks ?? this.obtainRawTotalMarks,
        obtainPercentTotalMarks:
            obtainPercentTotalMarks ?? this.obtainPercentTotalMarks,
        rawTotalMarks: rawTotalMarks ?? this.rawTotalMarks,
        examDependentAcademicSubjectId: examDependentAcademicSubjectId ??
            this.examDependentAcademicSubjectId,
        subjectPosition: subjectPosition ?? this.subjectPosition,
        examDependentAcademicSubject:
            examDependentAcademicSubject ?? this.examDependentAcademicSubject,
        subjectCode: subjectCode ?? this.subjectCode,
        dependentOptionalAcademicSubjectStatus:
            dependentOptionalAcademicSubjectStatus ??
                this.dependentOptionalAcademicSubjectStatus,
        subjectCountablePoint:
            subjectCountablePoint ?? this.subjectCountablePoint,
        resultShowInTableBellowStatus:
            resultShowInTableBellowStatus ?? this.resultShowInTableBellowStatus,
        subjectBasePassFailStatus:
            subjectBasePassFailStatus ?? this.subjectBasePassFailStatus,
        obtainSubjectTotalMarks:
            obtainSubjectTotalMarks ?? this.obtainSubjectTotalMarks,
        subjectMarksPercentage:
            subjectMarksPercentage ?? this.subjectMarksPercentage,
        subjectPoint: subjectPoint ?? this.subjectPoint,
        subjectGrade: subjectGrade ?? this.subjectGrade,
        indivisualStudentSubjectList:
            indivisualStudentSubjectList ?? this.indivisualStudentSubjectList,
        subjectCount: subjectCount ?? this.subjectCount,
        dependentSubjectList: dependentSubjectList ?? this.dependentSubjectList,
      );

  factory SubjectList.fromJson(String str) =>
      SubjectList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubjectList.fromMap(Map<String, dynamic> json) => SubjectList(
        obtainTotalMarksInTermExamForShow:
            json["obtain_total_marks_in_term_exam_for_show"],
        obtainTotalMarksInClassTestForShow:
            json["obtain_total_marks_in_class_test_for_show"],
        obtainTotalMarksForShow: json["obtain_total_marks_for_show"],
        totalMarksInTermExam: json["total_marks_in_term_exam"],
        totalMarksInClassTest: json["total_marks_in_class_test"],
        obtainRawTotalMarksInTermExam:
            json["obtain_raw_total_marks_in_term_exam"],
        obtainRawTotalMarksInClassTest:
            json["obtain_raw_total_marks_in_class_test"],
        obtainTotalMarksInTermExam: json["obtain_total_marks_in_term_exam"],
        obtainTotalMarksInClassTest: json["obtain_total_marks_in_class_test"],
        obtainRawTotalMarks: json["obtain_raw_total_marks"],
        obtainPercentTotalMarks: json["obtain_percent_total_marks"],
        rawTotalMarks: json["raw_total_marks"],
        examDependentAcademicSubjectId:
            json["exam_dependent_academic_subject_id"],
        subjectPosition: json["subject_position"],
        examDependentAcademicSubject: json["exam_dependent_academic_subject"],
        subjectCode: json["subject_code"],
        dependentOptionalAcademicSubjectStatus:
            json["dependent_optional_academic_subject_status"],
        subjectCountablePoint: json["subject_countable_point"]?.toDouble(),
        resultShowInTableBellowStatus:
            json["result_show_in_table_bellow_status"],
        subjectBasePassFailStatus: json["subject_base_pass_fail_status"],
        obtainSubjectTotalMarks: json["obtain_subject_total_marks"],
        subjectMarksPercentage: json["subject_marks_percentage"],
        subjectPoint: json["subject_point"]?.toDouble(),
        subjectGrade: json["subject_grade"],
        indivisualStudentSubjectList:
            json["indivisual_student_subject_list"] == null
                ? []
                : List<IndivisualStudentSubjectList>.from(
                    json["indivisual_student_subject_list"]!
                        .map((x) => IndivisualStudentSubjectList.fromMap(x))),
        subjectCount: json["subject_count"],
        dependentSubjectList: json["dependent_subject_list"] == null
            ? []
            : List<DependentSubjectListElement>.from(
                json["dependent_subject_list"]!
                    .map((x) => DependentSubjectListElement.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "obtain_total_marks_in_term_exam_for_show":
            obtainTotalMarksInTermExamForShow,
        "obtain_total_marks_in_class_test_for_show":
            obtainTotalMarksInClassTestForShow,
        "obtain_total_marks_for_show": obtainTotalMarksForShow,
        "total_marks_in_term_exam": totalMarksInTermExam,
        "total_marks_in_class_test": totalMarksInClassTest,
        "obtain_raw_total_marks_in_term_exam": obtainRawTotalMarksInTermExam,
        "obtain_raw_total_marks_in_class_test": obtainRawTotalMarksInClassTest,
        "obtain_total_marks_in_term_exam": obtainTotalMarksInTermExam,
        "obtain_total_marks_in_class_test": obtainTotalMarksInClassTest,
        "obtain_raw_total_marks": obtainRawTotalMarks,
        "obtain_percent_total_marks": obtainPercentTotalMarks,
        "raw_total_marks": rawTotalMarks,
        "exam_dependent_academic_subject_id": examDependentAcademicSubjectId,
        "subject_position": subjectPosition,
        "exam_dependent_academic_subject": examDependentAcademicSubject,
        "subject_code": subjectCode,
        "dependent_optional_academic_subject_status":
            dependentOptionalAcademicSubjectStatus,
        "subject_countable_point": subjectCountablePoint,
        "result_show_in_table_bellow_status": resultShowInTableBellowStatus,
        "subject_base_pass_fail_status": subjectBasePassFailStatus,
        "obtain_subject_total_marks": obtainSubjectTotalMarks,
        "subject_marks_percentage": subjectMarksPercentage,
        "subject_point": subjectPoint,
        "subject_grade": subjectGrade,
        "indivisual_student_subject_list": indivisualStudentSubjectList == null
            ? []
            : List<dynamic>.from(
                indivisualStudentSubjectList!.map((x) => x.toMap())),
        "subject_count": subjectCount,
        "dependent_subject_list": dependentSubjectList == null
            ? []
            : List<dynamic>.from(dependentSubjectList!.map((x) => x.toMap())),
      };
}

class DependentSubjectListElement {
  final int? examinationId;
  final int? id;
  final int? examinationMarks;
  final int? examinationPassMarks;
  final int? subjectIndivisualPassFailStatus;
  final List<ExamTypeList>? examTypeList;
  final int? obtaineTotalMarks;
  final int? examHeldStatus;
  final ExaminationName? examinationName;
  final NameKey? examinationNameKey;
  final dynamic marksPercentage;
  final int? showPosition;
  final int? countableDependentObtainExamTypeMarks;
  final int? countableDependentObtainExamTypeMarksForShow;

  DependentSubjectListElement({
    this.examinationId,
    this.id,
    this.examinationMarks,
    this.examinationPassMarks,
    this.subjectIndivisualPassFailStatus,
    this.examTypeList,
    this.obtaineTotalMarks,
    this.examHeldStatus,
    this.examinationName,
    this.examinationNameKey,
    this.marksPercentage,
    this.showPosition,
    this.countableDependentObtainExamTypeMarks,
    this.countableDependentObtainExamTypeMarksForShow,
  });

  DependentSubjectListElement copyWith({
    int? examinationId,
    int? id,
    int? examinationMarks,
    int? examinationPassMarks,
    int? subjectIndivisualPassFailStatus,
    List<ExamTypeList>? examTypeList,
    int? obtaineTotalMarks,
    int? examHeldStatus,
    ExaminationName? examinationName,
    NameKey? examinationNameKey,
    dynamic marksPercentage,
    int? showPosition,
    int? countableDependentObtainExamTypeMarks,
    int? countableDependentObtainExamTypeMarksForShow,
  }) =>
      DependentSubjectListElement(
        examinationId: examinationId ?? this.examinationId,
        id: id ?? this.id,
        examinationMarks: examinationMarks ?? this.examinationMarks,
        examinationPassMarks: examinationPassMarks ?? this.examinationPassMarks,
        subjectIndivisualPassFailStatus: subjectIndivisualPassFailStatus ??
            this.subjectIndivisualPassFailStatus,
        examTypeList: examTypeList ?? this.examTypeList,
        obtaineTotalMarks: obtaineTotalMarks ?? this.obtaineTotalMarks,
        examHeldStatus: examHeldStatus ?? this.examHeldStatus,
        examinationName: examinationName ?? this.examinationName,
        examinationNameKey: examinationNameKey ?? this.examinationNameKey,
        marksPercentage: marksPercentage ?? this.marksPercentage,
        showPosition: showPosition ?? this.showPosition,
        countableDependentObtainExamTypeMarks:
            countableDependentObtainExamTypeMarks ??
                this.countableDependentObtainExamTypeMarks,
        countableDependentObtainExamTypeMarksForShow:
            countableDependentObtainExamTypeMarksForShow ??
                this.countableDependentObtainExamTypeMarksForShow,
      );

  factory DependentSubjectListElement.fromJson(String str) =>
      DependentSubjectListElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DependentSubjectListElement.fromMap(Map<String, dynamic> json) =>
      DependentSubjectListElement(
        examinationId: json["examination_id"],
        id: json["id"],
        examinationMarks: json["examination_marks"],
        examinationPassMarks: json["examination_pass_marks"],
        subjectIndivisualPassFailStatus:
            json["subject_indivisual_pass_fail_status"],
        examTypeList: json["exam_type_list"] == null
            ? []
            : List<ExamTypeList>.from(
                json["exam_type_list"]!.map((x) => ExamTypeList.fromMap(x))),
        obtaineTotalMarks: json["obtaine_total_marks"],
        examHeldStatus: json["exam_held_status"],
        examinationName: examinationNameValues.map[json["examination_name"]]!,
        examinationNameKey: nameKeyValues.map[json["examination_name_key"]]!,
        marksPercentage: json["marks_percentage"],
        showPosition: json["show_position"],
        countableDependentObtainExamTypeMarks:
            json["countable_dependent_obtain_exam_type_marks"],
        countableDependentObtainExamTypeMarksForShow:
            json["countable_dependent_obtain_exam_type_marks_for_show"],
      );

  Map<String, dynamic> toMap() => {
        "examination_id": examinationId,
        "id": id,
        "examination_marks": examinationMarks,
        "examination_pass_marks": examinationPassMarks,
        "subject_indivisual_pass_fail_status": subjectIndivisualPassFailStatus,
        "exam_type_list": examTypeList == null
            ? []
            : List<dynamic>.from(examTypeList!.map((x) => x.toMap())),
        "obtaine_total_marks": obtaineTotalMarks,
        "exam_held_status": examHeldStatus,
        "examination_name": examinationNameValues.reverse[examinationName],
        "examination_name_key": nameKeyValues.reverse[examinationNameKey],
        "marks_percentage": marksPercentage,
        "show_position": showPosition,
        "countable_dependent_obtain_exam_type_marks":
            countableDependentObtainExamTypeMarks,
        "countable_dependent_obtain_exam_type_marks_for_show":
            countableDependentObtainExamTypeMarksForShow,
      };
}

class ExamTypeList {
  final int? academicExamTypeId;
  final MarksType? academicExamTypeName;
  final int? examinationId;
  final int? id;
  final int? obtaineMarks;
  final int? passMark;
  final int? primaryPassFailStatus;
  final int? siteSubjectGroupConditionSettingId;
  final int? studentHistoryId;
  final int? subjectExamTypeMark;
  final bool? examHeldStatus;
  final bool? examAttendanceStatus;
  final bool? examExistStatus;

  ExamTypeList({
    this.academicExamTypeId,
    this.academicExamTypeName,
    this.examinationId,
    this.id,
    this.obtaineMarks,
    this.passMark,
    this.primaryPassFailStatus,
    this.siteSubjectGroupConditionSettingId,
    this.studentHistoryId,
    this.subjectExamTypeMark,
    this.examHeldStatus,
    this.examAttendanceStatus,
    this.examExistStatus,
  });

  ExamTypeList copyWith({
    int? academicExamTypeId,
    MarksType? academicExamTypeName,
    int? examinationId,
    int? id,
    int? obtaineMarks,
    int? passMark,
    int? primaryPassFailStatus,
    int? siteSubjectGroupConditionSettingId,
    int? studentHistoryId,
    int? subjectExamTypeMark,
    bool? examHeldStatus,
    bool? examAttendanceStatus,
    bool? examExistStatus,
  }) =>
      ExamTypeList(
        academicExamTypeId: academicExamTypeId ?? this.academicExamTypeId,
        academicExamTypeName: academicExamTypeName ?? this.academicExamTypeName,
        examinationId: examinationId ?? this.examinationId,
        id: id ?? this.id,
        obtaineMarks: obtaineMarks ?? this.obtaineMarks,
        passMark: passMark ?? this.passMark,
        primaryPassFailStatus:
            primaryPassFailStatus ?? this.primaryPassFailStatus,
        siteSubjectGroupConditionSettingId:
            siteSubjectGroupConditionSettingId ??
                this.siteSubjectGroupConditionSettingId,
        studentHistoryId: studentHistoryId ?? this.studentHistoryId,
        subjectExamTypeMark: subjectExamTypeMark ?? this.subjectExamTypeMark,
        examHeldStatus: examHeldStatus ?? this.examHeldStatus,
        examAttendanceStatus: examAttendanceStatus ?? this.examAttendanceStatus,
        examExistStatus: examExistStatus ?? this.examExistStatus,
      );

  factory ExamTypeList.fromJson(String str) =>
      ExamTypeList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamTypeList.fromMap(Map<String, dynamic> json) => ExamTypeList(
        academicExamTypeId: json["academic_exam_type_id"],
        academicExamTypeName:
            marksTypeValues.map[json["academic_exam_type_name"]]!,
        examinationId: json["examination_id"],
        id: json["id"],
        obtaineMarks: json["obtaine_marks"],
        passMark: json["pass_mark"],
        primaryPassFailStatus: json["primary_pass_fail_status"],
        siteSubjectGroupConditionSettingId:
            json["site_subject_group_condition_setting_id"],
        studentHistoryId: json["student_history_id"],
        subjectExamTypeMark: json["subject_exam_type_mark"],
        examHeldStatus: json["exam_held_status"],
        examAttendanceStatus: json["exam_attendance_status"],
        examExistStatus: json["exam_exist_status"],
      );

  Map<String, dynamic> toMap() => {
        "academic_exam_type_id": academicExamTypeId,
        "academic_exam_type_name":
            marksTypeValues.reverse[academicExamTypeName],
        "examination_id": examinationId,
        "id": id,
        "obtaine_marks": obtaineMarks,
        "pass_mark": passMark,
        "primary_pass_fail_status": primaryPassFailStatus,
        "site_subject_group_condition_setting_id":
            siteSubjectGroupConditionSettingId,
        "student_history_id": studentHistoryId,
        "subject_exam_type_mark": subjectExamTypeMark,
        "exam_held_status": examHeldStatus,
        "exam_attendance_status": examAttendanceStatus,
        "exam_exist_status": examExistStatus,
      };
}

enum MarksType { MCQ, PRACTICAL, WRITTEN }

final marksTypeValues = EnumValues({
  "MCQ": MarksType.MCQ,
  "Practical": MarksType.PRACTICAL,
  "Written": MarksType.WRITTEN
});

enum ExaminationName { HALF_YEARLY_EXAM }

final examinationNameValues =
    EnumValues({"Half Yearly Exam": ExaminationName.HALF_YEARLY_EXAM});

enum NameKey { TERMEXAM }

final nameKeyValues = EnumValues({"termexam": NameKey.TERMEXAM});

class IndivisualStudentSubjectList {
  final int? totalMarksInTermExam;
  final int? totalMarksInClassTest;
  final int? obtainRawTotalMarksInTermExam;
  final int? obtainRawTotalMarksInClassTest;
  final int? obtainTotalMarksInTermExam;
  final int? obtainTotalMarksInClassTest;
  final int? obtainTotalMarksInTermExamForShow;
  final int? obtainTotalMarksInClassTestForShow;
  final int? termexamExamHeldStatus;
  final int? classtestExamHeldStatus;
  final bool? studentExamSubjectAttendanceStatus;
  final int? subjectBasePassFailStatus;
  final int? resultShowInTableBellow;
  final int? obtainSubjectTotalMarks;
  final String? subjectCode;
  final String? subjectName;
  final String? examDependentAcademicSubject;
  final String? subjectExamNameKey;
  final String? subjectExamName;
  final int? examDependentAcademicSubjectId;
  final int? academicSubjectId;
  final int? subjectPosition;
  final int? siteSubjectGroupConditionSettingId;
  final List<DependentSubjectListElement>? examinationList;
  final int? countableSubjectTotal;
  final int? optionalAcademicSubjectStatus;

  IndivisualStudentSubjectList({
    this.totalMarksInTermExam,
    this.totalMarksInClassTest,
    this.obtainRawTotalMarksInTermExam,
    this.obtainRawTotalMarksInClassTest,
    this.obtainTotalMarksInTermExam,
    this.obtainTotalMarksInClassTest,
    this.obtainTotalMarksInTermExamForShow,
    this.obtainTotalMarksInClassTestForShow,
    this.termexamExamHeldStatus,
    this.classtestExamHeldStatus,
    this.studentExamSubjectAttendanceStatus,
    this.subjectBasePassFailStatus,
    this.resultShowInTableBellow,
    this.obtainSubjectTotalMarks,
    this.subjectCode,
    this.subjectName,
    this.examDependentAcademicSubject,
    this.subjectExamNameKey,
    this.subjectExamName,
    this.examDependentAcademicSubjectId,
    this.academicSubjectId,
    this.subjectPosition,
    this.siteSubjectGroupConditionSettingId,
    this.examinationList,
    this.countableSubjectTotal,
    this.optionalAcademicSubjectStatus,
  });

  IndivisualStudentSubjectList copyWith({
    int? totalMarksInTermExam,
    int? totalMarksInClassTest,
    int? obtainRawTotalMarksInTermExam,
    int? obtainRawTotalMarksInClassTest,
    int? obtainTotalMarksInTermExam,
    int? obtainTotalMarksInClassTest,
    int? obtainTotalMarksInTermExamForShow,
    int? obtainTotalMarksInClassTestForShow,
    int? termexamExamHeldStatus,
    int? classtestExamHeldStatus,
    bool? studentExamSubjectAttendanceStatus,
    int? subjectBasePassFailStatus,
    int? resultShowInTableBellow,
    int? obtainSubjectTotalMarks,
    String? subjectCode,
    String? subjectName,
    String? examDependentAcademicSubject,
    String? subjectExamNameKey,
    String? subjectExamName,
    int? examDependentAcademicSubjectId,
    int? academicSubjectId,
    int? subjectPosition,
    int? siteSubjectGroupConditionSettingId,
    List<DependentSubjectListElement>? examinationList,
    int? countableSubjectTotal,
    int? optionalAcademicSubjectStatus,
  }) =>
      IndivisualStudentSubjectList(
        totalMarksInTermExam: totalMarksInTermExam ?? this.totalMarksInTermExam,
        totalMarksInClassTest:
            totalMarksInClassTest ?? this.totalMarksInClassTest,
        obtainRawTotalMarksInTermExam:
            obtainRawTotalMarksInTermExam ?? this.obtainRawTotalMarksInTermExam,
        obtainRawTotalMarksInClassTest: obtainRawTotalMarksInClassTest ??
            this.obtainRawTotalMarksInClassTest,
        obtainTotalMarksInTermExam:
            obtainTotalMarksInTermExam ?? this.obtainTotalMarksInTermExam,
        obtainTotalMarksInClassTest:
            obtainTotalMarksInClassTest ?? this.obtainTotalMarksInClassTest,
        obtainTotalMarksInTermExamForShow: obtainTotalMarksInTermExamForShow ??
            this.obtainTotalMarksInTermExamForShow,
        obtainTotalMarksInClassTestForShow:
            obtainTotalMarksInClassTestForShow ??
                this.obtainTotalMarksInClassTestForShow,
        termexamExamHeldStatus:
            termexamExamHeldStatus ?? this.termexamExamHeldStatus,
        classtestExamHeldStatus:
            classtestExamHeldStatus ?? this.classtestExamHeldStatus,
        studentExamSubjectAttendanceStatus:
            studentExamSubjectAttendanceStatus ??
                this.studentExamSubjectAttendanceStatus,
        subjectBasePassFailStatus:
            subjectBasePassFailStatus ?? this.subjectBasePassFailStatus,
        resultShowInTableBellow:
            resultShowInTableBellow ?? this.resultShowInTableBellow,
        obtainSubjectTotalMarks:
            obtainSubjectTotalMarks ?? this.obtainSubjectTotalMarks,
        subjectCode: subjectCode ?? this.subjectCode,
        subjectName: subjectName ?? this.subjectName,
        examDependentAcademicSubject:
            examDependentAcademicSubject ?? this.examDependentAcademicSubject,
        subjectExamNameKey: subjectExamNameKey ?? this.subjectExamNameKey,
        subjectExamName: subjectExamName ?? this.subjectExamName,
        examDependentAcademicSubjectId: examDependentAcademicSubjectId ??
            this.examDependentAcademicSubjectId,
        academicSubjectId: academicSubjectId ?? this.academicSubjectId,
        subjectPosition: subjectPosition ?? this.subjectPosition,
        siteSubjectGroupConditionSettingId:
            siteSubjectGroupConditionSettingId ??
                this.siteSubjectGroupConditionSettingId,
        examinationList: examinationList ?? this.examinationList,
        countableSubjectTotal:
            countableSubjectTotal ?? this.countableSubjectTotal,
        optionalAcademicSubjectStatus:
            optionalAcademicSubjectStatus ?? this.optionalAcademicSubjectStatus,
      );

  factory IndivisualStudentSubjectList.fromJson(String str) =>
      IndivisualStudentSubjectList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IndivisualStudentSubjectList.fromMap(Map<String, dynamic> json) =>
      IndivisualStudentSubjectList(
        totalMarksInTermExam: json["total_marks_in_term_exam"],
        totalMarksInClassTest: json["total_marks_in_class_test"],
        obtainRawTotalMarksInTermExam:
            json["obtain_raw_total_marks_in_term_exam"],
        obtainRawTotalMarksInClassTest:
            json["obtain_raw_total_marks_in_class_test"],
        obtainTotalMarksInTermExam: json["obtain_total_marks_in_term_exam"],
        obtainTotalMarksInClassTest: json["obtain_total_marks_in_class_test"],
        obtainTotalMarksInTermExamForShow:
            json["obtain_total_marks_in_term_exam_for_show"],
        obtainTotalMarksInClassTestForShow:
            json["obtain_total_marks_in_class_test_for_show"],
        termexamExamHeldStatus: json["termexam_exam_held_status"],
        classtestExamHeldStatus: json["classtest_exam_held_status"],
        studentExamSubjectAttendanceStatus:
            json["student_exam_subject_attendance_status"],
        subjectBasePassFailStatus: json["subject_base_pass_fail_status"],
        resultShowInTableBellow: json["result_show_in_table_bellow"],
        obtainSubjectTotalMarks: json["obtain_subject_total_marks"],
        subjectCode: json["subject_code"],
        subjectName: json["subject_name"],
        examDependentAcademicSubject: json["exam_dependent_academic_subject"],
        subjectExamNameKey: json["subject_exam_name_key"],
        subjectExamName: json["subject_exam_name"],
        examDependentAcademicSubjectId:
            json["exam_dependent_academic_subject_id"],
        academicSubjectId: json["academic_subject_id"],
        subjectPosition: json["subject_position"],
        siteSubjectGroupConditionSettingId:
            json["site_subject_group_condition_setting_id"],
        examinationList: json["examination_list"] == null
            ? []
            : List<DependentSubjectListElement>.from(json["examination_list"]!
                .map((x) => DependentSubjectListElement.fromMap(x))),
        countableSubjectTotal: json["countable_subject_total"],
        optionalAcademicSubjectStatus: json["optional_academic_subject_status"],
      );

  Map<String, dynamic> toMap() => {
        "total_marks_in_term_exam": totalMarksInTermExam,
        "total_marks_in_class_test": totalMarksInClassTest,
        "obtain_raw_total_marks_in_term_exam": obtainRawTotalMarksInTermExam,
        "obtain_raw_total_marks_in_class_test": obtainRawTotalMarksInClassTest,
        "obtain_total_marks_in_term_exam": obtainTotalMarksInTermExam,
        "obtain_total_marks_in_class_test": obtainTotalMarksInClassTest,
        "obtain_total_marks_in_term_exam_for_show":
            obtainTotalMarksInTermExamForShow,
        "obtain_total_marks_in_class_test_for_show":
            obtainTotalMarksInClassTestForShow,
        "termexam_exam_held_status": termexamExamHeldStatus,
        "classtest_exam_held_status": classtestExamHeldStatus,
        "student_exam_subject_attendance_status":
            studentExamSubjectAttendanceStatus,
        "subject_base_pass_fail_status": subjectBasePassFailStatus,
        "result_show_in_table_bellow": resultShowInTableBellow,
        "obtain_subject_total_marks": obtainSubjectTotalMarks,
        "subject_code": subjectCode,
        "subject_name": subjectName,
        "exam_dependent_academic_subject": examDependentAcademicSubject,
        "subject_exam_name_key": subjectExamNameKey,
        "subject_exam_name": subjectExamName,
        "exam_dependent_academic_subject_id": examDependentAcademicSubjectId,
        "academic_subject_id": academicSubjectId,
        "subject_position": subjectPosition,
        "site_subject_group_condition_setting_id":
            siteSubjectGroupConditionSettingId,
        "examination_list": examinationList == null
            ? []
            : List<dynamic>.from(examinationList!.map((x) => x.toMap())),
        "countable_subject_total": countableSubjectTotal,
        "optional_academic_subject_status": optionalAcademicSubjectStatus,
      };
}

class TableHeader {
  final List<AcademicExamTypeList>? academicExamTypeList;
  final List<dynamic>? academicExamTypeListForTableBellow;
  final int? tableBellowStatus;
  final String? obtainMarks;
  final int? academicExamTypeCount;
  final int? examTypeListForTableBellowCount;
  final int? showPosition;
  final int? marksPercentage;
  final int? id;
  final ExaminationName? examinationName;
  final NameKey? nameKey;

  TableHeader({
    this.academicExamTypeList,
    this.academicExamTypeListForTableBellow,
    this.tableBellowStatus,
    this.obtainMarks,
    this.academicExamTypeCount,
    this.examTypeListForTableBellowCount,
    this.showPosition,
    this.marksPercentage,
    this.id,
    this.examinationName,
    this.nameKey,
  });

  TableHeader copyWith({
    List<AcademicExamTypeList>? academicExamTypeList,
    List<dynamic>? academicExamTypeListForTableBellow,
    int? tableBellowStatus,
    String? obtainMarks,
    int? academicExamTypeCount,
    int? examTypeListForTableBellowCount,
    int? showPosition,
    int? marksPercentage,
    int? id,
    ExaminationName? examinationName,
    NameKey? nameKey,
  }) =>
      TableHeader(
        academicExamTypeList: academicExamTypeList ?? this.academicExamTypeList,
        academicExamTypeListForTableBellow:
            academicExamTypeListForTableBellow ??
                this.academicExamTypeListForTableBellow,
        tableBellowStatus: tableBellowStatus ?? this.tableBellowStatus,
        obtainMarks: obtainMarks ?? this.obtainMarks,
        academicExamTypeCount:
            academicExamTypeCount ?? this.academicExamTypeCount,
        examTypeListForTableBellowCount: examTypeListForTableBellowCount ??
            this.examTypeListForTableBellowCount,
        showPosition: showPosition ?? this.showPosition,
        marksPercentage: marksPercentage ?? this.marksPercentage,
        id: id ?? this.id,
        examinationName: examinationName ?? this.examinationName,
        nameKey: nameKey ?? this.nameKey,
      );

  factory TableHeader.fromJson(String str) =>
      TableHeader.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TableHeader.fromMap(Map<String, dynamic> json) => TableHeader(
        academicExamTypeList: json["academic_exam_type_list"] == null
            ? []
            : List<AcademicExamTypeList>.from(json["academic_exam_type_list"]!
                .map((x) => AcademicExamTypeList.fromMap(x))),
        academicExamTypeListForTableBellow:
            json["academic_exam_type_list_for_table_bellow"] == null
                ? []
                : List<dynamic>.from(
                    json["academic_exam_type_list_for_table_bellow"]!
                        .map((x) => x)),
        tableBellowStatus: json["table_bellow_status"],
        obtainMarks: json["obtain_marks"],
        academicExamTypeCount: json["academic_exam_type_count"],
        examTypeListForTableBellowCount:
            json["exam_type_list_for_table_bellow_count"],
        showPosition: json["show_position"],
        marksPercentage: json["marks_percentage"],
        id: json["id"],
        examinationName: examinationNameValues.map[json["examination_name"]]!,
        nameKey: nameKeyValues.map[json["name_key"]]!,
      );

  Map<String, dynamic> toMap() => {
        "academic_exam_type_list": academicExamTypeList == null
            ? []
            : List<dynamic>.from(academicExamTypeList!.map((x) => x.toMap())),
        "academic_exam_type_list_for_table_bellow":
            academicExamTypeListForTableBellow == null
                ? []
                : List<dynamic>.from(
                    academicExamTypeListForTableBellow!.map((x) => x)),
        "table_bellow_status": tableBellowStatus,
        "obtain_marks": obtainMarks,
        "academic_exam_type_count": academicExamTypeCount,
        "exam_type_list_for_table_bellow_count":
            examTypeListForTableBellowCount,
        "show_position": showPosition,
        "marks_percentage": marksPercentage,
        "id": id,
        "examination_name": examinationNameValues.reverse[examinationName],
        "name_key": nameKeyValues.reverse[nameKey],
      };
}

class AcademicExamTypeList {
  final int? id;
  final MarksType? marksType;
  final String? headKey;

  AcademicExamTypeList({
    this.id,
    this.marksType,
    this.headKey,
  });

  AcademicExamTypeList copyWith({
    int? id,
    MarksType? marksType,
    String? headKey,
  }) =>
      AcademicExamTypeList(
        id: id ?? this.id,
        marksType: marksType ?? this.marksType,
        headKey: headKey ?? this.headKey,
      );

  factory AcademicExamTypeList.fromJson(String str) =>
      AcademicExamTypeList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AcademicExamTypeList.fromMap(Map<String, dynamic> json) =>
      AcademicExamTypeList(
        id: json["id"],
        marksType: marksTypeValues.map[json["marks_type"]]!,
        headKey: json["head_key"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "marks_type": marksTypeValues.reverse[marksType],
        "head_key": headKey,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
