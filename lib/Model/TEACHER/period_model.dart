import 'dart:convert';

class TeachPeriodModel {
  List<PeriodData>? periodDataList;
  String? mode;
  String? status;

  TeachPeriodModel({
    this.periodDataList,
    this.mode,
    this.status,
  });

  TeachPeriodModel copyWith({
    List<PeriodData>? getRoutineList,
    String? mode,
    String? status,
  }) =>
      TeachPeriodModel(
        periodDataList: getRoutineList ?? this.periodDataList,
        mode: mode ?? this.mode,
        status: status ?? this.status,
      );

  factory TeachPeriodModel.fromJson(String str) =>
      TeachPeriodModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TeachPeriodModel.fromMap(Map<String, dynamic> json) =>
      TeachPeriodModel(
        periodDataList: json["get_routine_list"] == null
            ? []
            : List<PeriodData>.from(
                json["get_routine_list"]!.map((x) => PeriodData.fromMap(x))),
        mode: json["mode"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "get_routine_list": periodDataList == null
            ? []
            : List<dynamic>.from(periodDataList!.map((x) => x.toMap())),
        "mode": mode,
        "status": status,
      };
}

class PeriodData {
  int? id;
  String? details;
  String? startTime;
  String? endTime;
  String? classTimingDetailName;
  String? className;
  String? sectionName;
  String? subjectName;
  bool? selected;
  bool? loading;
  dynamic swapCancel;
  int? totalPresent;
  int? status;
  bool? invited;
  dynamic meetingId;
  dynamic liveJoinLink;
  dynamic startUrl;

  PeriodData({
    this.id,
    this.details,
    this.startTime,
    this.endTime,
    this.classTimingDetailName,
    this.className,
    this.sectionName,
    this.subjectName,
    this.selected,
    this.loading,
    this.swapCancel,
    this.totalPresent,
    this.status,
    this.invited,
    this.meetingId,
    this.liveJoinLink,
    this.startUrl,
  });

  PeriodData copyWith({
    int? id,
    String? details,
    String? startTime,
    String? endTime,
    String? classTimingDetailName,
    String? className,
    String? sectionName,
    String? subjectName,
    bool? selected,
    bool? loading,
    dynamic swapCancel,
    int? totalPresent,
    int? status,
    bool? invited,
    dynamic meetingId,
    dynamic liveJoinLink,
    dynamic startUrl,
  }) =>
      PeriodData(
        id: id ?? this.id,
        details: details ?? this.details,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        classTimingDetailName:
            classTimingDetailName ?? this.classTimingDetailName,
        className: className ?? this.className,
        sectionName: sectionName ?? this.sectionName,
        subjectName: subjectName ?? this.subjectName,
        selected: selected ?? this.selected,
        loading: loading ?? this.loading,
        swapCancel: swapCancel ?? this.swapCancel,
        totalPresent: totalPresent ?? this.totalPresent,
        status: status ?? this.status,
        invited: invited ?? this.invited,
        meetingId: meetingId ?? this.meetingId,
        liveJoinLink: liveJoinLink ?? this.liveJoinLink,
        startUrl: startUrl ?? this.startUrl,
      );

  factory PeriodData.fromJson(String str) =>
      PeriodData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PeriodData.fromMap(Map<String, dynamic> json) => PeriodData(
        id: json["id"],
        details: json["details"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        classTimingDetailName: json["class_timing_detail_name"],
        className: json["class_name"],
        sectionName: json["section_name"],
        subjectName: json["subject_name"],
        selected: json["selected"],
        loading: json["loading"],
        swapCancel: json["swapCancel"],
        totalPresent: json["total_present"],
        status: json["status"],
        invited: json["invited"],
        meetingId: json["meeting_id"],
        liveJoinLink: json["live_join_link"],
        startUrl: json["start_url"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "details": details,
        "start_time": startTime,
        "end_time": endTime,
        "class_timing_detail_name": classTimingDetailName,
        "class_name": className,
        "section_name": sectionName,
        "subject_name": subjectName,
        "selected": selected,
        "loading": loading,
        "swapCancel": swapCancel,
        "total_present": totalPresent,
        "status": status,
        "invited": invited,
        "meeting_id": meetingId,
        "live_join_link": liveJoinLink,
        "start_url": startUrl,
      };
}
