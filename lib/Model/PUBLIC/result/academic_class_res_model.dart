import 'dart:convert';

class PubAcademicClassResponseModel {
    List<AcademicClassList>? academicClassList;
    List<dynamic>? academicDepartmentList;
    int? countDepartment;
    String? mode;
    String? status;

    PubAcademicClassResponseModel({
        this.academicClassList,
        this.academicDepartmentList,
        this.countDepartment,
        this.mode,
        this.status,
    });

    factory PubAcademicClassResponseModel.fromJson(String str) => PubAcademicClassResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PubAcademicClassResponseModel.fromMap(Map<String, dynamic> json) => PubAcademicClassResponseModel(
        academicClassList: json["academic_class_list"] == null ? [] : List<AcademicClassList>.from(json["academic_class_list"]!.map((x) => AcademicClassList.fromMap(x))),
        academicDepartmentList: json["academic_department_list"] == null ? [] : List<dynamic>.from(json["academic_department_list"]!.map((x) => x)),
        countDepartment: json["countDepartment"],
        mode: json["mode"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "academic_class_list": academicClassList == null ? [] : List<dynamic>.from(academicClassList!.map((x) => x.toMap())),
        "academic_department_list": academicDepartmentList == null ? [] : List<dynamic>.from(academicDepartmentList!.map((x) => x)),
        "countDepartment": countDepartment,
        "mode": mode,
        "status": status,
    };
}

class AcademicClassList {
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

    AcademicClassList({
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

    factory AcademicClassList.fromJson(String str) => AcademicClassList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AcademicClassList.fromMap(Map<String, dynamic> json) => AcademicClassList(
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
