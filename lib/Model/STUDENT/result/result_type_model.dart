import 'dart:convert';

class StuResultTypeModel {
  static String get getDataListJsonKey => "result_primary_type_list";

  final int? id;
  final String? name;

  StuResultTypeModel({
    this.id,
    this.name,
  });

  StuResultTypeModel copyWith({
    int? id,
    String? name,
  }) =>
      StuResultTypeModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory StuResultTypeModel.fromJson(String str) =>
      StuResultTypeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StuResultTypeModel.fromMap(Map<String, dynamic> json) =>
      StuResultTypeModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}
