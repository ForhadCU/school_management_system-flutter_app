import 'dart:convert';

class PubAcademicSectionResModel {
    List<AcademicSectionList>? academicSectionList;
    List<dynamic>? sectionList;
    String? mode;
    String? status;

    PubAcademicSectionResModel({
        this.academicSectionList,
        this.sectionList,
        this.mode,
        this.status,
    });

    factory PubAcademicSectionResModel.fromJson(String str) => PubAcademicSectionResModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PubAcademicSectionResModel.fromMap(Map<String, dynamic> json) => PubAcademicSectionResModel(
        academicSectionList: json["academic_section_list"] == null ? [] : List<AcademicSectionList>.from(json["academic_section_list"]!.map((x) => AcademicSectionList.fromMap(x))),
        sectionList: json["section_list"] == null ? [] : List<dynamic>.from(json["section_list"]!.map((x) => x)),
        mode: json["mode"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "academic_section_list": academicSectionList == null ? [] : List<dynamic>.from(academicSectionList!.map((x) => x.toMap())),
        "section_list": sectionList == null ? [] : List<dynamic>.from(sectionList!.map((x) => x)),
        "mode": mode,
        "status": status,
    };
}

class AcademicSectionList {
    int? id;
    String? sectionName;

    AcademicSectionList({
        this.id,
        this.sectionName,
    });

    factory AcademicSectionList.fromJson(String str) => AcademicSectionList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AcademicSectionList.fromMap(Map<String, dynamic> json) => AcademicSectionList(
        id: json["id"],
        sectionName: json["section_name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "section_name": sectionName,
    };
}
