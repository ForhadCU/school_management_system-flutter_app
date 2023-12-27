import 'dart:convert';

class StuPeriodTypeModel {
  static String get getDataListJsonKey => "academic_period_type_list";

  final int? id;
  final String? typeName;
  final dynamic createdAt;
  final dynamic updatedAt;

  StuPeriodTypeModel({
    this.id,
    this.typeName,
    this.createdAt,
    this.updatedAt,
  });

  StuPeriodTypeModel copyWith({
    int? id,
    String? typeName,
    dynamic createdAt,
    dynamic updatedAt,
  }) =>
      StuPeriodTypeModel(
        id: id ?? this.id,
        typeName: typeName ?? this.typeName,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory StuPeriodTypeModel.fromJson(String str) =>
      StuPeriodTypeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StuPeriodTypeModel.fromMap(Map<String, dynamic> json) =>
      StuPeriodTypeModel(
        id: json["id"],
        typeName: json["type_name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "type_name": typeName,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
