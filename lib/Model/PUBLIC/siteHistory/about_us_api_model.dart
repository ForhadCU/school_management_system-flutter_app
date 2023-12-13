// To parse this JSON data, do
//
//     final siteHistoryApiModel = siteHistoryApiModelFromMap(jsonString);

import 'dart:convert';

AboutUsApiModel siteHistoryApiModelFromMap(String str) => AboutUsApiModel.fromMap(json.decode(str));

String siteHistoryApiModelToMap(AboutUsApiModel data) => json.encode(data.toMap());

class AboutUsApiModel {
    final AboutUs? aboutUs;
    final String? mode;
    final String? status;

    AboutUsApiModel({
        this.aboutUs,
        this.mode,
        this.status,
    });

    AboutUsApiModel copyWith({
        AboutUs? aboutUs,
        String? mode,
        String? status,
    }) => 
        AboutUsApiModel(
            aboutUs: aboutUs ?? this.aboutUs,
            mode: mode ?? this.mode,
            status: status ?? this.status,
        );

    factory AboutUsApiModel.fromMap(Map<String, dynamic> json) => AboutUsApiModel(
        aboutUs: json["about_us"] == null ? null : AboutUs.fromMap(json["about_us"]),
        mode: json["mode"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "about_us": aboutUs?.toMap(),
        "mode": mode,
        "status": status,
    };
}

class AboutUs {
    final int? id;
    final String? description;
    final String? title;
    final dynamic image;

    AboutUs({
        this.id,
        this.description,
        this.title,
        this.image,
    });

    AboutUs copyWith({
        int? id,
        String? description,
        String? title,
        dynamic image,
    }) => 
        AboutUs(
            id: id ?? this.id,
            description: description ?? this.description,
            title: title ?? this.title,
            image: image ?? this.image,
        );

    factory AboutUs.fromMap(Map<String, dynamic> json) => AboutUs(
        id: json["id"],
        description: json["description"],
        title: json["title"],
        image: json["image"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "description": description,
        "title": title,
        "image": image,
    };
}
