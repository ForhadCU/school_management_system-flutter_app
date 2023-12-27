import 'dart:convert';

class StuSubjectModel {
  static String get getDataListJsonKey => "subject_list";

  final int? id;
  final String? subjectName;
  final String? subjectCode;
  final List<AcademicSubjectCondition>? academicSubjectConditions;

  StuSubjectModel({
    this.id,
    this.subjectName,
    this.subjectCode,
    this.academicSubjectConditions,
  });

  StuSubjectModel copyWith({
    int? id,
    String? subjectName,
    String? subjectCode,
    List<AcademicSubjectCondition>? academicSubjectConditions,
  }) =>
      StuSubjectModel(
        id: id ?? this.id,
        subjectName: subjectName ?? this.subjectName,
        subjectCode: subjectCode ?? this.subjectCode,
        academicSubjectConditions:
            academicSubjectConditions ?? this.academicSubjectConditions,
      );

  factory StuSubjectModel.fromJson(String str) =>
      StuSubjectModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StuSubjectModel.fromMap(Map<String, dynamic> json) => StuSubjectModel(
        id: json["id"],
        subjectName: json["subject_name"],
        subjectCode: json["subject_code"],
        academicSubjectConditions: json["academic_subject_conditions"] == null
            ? []
            : List<AcademicSubjectCondition>.from(
                json["academic_subject_conditions"]!
                    .map((x) => AcademicSubjectCondition.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "subject_name": subjectName,
        "subject_code": subjectCode,
        "academic_subject_conditions": academicSubjectConditions == null
            ? []
            : List<dynamic>.from(
                academicSubjectConditions!.map((x) => x.toMap())),
      };
}

class AcademicSubjectCondition {
  final String? condition;

  AcademicSubjectCondition({
    this.condition,
  });

  AcademicSubjectCondition copyWith({
    String? condition,
  }) =>
      AcademicSubjectCondition(
        condition: condition ?? this.condition,
      );

  factory AcademicSubjectCondition.fromJson(String str) =>
      AcademicSubjectCondition.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AcademicSubjectCondition.fromMap(Map<String, dynamic> json) =>
      AcademicSubjectCondition(
        condition: json["condition"],
      );

  Map<String, dynamic> toMap() => {
        "condition": condition,
      };
}
