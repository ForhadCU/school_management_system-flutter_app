import 'dart:convert';

class PubExamResultResModel {
    List<StudentExamResult>? studentExamResult;
    String? mode;
    String? status;

    PubExamResultResModel({
        this.studentExamResult,
        this.mode,
        this.status,
    });

    factory PubExamResultResModel.fromJson(String str) => PubExamResultResModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PubExamResultResModel.fromMap(Map<String, dynamic> json) => PubExamResultResModel(
        studentExamResult: json["student_exam_result"] == null ? [] : List<StudentExamResult>.from(json["student_exam_result"]!.map((x) => StudentExamResult.fromMap(x))),
        mode: json["mode"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "student_exam_result": studentExamResult == null ? [] : List<dynamic>.from(studentExamResult!.map((x) => x.toMap())),
        "mode": mode,
        "status": status,
    };
}

class StudentExamResult {
    int? academicResultPrimaryTypeId;
    String? resultTypeName;
    int? failSubjectCount;
    double? gpa;
    String? grade;
    List<SubjectList>? subjectList;
    StudentHistory? studentHistory;
    String? siteName;
    int? sumOfObtainPercentTotalMarks;
    int? sumOfObtainRawTotalMarks;
    int? sumOfRawTotalMarks;
    int? resultPublicFullPublishStatus;
    bool? status;

    StudentExamResult({
        this.academicResultPrimaryTypeId,
        this.resultTypeName,
        this.failSubjectCount,
        this.gpa,
        this.grade,
        this.subjectList,
        this.studentHistory,
        this.siteName,
        this.sumOfObtainPercentTotalMarks,
        this.sumOfObtainRawTotalMarks,
        this.sumOfRawTotalMarks,
        this.resultPublicFullPublishStatus,
        this.status,
    });

    factory StudentExamResult.fromJson(String str) => StudentExamResult.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory StudentExamResult.fromMap(Map<String, dynamic> json) => StudentExamResult(
        academicResultPrimaryTypeId: json["academic_result_primary_type_id"],
        resultTypeName: json["result_type_name"],
        failSubjectCount: json["fail_subject_count"],
        gpa: json["gpa"]?.toDouble(),
        grade: json["grade"],
        subjectList: json["subject_list"] == null ? [] : List<SubjectList>.from(json["subject_list"]!.map((x) => SubjectList.fromMap(x))),
        studentHistory: json["student_history"] == null ? null : StudentHistory.fromMap(json["student_history"]),
        siteName: json["site_name"],
        sumOfObtainPercentTotalMarks: json["sum_of_obtain_percent_total_marks"],
        sumOfObtainRawTotalMarks: json["sum_of_obtain_raw_total_marks"],
        sumOfRawTotalMarks: json["sum_of_raw_total_marks"],
        resultPublicFullPublishStatus: json["result_public_full_publish_status"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "academic_result_primary_type_id": academicResultPrimaryTypeId,
        "result_type_name": resultTypeName,
        "fail_subject_count": failSubjectCount,
        "gpa": gpa,
        "grade": grade,
        "subject_list": subjectList == null ? [] : List<dynamic>.from(subjectList!.map((x) => x.toMap())),
        "student_history": studentHistory?.toMap(),
        "site_name": siteName,
        "sum_of_obtain_percent_total_marks": sumOfObtainPercentTotalMarks,
        "sum_of_obtain_raw_total_marks": sumOfObtainRawTotalMarks,
        "sum_of_raw_total_marks": sumOfRawTotalMarks,
        "result_public_full_publish_status": resultPublicFullPublishStatus,
        "status": status,
    };
}

class StudentHistory {
    int? id;
    int? userId;
    int? academicShiftId;
    int? academicClassId;
    int? academicDepartmentId;
    int? academicSessionId;
    int? academicStudentCategoryId;
    dynamic boardRegistrationNumber;
    int? academicClassGroupId;
    int? academicSectionId;
    int? academicYearId;
    int? studentRollNumber;
    dynamic registrationNo;
    String? fullName;
    String? studentFullRollNumber;
    Student? student;
    dynamic site;
    Year? year;
    Shift? shift;
    dynamic department;
    StClass? stClass;
    ClassGroup? classGroup;
    dynamic session;
    Section? section;

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
        this.site,
        this.year,
        this.shift,
        this.department,
        this.stClass,
        this.classGroup,
        this.session,
        this.section,
    });

    factory StudentHistory.fromJson(String str) => StudentHistory.fromMap(json.decode(str));

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
        student: json["student"] == null ? null : Student.fromMap(json["student"]),
        site: json["site"],
        year: json["year"] == null ? null : Year.fromMap(json["year"]),
        shift: json["shift"] == null ? null : Shift.fromMap(json["shift"]),
        department: json["department"],
        stClass: json["st_class"] == null ? null : StClass.fromMap(json["st_class"]),
        classGroup: json["class_group"] == null ? null : ClassGroup.fromMap(json["class_group"]),
        session: json["session"],
        section: json["section"] == null ? null : Section.fromMap(json["section"]),
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
        "site": site,
        "year": year?.toMap(),
        "shift": shift?.toMap(),
        "department": department,
        "st_class": stClass?.toMap(),
        "class_group": classGroup?.toMap(),
        "session": session,
        "section": section?.toMap(),
    };
}

class ClassGroup {
    int? id;
    String? groupName;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;

    ClassGroup({
        this.id,
        this.groupName,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

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

class Section {
    int? id;
    String? sectionName;
    dynamic createdAt;
    dynamic updatedAt;

    Section({
        this.id,
        this.sectionName,
        this.createdAt,
        this.updatedAt,
    });

    factory Section.fromJson(String str) => Section.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Section.fromMap(Map<String, dynamic> json) => Section(
        id: json["id"],
        sectionName: json["section_name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "section_name": sectionName,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}

class Shift {
    int? id;
    int? status;
    dynamic createdAt;
    dynamic updatedAt;
    String? shiftName;
    List<ShiftTranslation>? translations;

    Shift({
        this.id,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.shiftName,
        this.translations,
    });

    factory Shift.fromJson(String str) => Shift.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Shift.fromMap(Map<String, dynamic> json) => Shift(
        id: json["id"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        shiftName: json["shift_name"],
        translations: json["translations"] == null ? [] : List<ShiftTranslation>.from(json["translations"]!.map((x) => ShiftTranslation.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "shift_name": shiftName,
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x.toMap())),
    };
}

class ShiftTranslation {
    int? id;
    int? academicShiftId;
    String? shiftName;
    String? locale;
    dynamic createdAt;
    dynamic updatedAt;

    ShiftTranslation({
        this.id,
        this.academicShiftId,
        this.shiftName,
        this.locale,
        this.createdAt,
        this.updatedAt,
    });

    factory ShiftTranslation.fromJson(String str) => ShiftTranslation.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ShiftTranslation.fromMap(Map<String, dynamic> json) => ShiftTranslation(
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
    int? id;
    String? className;
    int? academicGroupPresent;
    int? serialNo;
    String? note;
    int? status;
    dynamic createdAt;
    dynamic updatedAt;
    dynamic deletedAt;
    dynamic minimumBirthDate;

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
    int? id;
    DateTime? dateOfBirth;
    String? fullName;
    String? studentFullRollNumber;
    String? firstName;
    String? lastName;
    dynamic address;
    dynamic spouseName;
    String? motherName;
    String? fatherName;
    dynamic permanentAddress;
    LatestPhoto? latestPhoto;
    List<StudentTranslation>? translations;

    Student({
        this.id,
        this.dateOfBirth,
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

    factory Student.fromJson(String str) => Student.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Student.fromMap(Map<String, dynamic> json) => Student(
        id: json["id"],
        dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
        fullName: json["full_name"],
        studentFullRollNumber: json["student_full_roll_number"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        address: json["address"],
        spouseName: json["spouse_name"],
        motherName: json["mother_name"],
        fatherName: json["father_name"],
        permanentAddress: json["permanent_address"],
        latestPhoto: json["latest_photo"] == null ? null : LatestPhoto.fromMap(json["latest_photo"]),
        translations: json["translations"] == null ? [] : List<StudentTranslation>.from(json["translations"]!.map((x) => StudentTranslation.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "date_of_birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
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
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x.toMap())),
    };
}

class LatestPhoto {
    int? id;
    int? userId;
    int? imageableId;
    String? imageableType;
    String? name;
    dynamic path;
    dynamic extension;
    DateTime? createdAt;
    DateTime? updatedAt;

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

    factory LatestPhoto.fromJson(String str) => LatestPhoto.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LatestPhoto.fromMap(Map<String, dynamic> json) => LatestPhoto(
        id: json["id"],
        userId: json["user_id"],
        imageableId: json["imageable_id"],
        imageableType: json["imageable_type"],
        name: json["name"],
        path: json["path"],
        extension: json["extension"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
    int? id;
    int? userId;
    String? firstName;
    String? lastName;
    String? fatherName;
    String? motherName;
    dynamic spouseName;
    dynamic address;
    dynamic permanentAddress;
    String? locale;
    dynamic localGuardianName;

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

    factory StudentTranslation.fromJson(String str) => StudentTranslation.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory StudentTranslation.fromMap(Map<String, dynamic> json) => StudentTranslation(
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
    int? id;
    DateTime? startDate;
    DateTime? endDate;
    String? yearName;
    int? serialNo;
    int? siteId;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? status;

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

    factory Year.fromJson(String str) => Year.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Year.fromMap(Map<String, dynamic> json) => Year(
        id: json["id"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        yearName: json["year_name"],
        serialNo: json["serial_no"],
        siteId: json["site_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "year_name": yearName,
        "serial_no": serialNo,
        "site_id": siteId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "status": status,
    };
}

class SubjectList {
    int? obtainTotalMarksInTermExamForShow;
    int? obtainTotalMarksInClassTestForShow;
    int? obtainTotalMarksForShow;
    int? totalMarksInTermExam;
    int? totalMarksInClassTest;
    int? obtainRawTotalMarksInTermExam;
    int? obtainRawTotalMarksInClassTest;
    int? obtainTotalMarksInTermExam;
    int? obtainTotalMarksInClassTest;
    int? obtainRawTotalMarks;
    int? obtainPercentTotalMarks;
    int? rawTotalMarks;
    int? examDependentAcademicSubjectId;
    int? subjectPosition;
    String? examDependentAcademicSubject;
    dynamic subjectCode;
    int? dependentOptionalAcademicSubjectStatus;
    double? subjectCountablePoint;
    int? resultShowInTableBellowStatus;
    int? subjectBasePassFailStatus;
    int? obtainSubjectTotalMarks;
    int? subjectMarksPercentage;
    double? subjectPoint;
    String? subjectGrade;
    List<IndivisualStudentSubjectList>? indivisualStudentSubjectList;
    int? subjectCount;
    List<DependentSubjectListElement>? dependentSubjectList;

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

    factory SubjectList.fromJson(String str) => SubjectList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SubjectList.fromMap(Map<String, dynamic> json) => SubjectList(
        obtainTotalMarksInTermExamForShow: json["obtain_total_marks_in_term_exam_for_show"],
        obtainTotalMarksInClassTestForShow: json["obtain_total_marks_in_class_test_for_show"],
        obtainTotalMarksForShow: json["obtain_total_marks_for_show"],
        totalMarksInTermExam: json["total_marks_in_term_exam"],
        totalMarksInClassTest: json["total_marks_in_class_test"],
        obtainRawTotalMarksInTermExam: json["obtain_raw_total_marks_in_term_exam"],
        obtainRawTotalMarksInClassTest: json["obtain_raw_total_marks_in_class_test"],
        obtainTotalMarksInTermExam: json["obtain_total_marks_in_term_exam"],
        obtainTotalMarksInClassTest: json["obtain_total_marks_in_class_test"],
        obtainRawTotalMarks: json["obtain_raw_total_marks"],
        obtainPercentTotalMarks: json["obtain_percent_total_marks"],
        rawTotalMarks: json["raw_total_marks"],
        examDependentAcademicSubjectId: json["exam_dependent_academic_subject_id"],
        subjectPosition: json["subject_position"],
        examDependentAcademicSubject: json["exam_dependent_academic_subject"],
        subjectCode: json["subject_code"],
        dependentOptionalAcademicSubjectStatus: json["dependent_optional_academic_subject_status"],
        subjectCountablePoint: json["subject_countable_point"]?.toDouble(),
        resultShowInTableBellowStatus: json["result_show_in_table_bellow_status"],
        subjectBasePassFailStatus: json["subject_base_pass_fail_status"],
        obtainSubjectTotalMarks: json["obtain_subject_total_marks"],
        subjectMarksPercentage: json["subject_marks_percentage"],
        subjectPoint: json["subject_point"]?.toDouble(),
        subjectGrade: json["subject_grade"],
        indivisualStudentSubjectList: json["indivisual_student_subject_list"] == null ? [] : List<IndivisualStudentSubjectList>.from(json["indivisual_student_subject_list"]!.map((x) => IndivisualStudentSubjectList.fromMap(x))),
        subjectCount: json["subject_count"],
        dependentSubjectList: json["dependent_subject_list"] == null ? [] : List<DependentSubjectListElement>.from(json["dependent_subject_list"]!.map((x) => DependentSubjectListElement.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "obtain_total_marks_in_term_exam_for_show": obtainTotalMarksInTermExamForShow,
        "obtain_total_marks_in_class_test_for_show": obtainTotalMarksInClassTestForShow,
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
        "dependent_optional_academic_subject_status": dependentOptionalAcademicSubjectStatus,
        "subject_countable_point": subjectCountablePoint,
        "result_show_in_table_bellow_status": resultShowInTableBellowStatus,
        "subject_base_pass_fail_status": subjectBasePassFailStatus,
        "obtain_subject_total_marks": obtainSubjectTotalMarks,
        "subject_marks_percentage": subjectMarksPercentage,
        "subject_point": subjectPoint,
        "subject_grade": subjectGrade,
        "indivisual_student_subject_list": indivisualStudentSubjectList == null ? [] : List<dynamic>.from(indivisualStudentSubjectList!.map((x) => x.toMap())),
        "subject_count": subjectCount,
        "dependent_subject_list": dependentSubjectList == null ? [] : List<dynamic>.from(dependentSubjectList!.map((x) => x.toMap())),
    };
}

class DependentSubjectListElement {
    int? examinationId;
    int? id;
    int? examinationMarks;
    int? examinationPassMarks;
    int? subjectIndivisualPassFailStatus;
    List<ExamTypeList>? examTypeList;
    int? obtaineTotalMarks;
    int? examHeldStatus;
    ExaminationName? examinationName;
    ExaminationNameKey? examinationNameKey;
    dynamic marksPercentage;
    int? showPosition;
    int? countableDependentObtainExamTypeMarks;
    int? countableDependentObtainExamTypeMarksForShow;

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

    factory DependentSubjectListElement.fromJson(String str) => DependentSubjectListElement.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DependentSubjectListElement.fromMap(Map<String, dynamic> json) => DependentSubjectListElement(
        examinationId: json["examination_id"],
        id: json["id"],
        examinationMarks: json["examination_marks"],
        examinationPassMarks: json["examination_pass_marks"],
        subjectIndivisualPassFailStatus: json["subject_indivisual_pass_fail_status"],
        examTypeList: json["exam_type_list"] == null ? [] : List<ExamTypeList>.from(json["exam_type_list"]!.map((x) => ExamTypeList.fromMap(x))),
        obtaineTotalMarks: json["obtaine_total_marks"],
        examHeldStatus: json["exam_held_status"],
        examinationName: examinationNameValues.map[json["examination_name"]]!,
        examinationNameKey: examinationNameKeyValues.map[json["examination_name_key"]]!,
        marksPercentage: json["marks_percentage"],
        showPosition: json["show_position"],
        countableDependentObtainExamTypeMarks: json["countable_dependent_obtain_exam_type_marks"],
        countableDependentObtainExamTypeMarksForShow: json["countable_dependent_obtain_exam_type_marks_for_show"],
    );

    Map<String, dynamic> toMap() => {
        "examination_id": examinationId,
        "id": id,
        "examination_marks": examinationMarks,
        "examination_pass_marks": examinationPassMarks,
        "subject_indivisual_pass_fail_status": subjectIndivisualPassFailStatus,
        "exam_type_list": examTypeList == null ? [] : List<dynamic>.from(examTypeList!.map((x) => x.toMap())),
        "obtaine_total_marks": obtaineTotalMarks,
        "exam_held_status": examHeldStatus,
        "examination_name": examinationNameValues.reverse[examinationName],
        "examination_name_key": examinationNameKeyValues.reverse[examinationNameKey],
        "marks_percentage": marksPercentage,
        "show_position": showPosition,
        "countable_dependent_obtain_exam_type_marks": countableDependentObtainExamTypeMarks,
        "countable_dependent_obtain_exam_type_marks_for_show": countableDependentObtainExamTypeMarksForShow,
    };
}

class ExamTypeList {
    int? academicExamTypeId;
    AcademicExamTypeName? academicExamTypeName;
    int? examinationId;
    int? id;
    int? obtaineMarks;
    int? passMark;
    int? primaryPassFailStatus;
    int? siteSubjectGroupConditionSettingId;
    int? studentHistoryId;
    int? subjectExamTypeMark;
    int? examTypeCountableMarks;
    bool? examHeldStatus;
    bool? examAttendanceStatus;
    bool? examExistStatus;

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
        this.examTypeCountableMarks,
        this.examHeldStatus,
        this.examAttendanceStatus,
        this.examExistStatus,
    });

    factory ExamTypeList.fromJson(String str) => ExamTypeList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ExamTypeList.fromMap(Map<String, dynamic> json) => ExamTypeList(
        academicExamTypeId: json["academic_exam_type_id"],
        academicExamTypeName: academicExamTypeNameValues.map[json["academic_exam_type_name"]]!,
        examinationId: json["examination_id"],
        id: json["id"],
        obtaineMarks: json["obtaine_marks"],
        passMark: json["pass_mark"],
        primaryPassFailStatus: json["primary_pass_fail_status"],
        siteSubjectGroupConditionSettingId: json["site_subject_group_condition_setting_id"],
        studentHistoryId: json["student_history_id"],
        subjectExamTypeMark: json["subject_exam_type_mark"],
        examTypeCountableMarks: json["exam_type_countable_marks"],
        examHeldStatus: json["exam_held_status"],
        examAttendanceStatus: json["exam_attendance_status"],
        examExistStatus: json["exam_exist_status"],
    );

    Map<String, dynamic> toMap() => {
        "academic_exam_type_id": academicExamTypeId,
        "academic_exam_type_name": academicExamTypeNameValues.reverse[academicExamTypeName],
        "examination_id": examinationId,
        "id": id,
        "obtaine_marks": obtaineMarks,
        "pass_mark": passMark,
        "primary_pass_fail_status": primaryPassFailStatus,
        "site_subject_group_condition_setting_id": siteSubjectGroupConditionSettingId,
        "student_history_id": studentHistoryId,
        "subject_exam_type_mark": subjectExamTypeMark,
        "exam_type_countable_marks": examTypeCountableMarks,
        "exam_held_status": examHeldStatus,
        "exam_attendance_status": examAttendanceStatus,
        "exam_exist_status": examExistStatus,
    };
}

enum AcademicExamTypeName {
    CQ,
    MCQ,
    PRACTICAL
}

final academicExamTypeNameValues = EnumValues({
    "CQ": AcademicExamTypeName.CQ,
    "MCQ": AcademicExamTypeName.MCQ,
    "Practical": AcademicExamTypeName.PRACTICAL
});

enum ExaminationName {
    TEST_EXAM
}

final examinationNameValues = EnumValues({
    "Test Exam": ExaminationName.TEST_EXAM
});

enum ExaminationNameKey {
    TERMEXAM
}

final examinationNameKeyValues = EnumValues({
    "termexam": ExaminationNameKey.TERMEXAM
});

class IndivisualStudentSubjectList {
    int? totalMarksInTermExam;
    int? totalMarksInClassTest;
    int? obtainRawTotalMarksInTermExam;
    int? obtainRawTotalMarksInClassTest;
    int? obtainTotalMarksInTermExam;
    int? obtainTotalMarksInClassTest;
    int? obtainTotalMarksInTermExamForShow;
    int? obtainTotalMarksInClassTestForShow;
    int? termexamExamHeldStatus;
    int? classtestExamHeldStatus;
    bool? studentExamSubjectAttendanceStatus;
    int? subjectBasePassFailStatus;
    int? resultShowInTableBellow;
    int? obtainSubjectTotalMarks;
    dynamic subjectCode;
    String? subjectName;
    String? examDependentAcademicSubject;
    SubjectExamNameKey? subjectExamNameKey;
    SubjectExamName? subjectExamName;
    int? examDependentAcademicSubjectId;
    int? academicSubjectId;
    int? subjectPosition;
    int? siteSubjectGroupConditionSettingId;
    List<DependentSubjectListElement>? examinationList;
    int? countableSubjectTotal;
    int? optionalAcademicSubjectStatus;

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

    factory IndivisualStudentSubjectList.fromJson(String str) => IndivisualStudentSubjectList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory IndivisualStudentSubjectList.fromMap(Map<String, dynamic> json) => IndivisualStudentSubjectList(
        totalMarksInTermExam: json["total_marks_in_term_exam"],
        totalMarksInClassTest: json["total_marks_in_class_test"],
        obtainRawTotalMarksInTermExam: json["obtain_raw_total_marks_in_term_exam"],
        obtainRawTotalMarksInClassTest: json["obtain_raw_total_marks_in_class_test"],
        obtainTotalMarksInTermExam: json["obtain_total_marks_in_term_exam"],
        obtainTotalMarksInClassTest: json["obtain_total_marks_in_class_test"],
        obtainTotalMarksInTermExamForShow: json["obtain_total_marks_in_term_exam_for_show"],
        obtainTotalMarksInClassTestForShow: json["obtain_total_marks_in_class_test_for_show"],
        termexamExamHeldStatus: json["termexam_exam_held_status"],
        classtestExamHeldStatus: json["classtest_exam_held_status"],
        studentExamSubjectAttendanceStatus: json["student_exam_subject_attendance_status"],
        subjectBasePassFailStatus: json["subject_base_pass_fail_status"],
        resultShowInTableBellow: json["result_show_in_table_bellow"],
        obtainSubjectTotalMarks: json["obtain_subject_total_marks"],
        subjectCode: json["subject_code"],
        subjectName: json["subject_name"],
        examDependentAcademicSubject: json["exam_dependent_academic_subject"],
        subjectExamNameKey: subjectExamNameKeyValues.map[json["subject_exam_name_key"]]!,
        subjectExamName: subjectExamNameValues.map[json["subject_exam_name"]]!,
        examDependentAcademicSubjectId: json["exam_dependent_academic_subject_id"],
        academicSubjectId: json["academic_subject_id"],
        subjectPosition: json["subject_position"],
        siteSubjectGroupConditionSettingId: json["site_subject_group_condition_setting_id"],
        examinationList: json["examination_list"] == null ? [] : List<DependentSubjectListElement>.from(json["examination_list"]!.map((x) => DependentSubjectListElement.fromMap(x))),
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
        "obtain_total_marks_in_term_exam_for_show": obtainTotalMarksInTermExamForShow,
        "obtain_total_marks_in_class_test_for_show": obtainTotalMarksInClassTestForShow,
        "termexam_exam_held_status": termexamExamHeldStatus,
        "classtest_exam_held_status": classtestExamHeldStatus,
        "student_exam_subject_attendance_status": studentExamSubjectAttendanceStatus,
        "subject_base_pass_fail_status": subjectBasePassFailStatus,
        "result_show_in_table_bellow": resultShowInTableBellow,
        "obtain_subject_total_marks": obtainSubjectTotalMarks,
        "subject_code": subjectCode,
        "subject_name": subjectName,
        "exam_dependent_academic_subject": examDependentAcademicSubject,
        "subject_exam_name_key": subjectExamNameKeyValues.reverse[subjectExamNameKey],
        "subject_exam_name": subjectExamNameValues.reverse[subjectExamName],
        "exam_dependent_academic_subject_id": examDependentAcademicSubjectId,
        "academic_subject_id": academicSubjectId,
        "subject_position": subjectPosition,
        "site_subject_group_condition_setting_id": siteSubjectGroupConditionSettingId,
        "examination_list": examinationList == null ? [] : List<dynamic>.from(examinationList!.map((x) => x.toMap())),
        "countable_subject_total": countableSubjectTotal,
        "optional_academic_subject_status": optionalAcademicSubjectStatus,
    };
}

enum SubjectExamName {
    FOR_CLASS_EXAM
}

final subjectExamNameValues = EnumValues({
    "For Class & Exam": SubjectExamName.FOR_CLASS_EXAM
});

enum SubjectExamNameKey {
    FORCLASSANDEXAM
}

final subjectExamNameKeyValues = EnumValues({
    "forclassandexam": SubjectExamNameKey.FORCLASSANDEXAM
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
