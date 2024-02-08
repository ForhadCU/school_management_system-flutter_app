import 'dart:convert';

class AcademicGroupListModel {
  final List<AcademicGroup>? academicGroupList;
  final String? mode;
  final String? status;

  AcademicGroupListModel({
    this.academicGroupList,
    this.mode,
    this.status,
  });

  AcademicGroupListModel copyWith({
    List<AcademicGroup>? academicGroupList,
    String? mode,
    String? status,
  }) =>
      AcademicGroupListModel(
        academicGroupList: academicGroupList ?? this.academicGroupList,
        mode: mode ?? this.mode,
        status: status ?? this.status,
      );

  factory AcademicGroupListModel.fromJson(String str) =>
      AcademicGroupListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AcademicGroupListModel.fromMap(Map<String, dynamic> json) =>
      AcademicGroupListModel(
        academicGroupList: json["academic_group_list"] == null
            ? []
            : List<AcademicGroup>.from(json["academic_group_list"]!
                .map((x) => AcademicGroup.fromMap(x))),
        mode: json["mode"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "academic_group_list": academicGroupList == null
            ? []
            : List<dynamic>.from(academicGroupList!.map((x) => x.toMap())),
        "mode": mode,
        "status": status,
      };
}

class AcademicGroup {
  final int? id;
  final String? academicGroupName;
  final String? academicKey;

  AcademicGroup({
    this.id,
    this.academicGroupName,
    this.academicKey,
  });

  AcademicGroup copyWith({
    int? id,
    String? academicGroupName,
    String? academicKey,
  }) =>
      AcademicGroup(
        id: id ?? this.id,
        academicGroupName: academicGroupName ?? this.academicGroupName,
        academicKey: academicKey ?? this.academicKey,
      );

  factory AcademicGroup.fromJson(String str) =>
      AcademicGroup.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AcademicGroup.fromMap(Map<String, dynamic> json) => AcademicGroup(
        id: json["id"],
        academicGroupName: json["academic_group_name"],
        academicKey: json["academic_key"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "academic_group_name": academicGroupName,
        "academic_key": academicKey,
      };
}
