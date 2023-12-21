// To parse this JSON data, do
//
//     final monthWiseEventCalendarApiModel = monthWiseEventCalendarApiModelFromMap(jsonString);

import 'dart:convert';

StuMonthWiseEventCalendarApiModel monthWiseEventCalendarApiModelFromMap(
        String str) =>
    StuMonthWiseEventCalendarApiModel.fromMap(json.decode(str));

String monthWiseEventCalendarApiModelToMap(
        StuMonthWiseEventCalendarApiModel data) =>
    json.encode(data.toMap());

class StuMonthWiseEventCalendarApiModel {
  final StuMonthWiseCalendarData? monthWiseCalendarData;
  final String? mode;
  final String? status;

  StuMonthWiseEventCalendarApiModel({
    this.monthWiseCalendarData,
    this.mode,
    this.status,
  });

  StuMonthWiseEventCalendarApiModel copyWith({
    StuMonthWiseCalendarData? monthWiseCalendarData,
    String? mode,
    String? status,
  }) =>
      StuMonthWiseEventCalendarApiModel(
        monthWiseCalendarData:
            monthWiseCalendarData ?? this.monthWiseCalendarData,
        mode: mode ?? this.mode,
        status: status ?? this.status,
      );

  factory StuMonthWiseEventCalendarApiModel.fromMap(Map<String, dynamic> json) =>
      StuMonthWiseEventCalendarApiModel(
        monthWiseCalendarData: json["month_wise_calendar_data"] == null
            ? null
            : StuMonthWiseCalendarData.fromMap(json["month_wise_calendar_data"]),
        mode: json["mode"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "month_wise_calendar_data": monthWiseCalendarData?.toMap(),
        "mode": mode,
        "status": status,
      };
}

class StuMonthWiseCalendarData {
  final List<List<StuEventDateList>>? eventDateList;
  final List<StuAcademicCalendarHead>? acCalendarHead;

  StuMonthWiseCalendarData({
    this.eventDateList,
    this.acCalendarHead,
  });

  StuMonthWiseCalendarData copyWith({
    List<List<StuEventDateList>>? eventDateList,
    List<StuAcademicCalendarHead>? acCalendarHead,
  }) =>
      StuMonthWiseCalendarData(
        eventDateList: eventDateList ?? this.eventDateList,
        acCalendarHead: acCalendarHead ?? this.acCalendarHead,
      );

  factory StuMonthWiseCalendarData.fromMap(Map<String, dynamic> json) =>
      StuMonthWiseCalendarData(
        eventDateList: json["event_date_list"] == null
            ? []
            : List<List<StuEventDateList>>.from(json["event_date_list"]!.map((x) =>
                List<StuEventDateList>.from(
                    x.map((x) => StuEventDateList.fromMap(x))))),
        acCalendarHead: json["ac_calendar_head"] == null
            ? []
            : List<StuAcademicCalendarHead>.from(json["ac_calendar_head"]!
                .map((x) => StuAcademicCalendarHead.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "event_date_list": eventDateList == null
            ? []
            : List<dynamic>.from(eventDateList!
                .map((x) => List<dynamic>.from(x.map((x) => x.toMap())))),
        "ac_calendar_head": acCalendarHead == null
            ? []
            : List<dynamic>.from(acCalendarHead!.map((x) => x.toMap())),
      };
}

class StuAcademicCalendarHead {
    final int? id;
    final String? name;
    final String? colorId;
    final String? colorName;
    final int? status;
    final dynamic createdAt;
    final dynamic updatedAt;
    final String? headKey;

    StuAcademicCalendarHead({
        this.id,
        this.name,
        this.colorId,
        this.colorName,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.headKey,
    });

    StuAcademicCalendarHead copyWith({
        int? id,
        String? name,
        String? colorId,
        String? colorName,
        int? status,
        dynamic createdAt,
        dynamic updatedAt,
        String? headKey,
    }) => 
        StuAcademicCalendarHead(
            id: id ?? this.id,
            name: name ?? this.name,
            colorId: colorId ?? this.colorId,
            colorName: colorName ?? this.colorName,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            headKey: headKey ?? this.headKey,
        );

    factory StuAcademicCalendarHead.fromMap(Map<String, dynamic> json) => StuAcademicCalendarHead(
        id: json["id"],
        name: json["name"],
        colorId: json["color_id"],
        colorName: json["color_name"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        headKey: json["head_key"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "color_id": colorId,
        "color_name": colorName,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "head_key": headKey,
    };
}

enum ColorId { FF0000, THE_0000_FF, THE_008000 }

final colorIdValues = EnumValues({
  "#FF0000": ColorId.FF0000,
  "#0000FF": ColorId.THE_0000_FF,
  "#008000": ColorId.THE_008000
});

enum ColorName { BLUE, GREEN, RED }

final colorNameValues = EnumValues(
    {"Blue": ColorName.BLUE, "Green": ColorName.GREEN, "Red": ColorName.RED});

enum HeadKey { EVENT, EXAMINATION, HOLIDAY }

final headKeyValues = EnumValues({
  "event": HeadKey.EVENT,
  "examination": HeadKey.EXAMINATION,
  "holiday": HeadKey.HOLIDAY
});

enum Name { EVENT, EXAMINATION, HOLIDAY }

final nameValues = EnumValues({
  "Event": Name.EVENT,
  "Examination": Name.EXAMINATION,
  "Holiday": Name.HOLIDAY
});

class StuEventDateList {
  final DateTime? activateDate;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? title;
  final dynamic description;
  final int? academicCalendarHeadId;
  final String? subheadColorId;
  final String? dayName;
  final String? eventType;
  final int? academicGroupId;
  final int? siteId;
  final StuAcademicCalendarHead? academicCalendarHead;

  StuEventDateList({
    this.activateDate,
    this.startDate,
    this.endDate,
    this.title,
    this.description,
    this.academicCalendarHeadId,
    this.subheadColorId,
    this.dayName,
    this.eventType,
    this.academicGroupId,
    this.siteId,
    this.academicCalendarHead,
  });

  StuEventDateList copyWith({
    DateTime? activateDate,
    DateTime? startDate,
    DateTime? endDate,
    String? title,
    dynamic description,
    int? academicCalendarHeadId,
    String? subheadColorId,
    String? dayName,
    String? eventType,
    int? academicGroupId,
    int? siteId,
    StuAcademicCalendarHead? academicCalendarHead,
  }) =>
      StuEventDateList(
        activateDate: activateDate ?? this.activateDate,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        title: title ?? this.title,
        description: description ?? this.description,
        academicCalendarHeadId:
            academicCalendarHeadId ?? this.academicCalendarHeadId,
        subheadColorId: subheadColorId ?? this.subheadColorId,
        dayName: dayName ?? this.dayName,
        eventType: eventType ?? this.eventType,
        academicGroupId: academicGroupId ?? this.academicGroupId,
        siteId: siteId ?? this.siteId,
        academicCalendarHead: academicCalendarHead ?? this.academicCalendarHead,
      );

  factory StuEventDateList.fromMap(Map<String, dynamic> json) => StuEventDateList(
        activateDate: json["activate_date"] == null
            ? null
            : DateTime.parse(json["activate_date"]),
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        title: json["title"],
        description: json["description"],
        academicCalendarHeadId: json["academic_calendar_head_id"],
        subheadColorId: json["subhead_color_id"],
        dayName: json["day_name"],
        eventType: json["event_type"],
        academicGroupId: json["academic_group_id"],
        siteId: json["site_id"],
        academicCalendarHead: json["academic_calendar_head"] == null
            ? null
            : StuAcademicCalendarHead.fromMap(json["academic_calendar_head"]),
      );

  Map<String, dynamic> toMap() => {
        "activate_date":
            "${activateDate!.year.toString().padLeft(4, '0')}-${activateDate!.month.toString().padLeft(2, '0')}-${activateDate!.day.toString().padLeft(2, '0')}",
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        "description": description,
        "academic_calendar_head_id": academicCalendarHeadId,
        "subhead_color_id": subheadColorId,
        "day_name": dayName,
        "event_type": eventType,
        "academic_group_id": academicGroupId,
        "site_id": siteId,
        "academic_calendar_head": academicCalendarHead?.toMap(),
      };
}

enum DayName { FRI, SAT }

final dayNameValues = EnumValues({"Fri": DayName.FRI, "Sat": DayName.SAT});

enum SubheadColorId { DB7093 }

final subheadColorIdValues = EnumValues({"#DB7093": SubheadColorId.DB7093});

enum Title { WEEKLY_HOLIDAY }

final titleValues = EnumValues({"Weekly Holiday": Title.WEEKLY_HOLIDAY});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
