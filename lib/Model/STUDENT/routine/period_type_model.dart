import 'dart:convert';

class PeriodicTypeModel {
  final int? id;
  final String? typeName;

  static String get getDataListJsonKey => "academic_period_type_list";

  PeriodicTypeModel({
    this.id,
    this.typeName,
  });

  PeriodicTypeModel copyWith({
    int? id,
    String? typeName,
  }) =>
      PeriodicTypeModel(
        id: id ?? this.id,
        typeName: typeName ?? this.typeName,
      );

  factory PeriodicTypeModel.fromJson(String str) =>
      PeriodicTypeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PeriodicTypeModel.fromMap(Map<String, dynamic> json) =>
      PeriodicTypeModel(
        id: json["id"],
        typeName: json["type_name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "type_name": typeName,
      };
}
