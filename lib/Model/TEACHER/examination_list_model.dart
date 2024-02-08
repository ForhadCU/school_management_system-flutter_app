import 'dart:convert';

class ExaminationListModel {
    final List<Examination>? examinationList;
    final String? mode;
    final String? status;

    ExaminationListModel({
        this.examinationList,
        this.mode,
        this.status,
    });

    ExaminationListModel copyWith({
        List<Examination>? examinationList,
        String? mode,
        String? status,
    }) => 
        ExaminationListModel(
            examinationList: examinationList ?? this.examinationList,
            mode: mode ?? this.mode,
            status: status ?? this.status,
        );

    factory ExaminationListModel.fromJson(String str) => ExaminationListModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ExaminationListModel.fromMap(Map<String, dynamic> json) => ExaminationListModel(
        examinationList: json["examination_list"] == null ? [] : List<Examination>.from(json["examination_list"]!.map((x) => Examination.fromMap(x))),
        mode: json["mode"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "examination_list": examinationList == null ? [] : List<dynamic>.from(examinationList!.map((x) => x.toMap())),
        "mode": mode,
        "status": status,
    };
}

class Examination {
    final int? id;
    final String? examinationName;
    final String? nameKey;

    Examination({
        this.id,
        this.examinationName,
        this.nameKey,
    });

    Examination copyWith({
        int? id,
        String? examinationName,
        String? nameKey,
    }) => 
        Examination(
            id: id ?? this.id,
            examinationName: examinationName ?? this.examinationName,
            nameKey: nameKey ?? this.nameKey,
        );

    factory Examination.fromJson(String str) => Examination.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Examination.fromMap(Map<String, dynamic> json) => Examination(
        id: json["id"],
        examinationName: json["examination_name"],
        nameKey: json["name_key"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "examination_name": examinationName,
        "name_key": nameKey,
    };
}
