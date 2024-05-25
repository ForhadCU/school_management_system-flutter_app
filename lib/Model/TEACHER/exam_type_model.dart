import 'dart:convert';

class ExamTypeModel {
  List<ExamTypeListForAttandance>? examTypeList;
  String? mode;
  String? status;

  ExamTypeModel({
    this.examTypeList,
    this.mode,
    this.status,
  });

  factory ExamTypeModel.fromJson(String str) =>
      ExamTypeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamTypeModel.fromMap(Map<String, dynamic> json) => ExamTypeModel(
        examTypeList: json["exam_type_list"] == null
            ? []
            : List<ExamTypeListForAttandance>.from(
                json["exam_type_list"]!.map((x) => ExamTypeListForAttandance.fromMap(x))),
        mode: json["mode"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "exam_type_list": examTypeList == null
            ? []
            : List<dynamic>.from(examTypeList!.map((x) => x.toMap())),
        "mode": mode,
        "status": status,
      };
}

class ExamTypeListForAttandance {
  int? id;
  String? marksType;
  int? status;
  dynamic deletedAt;
  String? headKey;

  ExamTypeListForAttandance({
    this.id,
    this.marksType,
    this.status,
    this.deletedAt,
    this.headKey,
  });

  factory ExamTypeListForAttandance.fromJson(String str) =>
      ExamTypeListForAttandance.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamTypeListForAttandance.fromMap(Map<String, dynamic> json) => ExamTypeListForAttandance(
        id: json["id"],
        marksType: json["marks_type"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        headKey: json["head_key"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "marks_type": marksType,
        "status": status,
        "deleted_at": deletedAt,
        "head_key": headKey,
      };
}
