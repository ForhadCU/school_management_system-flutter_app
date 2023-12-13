// To parse this JSON data, do
//
//     final noticeApiModel = noticeApiModelFromMap(jsonString);

import 'dart:convert';

NoticeApiModel noticeApiModelFromMap(String str) => NoticeApiModel.fromMap(json.decode(str));

String noticeApiModelToMap(NoticeApiModel data) => json.encode(data.toMap());

class NoticeApiModel {
    final int? currentPage;
    final List<Datum>? data;
    final String? firstPageUrl;
    final int? from;
    final int? lastPage;
    final String? lastPageUrl;
    final String? nextPageUrl;
    final String? path;
    final String? perPage;
    final dynamic prevPageUrl;
    final int? to;
    final int? total;

    NoticeApiModel({
        this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total,
    });

    NoticeApiModel copyWith({
        int? currentPage,
        List<Datum>? data,
        String? firstPageUrl,
        int? from,
        int? lastPage,
        String? lastPageUrl,
        String? nextPageUrl,
        String? path,
        String? perPage,
        dynamic prevPageUrl,
        int? to,
        int? total,
    }) => 
        NoticeApiModel(
            currentPage: currentPage ?? this.currentPage,
            data: data ?? this.data,
            firstPageUrl: firstPageUrl ?? this.firstPageUrl,
            from: from ?? this.from,
            lastPage: lastPage ?? this.lastPage,
            lastPageUrl: lastPageUrl ?? this.lastPageUrl,
            nextPageUrl: nextPageUrl ?? this.nextPageUrl,
            path: path ?? this.path,
            perPage: perPage ?? this.perPage,
            prevPageUrl: prevPageUrl ?? this.prevPageUrl,
            to: to ?? this.to,
            total: total ?? this.total,
        );

    factory NoticeApiModel.fromMap(Map<String, dynamic> json) => NoticeApiModel(
        currentPage: json["current_page"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toMap() => {
        "current_page": currentPage,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
    };
}

class Datum {
    final int? id;
    final String? docNumber;
    final int? webPublishBy;
    final DateTime? webPublishTime;
    final String? sentRequest;
    final Type? type;
    final int? status;
    final int? siteId;
    final int? createdBy;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? noticeTitle;
    final String? noticeDescription;
    final List<FileElement>? files;
    final List<Translation>? translations;

    Datum({
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

    Datum copyWith({
        int? id,
        String? docNumber,
        int? webPublishBy,
        DateTime? webPublishTime,
        String? sentRequest,
        Type? type,
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
        Datum(
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

    factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        docNumber: json["doc_number"],
        webPublishBy: json["web_publish_by"],
        webPublishTime: json["web_publish_time"] == null ? null : DateTime.parse(json["web_publish_time"]),
        sentRequest: json["sent_request"],
        type: typeValues.map[json["type"]]!,
        status: json["status"],
        siteId: json["site_id"],
        createdBy: json["created_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        noticeTitle: json["notice_title"],
        noticeDescription: json["notice_description"],
        files: json["files"] == null ? [] : List<FileElement>.from(json["files"]!.map((x) => FileElement.fromMap(x))),
        translations: json["translations"] == null ? [] : List<Translation>.from(json["translations"]!.map((x) => Translation.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "doc_number": docNumber,
        "web_publish_by": webPublishBy,
        "web_publish_time": webPublishTime?.toIso8601String(),
        "sent_request": sentRequest,
        "type": typeValues.reverse[type],
        "status": status,
        "site_id": siteId,
        "created_by": createdBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "notice_title": noticeTitle,
        "notice_description": noticeDescription,
        "files": files == null ? [] : List<dynamic>.from(files!.map((x) => x.toMap())),
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x.toMap())),
    };
}

class FileElement {
    final int? id;
    final int? userId;
    final int? imageableId;
    final ImageableType? imageableType;
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
        ImageableType? imageableType,
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
        imageableType: imageableTypeValues.map[json["imageable_type"]]!,
        name: json["name"],
        path: json["path"],
        extension: json["extension"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "imageable_id": imageableId,
        "imageable_type": imageableTypeValues.reverse[imageableType],
        "name": name,
        "path": path,
        "extension": extension,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

enum ImageableType {
    APP_MODELS_SITE_NOTICE_NOTICE
}

final imageableTypeValues = EnumValues({
    "App\\Models\\Site\\Notice\\Notice": ImageableType.APP_MODELS_SITE_NOTICE_NOTICE
});

class Translation {
    final int? id;
    final int? noticeId;
    final String? noticeTitle;
    final String? noticeDescription;
    final Locale? locale;

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
        Locale? locale,
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
        locale: localeValues.map[json["locale"]]!,
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "notice_id": noticeId,
        "notice_title": noticeTitle,
        "notice_description": noticeDescription,
        "locale": localeValues.reverse[locale],
    };
}

enum Locale {
    EN
}

final localeValues = EnumValues({
    "en": Locale.EN
});

enum Type {
    NOTICE
}

final typeValues = EnumValues({
    "notice": Type.NOTICE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
