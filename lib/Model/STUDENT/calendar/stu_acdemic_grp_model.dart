// To parse this JSON data, do
//
//     final academicGroupListApiModel = academicGroupListApiModelFromMap(jsonString);

class StuAcademicGroupModel {
    final int? id;
    final String? academicGroupName;
    final String? academicKey;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final dynamic deletedAt;
    final dynamic serial;

    StuAcademicGroupModel({
        this.id,
        this.academicGroupName,
        this.academicKey,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.serial,
    });

    StuAcademicGroupModel copyWith({
        int? id,
        String? academicGroupName,
        String? academicKey,
        DateTime? createdAt,
        DateTime? updatedAt,
        dynamic deletedAt,
        dynamic serial,
    }) => 
        StuAcademicGroupModel(
            id: id ?? this.id,
            academicGroupName: academicGroupName ?? this.academicGroupName,
            academicKey: academicKey ?? this.academicKey,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            deletedAt: deletedAt ?? this.deletedAt,
            serial: serial ?? this.serial,
        );

    factory StuAcademicGroupModel.fromMap(Map<String, dynamic> json) => StuAcademicGroupModel(
        id: json["id"],
        academicGroupName: json["academic_group_name"],
        academicKey: json["academic_key"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        serial: json["serial"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "academic_group_name": academicGroupName,
        "academic_key": academicKey,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "serial": serial,
    };
}
