// To parse this JSON data, do
//
//     final sitelistModel = sitelistModelFromMap(jsonString);

import 'dart:convert';

SitelistModel sitelistModelFromMap(String str) => SitelistModel.fromMap(json.decode(str));

String sitelistModelToMap(SitelistModel data) => json.encode(data.toMap());

class SitelistModel {
    final int? id;
    final dynamic siteNameNativeLanguage;
    final String? siteAlias;
    final String? siteLogo;
    final String? siteEmail;
    final String? sitePhone;
    final int? eiin;
    final dynamic collegeCode;
    final dynamic nuCode;
    final dynamic googleMapAddress;
    final dynamic facebookLink;
    final dynamic twitterLink;
    final dynamic googleLink;
    final dynamic youtubeLink;
    final String? siteName;
    final String? shortName;
    final String? address;
    final List<Translation>? translations;

    SitelistModel({
        this.id,
        this.siteNameNativeLanguage,
        this.siteAlias,
        this.siteLogo,
        this.siteEmail,
        this.sitePhone,
        this.eiin,
        this.collegeCode,
        this.nuCode,
        this.googleMapAddress,
        this.facebookLink,
        this.twitterLink,
        this.googleLink,
        this.youtubeLink,
        this.siteName,
        this.shortName,
        this.address,
        this.translations,
    });

    SitelistModel copyWith({
        int? id,
        dynamic siteNameNativeLanguage,
        String? siteAlias,
        String? siteLogo,
        String? siteEmail,
        String? sitePhone,
        int? eiin,
        dynamic collegeCode,
        dynamic nuCode,
        dynamic googleMapAddress,
        dynamic facebookLink,
        dynamic twitterLink,
        dynamic googleLink,
        dynamic youtubeLink,
        String? siteName,
        String? shortName,
        String? address,
        List<Translation>? translations,
    }) => 
        SitelistModel(
            id: id ?? this.id,
            siteNameNativeLanguage: siteNameNativeLanguage ?? this.siteNameNativeLanguage,
            siteAlias: siteAlias ?? this.siteAlias,
            siteLogo: siteLogo ?? this.siteLogo,
            siteEmail: siteEmail ?? this.siteEmail,
            sitePhone: sitePhone ?? this.sitePhone,
            eiin: eiin ?? this.eiin,
            collegeCode: collegeCode ?? this.collegeCode,
            nuCode: nuCode ?? this.nuCode,
            googleMapAddress: googleMapAddress ?? this.googleMapAddress,
            facebookLink: facebookLink ?? this.facebookLink,
            twitterLink: twitterLink ?? this.twitterLink,
            googleLink: googleLink ?? this.googleLink,
            youtubeLink: youtubeLink ?? this.youtubeLink,
            siteName: siteName ?? this.siteName,
            shortName: shortName ?? this.shortName,
            address: address ?? this.address,
            translations: translations ?? this.translations,
        );

    factory SitelistModel.fromMap(Map<String, dynamic> json) => SitelistModel(
        id: json["id"],
        siteNameNativeLanguage: json["site_name_native_language"],
        siteAlias: json["site_alias"],
        siteLogo: json["site_logo"],
        siteEmail: json["site_email"],
        sitePhone: json["site_phone"],
        eiin: json["eiin"],
        collegeCode: json["college_code"],
        nuCode: json["nu_code"],
        googleMapAddress: json["google_map_address"],
        facebookLink: json["facebook_link"],
        twitterLink: json["twitter_link"],
        googleLink: json["google_link"],
        youtubeLink: json["youtube_link"],
        siteName: json["site_name"],
        shortName: json["short_name"],
        address: json["address"],
        translations: json["translations"] == null ? [] : List<Translation>.from(json["translations"]!.map((x) => Translation.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "site_name_native_language": siteNameNativeLanguage,
        "site_alias": siteAlias,
        "site_logo": siteLogo,
        "site_email": siteEmail,
        "site_phone": sitePhone,
        "eiin": eiin,
        "college_code": collegeCode,
        "nu_code": nuCode,
        "google_map_address": googleMapAddress,
        "facebook_link": facebookLink,
        "twitter_link": twitterLink,
        "google_link": googleLink,
        "youtube_link": youtubeLink,
        "site_name": siteName,
        "short_name": shortName,
        "address": address,
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x.toMap())),
    };
}

class Translation {
    final int? id;
    final int? siteInfoId;
    final String? siteName;
    final String? shortName;
    final String? address;
    final String? locale;

    Translation({
        this.id,
        this.siteInfoId,
        this.siteName,
        this.shortName,
        this.address,
        this.locale,
    });

    Translation copyWith({
        int? id,
        int? siteInfoId,
        String? siteName,
        String? shortName,
        String? address,
        String? locale,
    }) => 
        Translation(
            id: id ?? this.id,
            siteInfoId: siteInfoId ?? this.siteInfoId,
            siteName: siteName ?? this.siteName,
            shortName: shortName ?? this.shortName,
            address: address ?? this.address,
            locale: locale ?? this.locale,
        );

    factory Translation.fromMap(Map<String, dynamic> json) => Translation(
        id: json["id"],
        siteInfoId: json["site_info_id"],
        siteName: json["site_name"],
        shortName: json["short_name"],
        address: json["address"],
        locale: json["locale"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "site_info_id": siteInfoId,
        "site_name": siteName,
        "short_name": shortName,
        "address": address,
        "locale": locale,
    };
}
