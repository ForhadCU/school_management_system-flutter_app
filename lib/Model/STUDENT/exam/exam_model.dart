import 'dart:convert';

class StuExamTypeModel {
  static String get getDataListJsonKey => "examination_list";

  final int? id;
  final String? examinationName;
  final String? status;
  final dynamic deletedAt;
  final String? nameKey;

  StuExamTypeModel({
    this.id,
    this.examinationName,
    this.status,
    this.deletedAt,
    this.nameKey,
  });

  StuExamTypeModel copyWith({
    int? id,
    String? examinationName,
    String? status,
    dynamic deletedAt,
    String? nameKey,
  }) =>
      StuExamTypeModel(
        id: id ?? this.id,
        examinationName: examinationName ?? this.examinationName,
        status: status ?? this.status,
        deletedAt: deletedAt ?? this.deletedAt,
        nameKey: nameKey ?? this.nameKey,
      );

  factory StuExamTypeModel.fromJson(String str) =>
      StuExamTypeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StuExamTypeModel.fromMap(Map<String, dynamic> json) =>
      StuExamTypeModel(
        id: json["id"],
        examinationName: json["examination_name"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        nameKey: json["name_key"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "examination_name": examinationName,
        "status": status,
        "deleted_at": deletedAt,
        "name_key": nameKey,
      };
}
