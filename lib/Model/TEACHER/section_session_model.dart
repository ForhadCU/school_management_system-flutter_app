import 'dart:convert';

class SectionSessionModel {
    final List<AcademicSection>? academicSectionList;
    final List<AcademicSession>? academicSessionList;
    final String? mode;
    final String? status;

    SectionSessionModel({
        this.academicSectionList,
        this.academicSessionList,
        this.mode,
        this.status,
    });

    SectionSessionModel copyWith({
        List<AcademicSection>? academicSectionList,
        List<AcademicSession>? academicSessionList,
        String? mode,
        String? status,
    }) => 
        SectionSessionModel(
            academicSectionList: academicSectionList ?? this.academicSectionList,
            academicSessionList: academicSessionList ?? this.academicSessionList,
            mode: mode ?? this.mode,
            status: status ?? this.status,
        );

    factory SectionSessionModel.fromJson(String str) => SectionSessionModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SectionSessionModel.fromMap(Map<String, dynamic> json) => SectionSessionModel(
        academicSectionList: json["academic_section_list"] == null ? [] : List<AcademicSection>.from(json["academic_section_list"]!.map((x) => AcademicSection.fromMap(x))),
        academicSessionList: json["academic_session_list"] == null ? [] : List<AcademicSession>.from(json["academic_session_list"]!.map((x) => AcademicSession.fromMap(x))),
        mode: json["mode"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "academic_section_list": academicSectionList == null ? [] : List<dynamic>.from(academicSectionList!.map((x) => x.toMap())),
        "academic_session_list": academicSessionList == null ? [] : List<dynamic>.from(academicSessionList!.map((x) => x.toMap())),
        "mode": mode,
        "status": status,
    };
}

class AcademicSection {
    final int? id;
    final String? sectionName;

    AcademicSection({
        this.id,
        this.sectionName,
    });

    AcademicSection copyWith({
        int? id,
        String? sectionName,
    }) => 
        AcademicSection(
            id: id ?? this.id,
            sectionName: sectionName ?? this.sectionName,
        );

    factory AcademicSection.fromJson(String str) => AcademicSection.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AcademicSection.fromMap(Map<String, dynamic> json) => AcademicSection(
        id: json["id"],
        sectionName: json["section_name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "section_name": sectionName,
    };
}

class AcademicSession {
    final int? id;
    final String? sessionName;

    AcademicSession({
        this.id,
        this.sessionName,
    });

    AcademicSession copyWith({
        int? id,
        String? sessionName,
    }) => 
        AcademicSession(
            id: id ?? this.id,
            sessionName: sessionName ?? this.sessionName,
        );

    factory AcademicSession.fromJson(String str) => AcademicSession.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AcademicSession.fromMap(Map<String, dynamic> json) => AcademicSession(
        id: json["id"],
        sessionName: json["session_name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "session_name": sessionName,
    };
}
