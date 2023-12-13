// To parse this JSON data, do
//
//     final noticeDataModel = noticeDataModelFromMap(jsonString);

import 'dart:convert';

NoticeDataModel noticeDataModelFromMap(String str) =>
    NoticeDataModel.fromMap(json.decode(str));

String noticeDataModelToMap(NoticeDataModel data) => json.encode(data.toMap());

class NoticeDataModel {
  final int? id;
  final String? docNumber;
  final int? webPublishBy;
  final DateTime? webPublishTime;
  final String? sentRequest;
  final String? type;
  final int? status;
  final int? siteId;
  final int? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? noticeTitle;
  final String? noticeDescription;
  final List<FileElement>? files;
  final List<Translation>? translations;

  NoticeDataModel({
    this.id,
    this.docNumber,
    this.webPublishBy,
    this.webPublishTime,
    this.sentRequest,
    this.type,
    this.status,
    this.siteId,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.noticeTitle,
    this.noticeDescription,
    this.files,
    this.translations,
  });

  NoticeDataModel copyWith({
    int? id,
    String? docNumber,
    int? webPublishBy,
    DateTime? webPublishTime,
    String? sentRequest,
    String? type,
    int? status,
    int? siteId,
    int? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? noticeTitle,
    String? noticeDescription,
    List<FileElement>? files,
    List<Translation>? translations,
  }) =>
      NoticeDataModel(
        id: id ?? this.id,
        docNumber: docNumber ?? this.docNumber,
        webPublishBy: webPublishBy ?? this.webPublishBy,
        webPublishTime: webPublishTime ?? this.webPublishTime,
        sentRequest: sentRequest ?? this.sentRequest,
        type: type ?? this.type,
        status: status ?? this.status,
        siteId: siteId ?? this.siteId,
        createdBy: createdBy ?? this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        noticeTitle: noticeTitle ?? this.noticeTitle,
        noticeDescription: noticeDescription ?? this.noticeDescription,
        files: files ?? this.files,
        translations: translations ?? this.translations,
      );

  factory NoticeDataModel.fromMap(Map<String, dynamic> json) => NoticeDataModel(
        id: json["id"],
        docNumber: json["doc_number"],
        webPublishBy: json["web_publish_by"],
        webPublishTime: json["web_publish_time"] == null
            ? null
            : DateTime.parse(json["web_publish_time"]),
        sentRequest: json["sent_request"],
        type: json["type"],
        status: json["status"],
        siteId: json["site_id"],
        createdBy: json["created_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        noticeTitle: json["notice_title"],
        noticeDescription: json["notice_description"],
        files: json["files"] == null
            ? []
            : List<FileElement>.from(
                json["files"]!.map((x) => FileElement.fromMap(x))),
        translations: json["translations"] == null
            ? []
            : List<Translation>.from(
                json["translations"]!.map((x) => Translation.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "doc_number": docNumber,
        "web_publish_by": webPublishBy,
        "web_publish_time": webPublishTime?.toIso8601String(),
        "sent_request": sentRequest,
        "type": type,
        "status": status,
        "site_id": siteId,
        "created_by": createdBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "notice_title": noticeTitle,
        "notice_description": noticeDescription,
        "files": files == null
            ? []
            : List<dynamic>.from(files!.map((x) => x.toMap())),
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toMap())),
      };
}

class FileElement {
  final int? id;
  final int? userId;
  final int? imageableId;
  final String? imageableType;
  final String? name;
  final String? path;
  final dynamic extension;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  FileElement({
    this.id,
    this.userId,
    this.imageableId,
    this.imageableType,
    this.name,
    this.path,
    this.extension,
    this.createdAt,
    this.updatedAt,
  });

  FileElement copyWith({
    int? id,
    int? userId,
    int? imageableId,
    String? imageableType,
    String? name,
    String? path,
    dynamic extension,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      FileElement(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        imageableId: imageableId ?? this.imageableId,
        imageableType: imageableType ?? this.imageableType,
        name: name ?? this.name,
        path: path ?? this.path,
        extension: extension ?? this.extension,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory FileElement.fromMap(Map<String, dynamic> json) => FileElement(
        id: json["id"],
        userId: json["user_id"],
        imageableId: json["imageable_id"],
        imageableType: json["imageable_type"],
        name: json["name"],
        path: json["path"],
        extension: json["extension"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "imageable_id": imageableId,
        "imageable_type": imageableType,
        "name": name,
        "path": path,
        "extension": extension,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Translation {
  final int? id;
  final int? noticeId;
  final String? noticeTitle;
  final String? noticeDescription;
  final String? locale;

  Translation({
    this.id,
    this.noticeId,
    this.noticeTitle,
    this.noticeDescription,
    this.locale,
  });

  Translation copyWith({
    int? id,
    int? noticeId,
    String? noticeTitle,
    String? noticeDescription,
    String? locale,
  }) =>
      Translation(
        id: id ?? this.id,
        noticeId: noticeId ?? this.noticeId,
        noticeTitle: noticeTitle ?? this.noticeTitle,
        noticeDescription: noticeDescription ?? this.noticeDescription,
        locale: locale ?? this.locale,
      );

  factory Translation.fromMap(Map<String, dynamic> json) => Translation(
        id: json["id"],
        noticeId: json["notice_id"],
        noticeTitle: json["notice_title"],
        noticeDescription: json["notice_description"],
        locale: json["locale"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "notice_id": noticeId,
        "notice_title": noticeTitle,
        "notice_description": noticeDescription,
        "locale": locale,
      };
}
