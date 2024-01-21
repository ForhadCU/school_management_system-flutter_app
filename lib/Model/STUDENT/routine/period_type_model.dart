import 'dart:convert';

class StuPeriodicTypeModel {
    final int? id;
    final String? typeName;

  static String get getDataListJsonKey => "academic_period_type_list";

    StuPeriodicTypeModel({
        this.id,
        this.typeName,
    });

    StuPeriodicTypeModel copyWith({
        int? id,
        String? typeName,
    }) => 
        StuPeriodicTypeModel(
            id: id ?? this.id,
            typeName: typeName ?? this.typeName,
        );

    factory StuPeriodicTypeModel.fromJson(String str) => StuPeriodicTypeModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory StuPeriodicTypeModel.fromMap(Map<String, dynamic> json) => StuPeriodicTypeModel(
        id: json["id"],
        typeName: json["type_name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "type_name": typeName,
    };
}
