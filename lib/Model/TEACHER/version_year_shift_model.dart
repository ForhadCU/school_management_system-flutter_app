import 'dart:convert';

class VersionYearShiftModel {
    final List<AcademicVersion>? academicVersionlist;
    final List<AcademicYear>? academicYearList;
    final List<AcademicShift>? academicShiftList;
    final List<AdmissionData>? admissionListData;
    final List<AcademicVersion>? academicStudentCategoryList;
    final String? mode;
    final String? status;

    VersionYearShiftModel({
        this.academicVersionlist,
        this.academicYearList,
        this.academicShiftList,
        this.admissionListData,
        this.academicStudentCategoryList,
        this.mode,
        this.status,
    });

    VersionYearShiftModel copyWith({
        List<AcademicVersion>? academicVersionlist,
        List<AcademicYear>? academicYearList,
        List<AcademicShift>? academicShiftList,
        List<AdmissionData>? admissionListData,
        List<AcademicVersion>? academicStudentCategoryList,
        String? mode,
        String? status,
    }) => 
        VersionYearShiftModel(
            academicVersionlist: academicVersionlist ?? this.academicVersionlist,
            academicYearList: academicYearList ?? this.academicYearList,
            academicShiftList: academicShiftList ?? this.academicShiftList,
            admissionListData: admissionListData ?? this.admissionListData,
            academicStudentCategoryList: academicStudentCategoryList ?? this.academicStudentCategoryList,
            mode: mode ?? this.mode,
            status: status ?? this.status,
        );

    factory VersionYearShiftModel.fromJson(String str) => VersionYearShiftModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory VersionYearShiftModel.fromMap(Map<String, dynamic> json) => VersionYearShiftModel(
        academicVersionlist: json["academic_versionlist"] == null ? [] : List<AcademicVersion>.from(json["academic_versionlist"]!.map((x) => AcademicVersion.fromMap(x))),
        academicYearList: json["academic_year_list"] == null ? [] : List<AcademicYear>.from(json["academic_year_list"]!.map((x) => AcademicYear.fromMap(x))),
        academicShiftList: json["academic_shift_list"] == null ? [] : List<AcademicShift>.from(json["academic_shift_list"]!.map((x) => AcademicShift.fromMap(x))),
        admissionListData: json["admission_list_data"] == null ? [] : List<AdmissionData>.from(json["admission_list_data"]!.map((x) => AdmissionData.fromMap(x))),
        academicStudentCategoryList: json["academic_student_category_list"] == null ? [] : List<AcademicVersion>.from(json["academic_student_category_list"]!.map((x) => AcademicVersion.fromMap(x))),
        mode: json["mode"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "academic_versionlist": academicVersionlist == null ? [] : List<dynamic>.from(academicVersionlist!.map((x) => x.toMap())),
        "academic_year_list": academicYearList == null ? [] : List<dynamic>.from(academicYearList!.map((x) => x.toMap())),
        "academic_shift_list": academicShiftList == null ? [] : List<dynamic>.from(academicShiftList!.map((x) => x.toMap())),
        "admission_list_data": admissionListData == null ? [] : List<dynamic>.from(admissionListData!.map((x) => x.toMap())),
        "academic_student_category_list": academicStudentCategoryList == null ? [] : List<dynamic>.from(academicStudentCategoryList!.map((x) => x.toMap())),
        "mode": mode,
        "status": status,
    };
}

class AcademicShift {
    final int? id;
    final int? status;
    final dynamic createdAt;
    final dynamic updatedAt;
    final String? shiftName;
    final List<Translation>? translations;

    AcademicShift({
        this.id,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.shiftName,
        this.translations,
    });

    AcademicShift copyWith({
        int? id,
        int? status,
        dynamic createdAt,
        dynamic updatedAt,
        String? shiftName,
        List<Translation>? translations,
    }) => 
        AcademicShift(
            id: id ?? this.id,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            shiftName: shiftName ?? this.shiftName,
            translations: translations ?? this.translations,
        );

    factory AcademicShift.fromJson(String str) => AcademicShift.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AcademicShift.fromMap(Map<String, dynamic> json) => AcademicShift(
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
    final int? id;
    final int? academicShiftId;
    final String? shiftName;
    final String? locale;
    final dynamic createdAt;
    final dynamic updatedAt;

    Translation({
        this.id,
        this.academicShiftId,
        this.shiftName,
        this.locale,
        this.createdAt,
        this.updatedAt,
    });

    Translation copyWith({
        int? id,
        int? academicShiftId,
        String? shiftName,
        String? locale,
        dynamic createdAt,
        dynamic updatedAt,
    }) => 
        Translation(
            id: id ?? this.id,
            academicShiftId: academicShiftId ?? this.academicShiftId,
            shiftName: shiftName ?? this.shiftName,
            locale: locale ?? this.locale,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

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

class AcademicVersion {
    final int? id;
    final String? categoryName;
    final int? status;
    final dynamic createdAt;
    final dynamic updatedAt;
    final String? versionName;

    AcademicVersion({
        this.id,
        this.categoryName,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.versionName,
    });

    AcademicVersion copyWith({
        int? id,
        String? categoryName,
        int? status,
        dynamic createdAt,
        dynamic updatedAt,
        String? versionName,
    }) => 
        AcademicVersion(
            id: id ?? this.id,
            categoryName: categoryName ?? this.categoryName,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            versionName: versionName ?? this.versionName,
        );

    factory AcademicVersion.fromJson(String str) => AcademicVersion.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AcademicVersion.fromMap(Map<String, dynamic> json) => AcademicVersion(
        id: json["id"],
        categoryName: json["category_name"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        versionName: json["version_name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "category_name": categoryName,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "version_name": versionName,
    };
}

class AcademicYear {
    final int? id;
    final DateTime? startDate;
    final DateTime? endDate;
    final String? yearName;

    AcademicYear({
        this.id,
        this.startDate,
        this.endDate,
        this.yearName,
    });

    AcademicYear copyWith({
        int? id,
        DateTime? startDate,
        DateTime? endDate,
        String? yearName,
    }) => 
        AcademicYear(
            id: id ?? this.id,
            startDate: startDate ?? this.startDate,
            endDate: endDate ?? this.endDate,
            yearName: yearName ?? this.yearName,
        );

    factory AcademicYear.fromJson(String str) => AcademicYear.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AcademicYear.fromMap(Map<String, dynamic> json) => AcademicYear(
        id: json["id"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        yearName: json["year_name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "year_name": yearName,
    };
}

class AdmissionData {
    final int? id;
    final String? admissionTypeName;
    final int? status;
    final dynamic createdAt;
    final dynamic updatedAt;
    final String? headKey;

    AdmissionData({
        this.id,
        this.admissionTypeName,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.headKey,
    });

    AdmissionData copyWith({
        int? id,
        String? admissionTypeName,
        int? status,
        dynamic createdAt,
        dynamic updatedAt,
        String? headKey,
    }) => 
        AdmissionData(
            id: id ?? this.id,
            admissionTypeName: admissionTypeName ?? this.admissionTypeName,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            headKey: headKey ?? this.headKey,
        );

    factory AdmissionData.fromJson(String str) => AdmissionData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AdmissionData.fromMap(Map<String, dynamic> json) => AdmissionData(
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
