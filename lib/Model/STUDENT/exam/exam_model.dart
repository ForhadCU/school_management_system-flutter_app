import 'dart:convert';

class StuExamModel {
  static String get getDataListJsonKey => "examination_list";

  final int? id;
  final String? examinationName;
  final String? status;
  final dynamic deletedAt;
  final String? nameKey;

  StuExamModel({
    this.id,
    this.examinationName,
    this.status,
    this.deletedAt,
    this.nameKey,
  });

  StuExamModel copyWith({
    int? id,
    String? examinationName,
    String? status,
    dynamic deletedAt,
    String? nameKey,
  }) =>
      StuExamModel(
        id: id ?? this.id,
        examinationName: examinationName ?? this.examinationName,
        status: status ?? this.status,
        deletedAt: deletedAt ?? this.deletedAt,
        nameKey: nameKey ?? this.nameKey,
      );

  factory StuExamModel.fromJson(String str) =>
      StuExamModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StuExamModel.fromMap(Map<String, dynamic> json) => StuExamModel(
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
