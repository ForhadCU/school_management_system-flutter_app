import 'dart:convert';

class DeptClasslistModel {
    final List<AcademicClass>? academicClassList;
    final List<dynamic>? academicDepartmentList;
    final String? mode;
    final String? status;

    DeptClasslistModel({
        this.academicClassList,
        this.academicDepartmentList,
        this.mode,
        this.status,
    });

    DeptClasslistModel copyWith({
        List<AcademicClass>? academicClassList,
        List<dynamic>? academicDepartmentList,
        String? mode,
        String? status,
    }) => 
        DeptClasslistModel(
            academicClassList: academicClassList ?? this.academicClassList,
            academicDepartmentList: academicDepartmentList ?? this.academicDepartmentList,
            mode: mode ?? this.mode,
            status: status ?? this.status,
        );

    factory DeptClasslistModel.fromJson(String str) => DeptClasslistModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DeptClasslistModel.fromMap(Map<String, dynamic> json) => DeptClasslistModel(
        academicClassList: json["academic_class_list"] == null ? [] : List<AcademicClass>.from(json["academic_class_list"]!.map((x) => AcademicClass.fromMap(x))),
        academicDepartmentList: json["academic_department_list"] == null ? [] : List<dynamic>.from(json["academic_department_list"]!.map((x) => x)),
        mode: json["mode"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "academic_class_list": academicClassList == null ? [] : List<dynamic>.from(academicClassList!.map((x) => x.toMap())),
        "academic_department_list": academicDepartmentList == null ? [] : List<dynamic>.from(academicDepartmentList!.map((x) => x)),
        "mode": mode,
        "status": status,
    };
}

class AcademicClass {
    final int? id;
    final String? className;
    final int? academicGroupPresent;
    final dynamic minimumBirthDate;

    AcademicClass({
        this.id,
        this.className,
        this.academicGroupPresent,
        this.minimumBirthDate,
    });

    AcademicClass copyWith({
        int? id,
        String? className,
        int? academicGroupPresent,
        dynamic minimumBirthDate,
    }) => 
        AcademicClass(
            id: id ?? this.id,
            className: className ?? this.className,
            academicGroupPresent: academicGroupPresent ?? this.academicGroupPresent,
            minimumBirthDate: minimumBirthDate ?? this.minimumBirthDate,
        );

    factory AcademicClass.fromJson(String str) => AcademicClass.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AcademicClass.fromMap(Map<String, dynamic> json) => AcademicClass(
        id: json["id"],
        className: json["class_name"],
        academicGroupPresent: json["academic_group_present"],
        minimumBirthDate: json["minimum_birth_date"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "class_name": className,
        "academic_group_present": academicGroupPresent,
        "minimum_birth_date": minimumBirthDate,
    };
}
