import 'dart:convert';

class DummyModel {
  int? intValue;
  String? strValue;
  bool? boolValue;
  List<DummyValueModel>? dummyValueModelList;

  DummyModel({
    this.intValue,
    this.strValue,
    this.boolValue,
    this.dummyValueModelList,
  });

  factory DummyModel.fromJson(String str) =>
      DummyModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DummyModel.fromMap(Map<String, dynamic> json) => DummyModel(
        intValue: json["intValue"],
        strValue: json["strValue"],
        boolValue: json["boolValue"],
        dummyValueModelList: json["valueList"] == null
            ? []
            : List<DummyValueModel>.from(
                json["valueList"]!.map((x) => DummyValueModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "intValue": intValue,
        "strValue": strValue,
        "boolValue": boolValue,
        "valueList": dummyValueModelList == null
            ? []
            : List<dynamic>.from(dummyValueModelList!.map((x) => x.toMap())),
      };
}

class DummyValueModel {
  String? name;

  DummyValueModel({
    this.name,
  });

  factory DummyValueModel.fromJson(String str) =>
      DummyValueModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DummyValueModel.fromMap(Map<String, dynamic> json) => DummyValueModel(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}
