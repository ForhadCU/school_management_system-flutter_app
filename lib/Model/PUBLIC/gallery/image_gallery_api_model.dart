// To parse this JSON data, do
//
//     final imageGalleryApiModel = imageGalleryApiModelFromMap(jsonString);

import 'dart:convert';

ImageGalleryApiModel imageGalleryApiModelFromMap(String str) => ImageGalleryApiModel.fromMap(json.decode(str));

String imageGalleryApiModelToMap(ImageGalleryApiModel data) => json.encode(data.toMap());

class ImageGalleryApiModel {
    final GalleryList? galleryList;
    final String? mode;
    final String? status;

    ImageGalleryApiModel({
        this.galleryList,
        this.mode,
        this.status,
    });

    ImageGalleryApiModel copyWith({
        GalleryList? galleryList,
        String? mode,
        String? status,
    }) => 
        ImageGalleryApiModel(
            galleryList: galleryList ?? this.galleryList,
            mode: mode ?? this.mode,
            status: status ?? this.status,
        );

    factory ImageGalleryApiModel.fromMap(Map<String, dynamic> json) => ImageGalleryApiModel(
        galleryList: json["gallery_list"] == null ? null : GalleryList.fromMap(json["gallery_list"]),
        mode: json["mode"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "gallery_list": galleryList?.toMap(),
        "mode": mode,
        "status": status,
    };
}

class GalleryList {
    final int? currentPage;
    final List<Datum>? data;
    final String? firstPageUrl;
    final int? from;
    final int? lastPage;
    final String? lastPageUrl;
    final String? nextPageUrl;
    final String? path;
    final int? perPage;
    final dynamic prevPageUrl;
    final int? to;
    final int? total;

    GalleryList({
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

    GalleryList copyWith({
        int? currentPage,
        List<Datum>? data,
        String? firstPageUrl,
        int? from,
        int? lastPage,
        String? lastPageUrl,
        String? nextPageUrl,
        String? path,
        int? perPage,
        dynamic prevPageUrl,
        int? to,
        int? total,
    }) => 
        GalleryList(
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

    factory GalleryList.fromMap(Map<String, dynamic> json) => GalleryList(
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
    final String? type;
    final int? status;
    final int? siteId;
    final int? createdBy;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? eventTitle;
    final String? eventDescription;
    final List<FileElement>? files;
    final List<Translation>? translations;

    Datum({
        this.id,
        this.type,
        this.status,
        this.siteId,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.eventTitle,
        this.eventDescription,
        this.files,
        this.translations,
    });

    Datum copyWith({
        int? id,
        String? type,
        int? status,
        int? siteId,
        int? createdBy,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? eventTitle,
        String? eventDescription,
        List<FileElement>? files,
        List<Translation>? translations,
    }) => 
        Datum(
            id: id ?? this.id,
            type: type ?? this.type,
            status: status ?? this.status,
            siteId: siteId ?? this.siteId,
            createdBy: createdBy ?? this.createdBy,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            eventTitle: eventTitle ?? this.eventTitle,
            eventDescription: eventDescription ?? this.eventDescription,
            files: files ?? this.files,
            translations: translations ?? this.translations,
        );

    factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        type: json["type"],
        status: json["status"],
        siteId: json["site_id"],
        createdBy: json["created_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        eventTitle: json["event_title"],
        eventDescription: json["event_description"],
        files: json["files"] == null ? [] : List<FileElement>.from(json["files"]!.map((x) => FileElement.fromMap(x))),
        translations: json["translations"] == null ? [] : List<Translation>.from(json["translations"]!.map((x) => Translation.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "type": type,
        "status": status,
        "site_id": siteId,
        "created_by": createdBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "event_title": eventTitle,
        "event_description": eventDescription,
        "files": files == null ? [] : List<dynamic>.from(files!.map((x) => x.toMap())),
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x.toMap())),
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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
    final int? eventId;
    final String? eventTitle;
    final String? eventDescription;
    final String? locale;

    Translation({
        this.id,
        this.eventId,
        this.eventTitle,
        this.eventDescription,
        this.locale,
    });

    Translation copyWith({
        int? id,
        int? eventId,
        String? eventTitle,
        String? eventDescription,
        String? locale,
    }) => 
        Translation(
            id: id ?? this.id,
            eventId: eventId ?? this.eventId,
            eventTitle: eventTitle ?? this.eventTitle,
            eventDescription: eventDescription ?? this.eventDescription,
            locale: locale ?? this.locale,
        );

    factory Translation.fromMap(Map<String, dynamic> json) => Translation(
        id: json["id"],
        eventId: json["event_id"],
        eventTitle: json["event_title"],
        eventDescription: json["event_description"],
        locale: json["locale"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "event_id": eventId,
        "event_title": eventTitle,
        "event_description": eventDescription,
        "locale": locale,
    };
}
