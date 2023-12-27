import 'dart:convert';

class StuPaymentMethodModel {
    static String get getDataListJsonKey => "payment_method_list";

  
    final int? id;
    final String? name;
    final String? nameKey;

    StuPaymentMethodModel({
        this.id,
        this.name,
        this.nameKey,
    });

    StuPaymentMethodModel copyWith({
        int? id,
        String? name,
        String? nameKey,
    }) => 
        StuPaymentMethodModel(
            id: id ?? this.id,
            name: name ?? this.name,
            nameKey: nameKey ?? this.nameKey,
        );

    factory StuPaymentMethodModel.fromJson(String str) => StuPaymentMethodModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory StuPaymentMethodModel.fromMap(Map<String, dynamic> json) => StuPaymentMethodModel(
        id: json["id"],
        name: json["name"],
        nameKey: json["name_key"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "name_key": nameKey,
    };
}
