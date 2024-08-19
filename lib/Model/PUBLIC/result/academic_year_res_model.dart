import 'dart:convert';

class PubAcademicVersionYearResponseModel {
    List<AcademicList>? academicVersionList;
    List<AcademicYearList>? academicYearList;
    List<AcademicShiftList>? academicShiftList;
    List<AcademicAdmissionTypeList>? academicAdmissionTypeList;
    List<AcademicList>? academicStudentCategoryList;
    List<AcademicSessionList>? academicSessionList;
    List<AcademicList>? academicStudentTypeList;
    String? mode;
    String? status;

    PubAcademicVersionYearResponseModel({
        this.academicVersionList,
        this.academicYearList,
        this.academicShiftList,
        this.academicAdmissionTypeList,
        this.academicStudentCategoryList,
        this.academicSessionList,
        this.academicStudentTypeList,
        this.mode,
        this.status,
    });

    factory PubAcademicVersionYearResponseModel.fromJson(String str) => PubAcademicVersionYearResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PubAcademicVersionYearResponseModel.fromMap(Map<String, dynamic> json) => PubAcademicVersionYearResponseModel(
        academicVersionList: json["academic_version_list"] == null ? [] : List<AcademicList>.from(json["academic_version_list"]!.map((x) => AcademicList.fromMap(x))),
        academicYearList: json["academic_year_list"] == null ? [] : List<AcademicYearList>.from(json["academic_year_list"]!.map((x) => AcademicYearList.fromMap(x))),
        academicShiftList: json["academic_shift_list"] == null ? [] : List<AcademicShiftList>.from(json["academic_shift_list"]!.map((x) => AcademicShiftList.fromMap(x))),
        academicAdmissionTypeList: json["academic_admission_type_list"] == null ? [] : List<AcademicAdmissionTypeList>.from(json["academic_admission_type_list"]!.map((x) => AcademicAdmissionTypeList.fromMap(x))),
        academicStudentCategoryList: json["academic_student_category_list"] == null ? [] : List<AcademicList>.from(json["academic_student_category_list"]!.map((x) => AcademicList.fromMap(x))),
        academicSessionList: json["academic_session_list"] == null ? [] : List<AcademicSessionList>.from(json["academic_session_list"]!.map((x) => AcademicSessionList.fromMap(x))),
        academicStudentTypeList: json["academic_student_type_list"] == null ? [] : List<AcademicList>.from(json["academic_student_type_list"]!.map((x) => AcademicList.fromMap(x))),
        mode: json["mode"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "academic_version_list": academicVersionList == null ? [] : List<dynamic>.from(academicVersionList!.map((x) => x.toMap())),
        "academic_year_list": academicYearList == null ? [] : List<dynamic>.from(academicYearList!.map((x) => x.toMap())),
        "academic_shift_list": academicShiftList == null ? [] : List<dynamic>.from(academicShiftList!.map((x) => x.toMap())),
        "academic_admission_type_list": academicAdmissionTypeList == null ? [] : List<dynamic>.from(academicAdmissionTypeList!.map((x) => x.toMap())),
        "academic_student_category_list": academicStudentCategoryList == null ? [] : List<dynamic>.from(academicStudentCategoryList!.map((x) => x.toMap())),
        "academic_session_list": academicSessionList == null ? [] : List<dynamic>.from(academicSessionList!.map((x) => x.toMap())),
        "academic_student_type_list": academicStudentTypeList == null ? [] : List<dynamic>.from(academicStudentTypeList!.map((x) => x.toMap())),
        "mode": mode,
        "status": status,
    };
}

class AcademicAdmissionTypeList {
    int? id;
    String? admissionTypeName;
    int? status;
    dynamic createdAt;
    dynamic updatedAt;
    String? headKey;

    AcademicAdmissionTypeList({
        this.id,
        this.admissionTypeName,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.headKey,
    });

    factory AcademicAdmissionTypeList.fromJson(String str) => AcademicAdmissionTypeList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AcademicAdmissionTypeList.fromMap(Map<String, dynamic> json) => AcademicAdmissionTypeList(
        id: json["id"],
        admissionTypeName: json["admission_type_name"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        headKey: json["head_key"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "admission_type_name": admissionTypeName,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "head_key": headKey,
    };
}

class AcademicSessionList {
    int? id;
    String? sessionName;
    int? serialNo;
    int? status;
    dynamic createdAt;
    dynamic updatedAt;

    AcademicSessionList({
        this.id,
        this.sessionName,
        this.serialNo,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory AcademicSessionList.fromJson(String str) => AcademicSessionList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AcademicSessionList.fromMap(Map<String, dynamic> json) => AcademicSessionList(
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

class AcademicShiftList {
    int? id;
    int? status;
    dynamic createdAt;
    dynamic updatedAt;
    String? shiftName;
    List<Translation>? translations;

    AcademicShiftList({
        this.id,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.shiftName,
        this.translations,
    });

    factory AcademicShiftList.fromJson(String str) => AcademicShiftList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AcademicShiftList.fromMap(Map<String, dynamic> json) => AcademicShiftList(
        id: json["id"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        shiftName: json["shift_name"],
        translations: json["translations"] == null ? [] : List<Translation>.from(json["translations"]!.map((x) => Translation.fromMap(x))),
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

class Translation {
    int? id;
    int? academicShiftId;
    String? shiftName;
    String? locale;
    dynamic createdAt;
    dynamic updatedAt;

    Translation({
        this.id,
        this.academicShiftId,
        this.shiftName,
        this.locale,
        this.createdAt,
        this.updatedAt,
    });

    factory Translation.fromJson(String str) => Translation.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Translation.fromMap(Map<String, dynamic> json) => Translation(
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

class AcademicList {
    int? id;
    String? categoryName;
    int? status;
    dynamic createdAt;
    dynamic updatedAt;
    String? studentTypeName;
    String? versionName;

    AcademicList({
        this.id,
        this.categoryName,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.studentTypeName,
        this.versionName,
    });

    factory AcademicList.fromJson(String str) => AcademicList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AcademicList.fromMap(Map<String, dynamic> json) => AcademicList(
        id: json["id"],
        categoryName: json["category_name"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        studentTypeName: json["student_type_name"],
        versionName: json["version_name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "category_name": categoryName,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "student_type_name": studentTypeName,
        "version_name": versionName,
    };
}

class AcademicYearList {
    int? id;
    DateTime? startDate;
    DateTime? endDate;
    String? yearName;
    int? serialNo;
    int? siteId;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? status;

    AcademicYearList({
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

    factory AcademicYearList.fromJson(String str) => AcademicYearList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AcademicYearList.fromMap(Map<String, dynamic> json) => AcademicYearList(
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
