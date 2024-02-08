import 'dart:convert';

class HelpDeskModel {
  final int? id;
  final String? name;
  final int? menuSerial;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<EduSiteHelpDeskSetting>? eduSiteHelpDeskSetting;

  HelpDeskModel({
    this.id,
    this.name,
    this.menuSerial,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.eduSiteHelpDeskSetting,
  });

  HelpDeskModel copyWith({
    int? id,
    String? name,
    int? menuSerial,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<EduSiteHelpDeskSetting>? eduSiteHelpDeskSetting,
  }) =>
      HelpDeskModel(
        id: id ?? this.id,
        name: name ?? this.name,
        menuSerial: menuSerial ?? this.menuSerial,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        eduSiteHelpDeskSetting:
            eduSiteHelpDeskSetting ?? this.eduSiteHelpDeskSetting,
      );

  factory HelpDeskModel.fromJson(String str) =>
      HelpDeskModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HelpDeskModel.fromMap(Map<String, dynamic> json) => HelpDeskModel(
        id: json["id"],
        name: json["name"],
        menuSerial: json["menu_serial"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        eduSiteHelpDeskSetting: json["edu_site_help_desk_setting"] == null
            ? []
            : List<EduSiteHelpDeskSetting>.from(
                json["edu_site_help_desk_setting"]!
                    .map((x) => EduSiteHelpDeskSetting.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "menu_serial": menuSerial,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "edu_site_help_desk_setting": eduSiteHelpDeskSetting == null
            ? []
            : List<dynamic>.from(eduSiteHelpDeskSetting!.map((x) => x.toMap())),
      };
}

class EduSiteHelpDeskSetting {
  final int? id;
  final int? eduSiteHelpDeskMenuId;
  final String? helpTitle;
  final dynamic helpDescription;
  final String? videoLink;
  final int? serial;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  EduSiteHelpDeskSetting({
    this.id,
    this.eduSiteHelpDeskMenuId,
    this.helpTitle,
    this.helpDescription,
    this.videoLink,
    this.serial,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  EduSiteHelpDeskSetting copyWith({
    int? id,
    int? eduSiteHelpDeskMenuId,
    String? helpTitle,
    dynamic helpDescription,
    String? videoLink,
    int? serial,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      EduSiteHelpDeskSetting(
        id: id ?? this.id,
        eduSiteHelpDeskMenuId:
            eduSiteHelpDeskMenuId ?? this.eduSiteHelpDeskMenuId,
        helpTitle: helpTitle ?? this.helpTitle,
        helpDescription: helpDescription ?? this.helpDescription,
        videoLink: videoLink ?? this.videoLink,
        serial: serial ?? this.serial,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory EduSiteHelpDeskSetting.fromJson(String str) =>
      EduSiteHelpDeskSetting.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EduSiteHelpDeskSetting.fromMap(Map<String, dynamic> json) =>
      EduSiteHelpDeskSetting(
        id: json["id"],
        eduSiteHelpDeskMenuId: json["edu_site_help_desk_menu_id"],
        helpTitle: json["help_title"],
        helpDescription: json["help_description"],
        videoLink: json["video_link"],
        serial: json["serial"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "edu_site_help_desk_menu_id": eduSiteHelpDeskMenuId,
        "help_title": helpTitle,
        "help_description": helpDescription,
        "video_link": videoLink,
        "serial": serial,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
