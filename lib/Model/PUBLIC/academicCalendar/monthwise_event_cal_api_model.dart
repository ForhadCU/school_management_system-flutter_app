// To parse this JSON data, do
//
//     final monthWiseEventCalendarApiModel = monthWiseEventCalendarApiModelFromMap(jsonString);

import 'dart:convert';

MonthWiseEventCalendarApiModel monthWiseEventCalendarApiModelFromMap(String str) => MonthWiseEventCalendarApiModel.fromMap(json.decode(str));

String monthWiseEventCalendarApiModelToMap(MonthWiseEventCalendarApiModel data) => json.encode(data.toMap());

class MonthWiseEventCalendarApiModel {
    final MonthWiseCalendarData? monthWiseCalendarData;
    final String? mode;
    final String? status;

    MonthWiseEventCalendarApiModel({
        this.monthWiseCalendarData,
        this.mode,
        this.status,
    });

    MonthWiseEventCalendarApiModel copyWith({
        MonthWiseCalendarData? monthWiseCalendarData,
        String? mode,
        String? status,
    }) => 
        MonthWiseEventCalendarApiModel(
            monthWiseCalendarData: monthWiseCalendarData ?? this.monthWiseCalendarData,
            mode: mode ?? this.mode,
            status: status ?? this.status,
        );

    factory MonthWiseEventCalendarApiModel.fromMap(Map<String, dynamic> json) => MonthWiseEventCalendarApiModel(
        monthWiseCalendarData: json["month_wise_calendar_data"] == null ? null : MonthWiseCalendarData.fromMap(json["month_wise_calendar_data"]),
        mode: json["mode"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "month_wise_calendar_data": monthWiseCalendarData?.toMap(),
        "mode": mode,
        "status": status,
    };
}

class MonthWiseCalendarData {
    final List<List<EventDateList>>? eventDateList;
    final List<CCalendarHead>? acCalendarHead;

    MonthWiseCalendarData({
        this.eventDateList,
        this.acCalendarHead,
    });

    MonthWiseCalendarData copyWith({
        List<List<EventDateList>>? eventDateList,
        List<CCalendarHead>? acCalendarHead,
    }) => 
        MonthWiseCalendarData(
            eventDateList: eventDateList ?? this.eventDateList,
            acCalendarHead: acCalendarHead ?? this.acCalendarHead,
        );

    factory MonthWiseCalendarData.fromMap(Map<String, dynamic> json) => MonthWiseCalendarData(
        eventDateList: json["event_date_list"] == null ? [] : List<List<EventDateList>>.from(json["event_date_list"]!.map((x) => List<EventDateList>.from(x.map((x) => EventDateList.fromMap(x))))),
        acCalendarHead: json["ac_calendar_head"] == null ? [] : List<CCalendarHead>.from(json["ac_calendar_head"]!.map((x) => CCalendarHead.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "event_date_list": eventDateList == null ? [] : List<dynamic>.from(eventDateList!.map((x) => List<dynamic>.from(x.map((x) => x.toMap())))),
        "ac_calendar_head": acCalendarHead == null ? [] : List<dynamic>.from(acCalendarHead!.map((x) => x.toMap())),
    };
}

class CCalendarHead {
    final int? id;
    final Name? name;
    final ColorId? colorId;
    final ColorName? colorName;
    final int? status;
    final dynamic createdAt;
    final dynamic updatedAt;
    final HeadKey? headKey;

    CCalendarHead({
        this.id,
        this.name,
        this.colorId,
        this.colorName,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.headKey,
    });

    CCalendarHead copyWith({
        int? id,
        Name? name,
        ColorId? colorId,
        ColorName? colorName,
        int? status,
        dynamic createdAt,
        dynamic updatedAt,
        HeadKey? headKey,
    }) => 
        CCalendarHead(
            id: id ?? this.id,
            name: name ?? this.name,
            colorId: colorId ?? this.colorId,
            colorName: colorName ?? this.colorName,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            headKey: headKey ?? this.headKey,
        );

    factory CCalendarHead.fromMap(Map<String, dynamic> json) => CCalendarHead(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        colorId: colorIdValues.map[json["color_id"]]!,
        colorName: colorNameValues.map[json["color_name"]]!,
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        headKey: headKeyValues.map[json["head_key"]]!,
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": nameValues.reverse[name],
        "color_id": colorIdValues.reverse[colorId],
        "color_name": colorNameValues.reverse[colorName],
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "head_key": headKeyValues.reverse[headKey],
    };
}

enum ColorId {
    FF0000,
    THE_0000_FF,
    THE_008000
}

final colorIdValues = EnumValues({
    "#FF0000": ColorId.FF0000,
    "#0000FF": ColorId.THE_0000_FF,
    "#008000": ColorId.THE_008000
});

enum ColorName {
    BLUE,
    GREEN,
    RED
}

final colorNameValues = EnumValues({
    "Blue": ColorName.BLUE,
    "Green": ColorName.GREEN,
    "Red": ColorName.RED
});

enum HeadKey {
    EVENT,
    EXAMINATION,
    HOLIDAY
}

final headKeyValues = EnumValues({
    "event": HeadKey.EVENT,
    "examination": HeadKey.EXAMINATION,
    "holiday": HeadKey.HOLIDAY
});

enum Name {
    EVENT,
    EXAMINATION,
    HOLIDAY
}

final nameValues = EnumValues({
    "Event": Name.EVENT,
    "Examination": Name.EXAMINATION,
    "Holiday": Name.HOLIDAY
});

class EventDateList {
    final DateTime? activateDate;
    final DateTime? startDate;
    final DateTime? endDate;
    final Title? title;
    final dynamic description;
    final int? academicCalendarHeadId;
    final SubheadColorId? subheadColorId;
    final DayName? dayName;
    final HeadKey? eventType;
    final int? academicGroupId;
    final int? siteId;
    final CCalendarHead? academicCalendarHead;

    EventDateList({
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

    EventDateList copyWith({
        DateTime? activateDate,
        DateTime? startDate,
        DateTime? endDate,
        Title? title,
        dynamic description,
        int? academicCalendarHeadId,
        SubheadColorId? subheadColorId,
        DayName? dayName,
        HeadKey? eventType,
        int? academicGroupId,
        int? siteId,
        CCalendarHead? academicCalendarHead,
    }) => 
        EventDateList(
            activateDate: activateDate ?? this.activateDate,
            startDate: startDate ?? this.startDate,
            endDate: endDate ?? this.endDate,
            title: title ?? this.title,
            description: description ?? this.description,
            academicCalendarHeadId: academicCalendarHeadId ?? this.academicCalendarHeadId,
            subheadColorId: subheadColorId ?? this.subheadColorId,
            dayName: dayName ?? this.dayName,
            eventType: eventType ?? this.eventType,
            academicGroupId: academicGroupId ?? this.academicGroupId,
            siteId: siteId ?? this.siteId,
            academicCalendarHead: academicCalendarHead ?? this.academicCalendarHead,
        );

    factory EventDateList.fromMap(Map<String, dynamic> json) => EventDateList(
        activateDate: json["activate_date"] == null ? null : DateTime.parse(json["activate_date"]),
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        title: titleValues.map[json["title"]]!,
        description: json["description"],
        academicCalendarHeadId: json["academic_calendar_head_id"],
        subheadColorId: subheadColorIdValues.map[json["subhead_color_id"]]!,
        dayName: dayNameValues.map[json["day_name"]]!,
        eventType: headKeyValues.map[json["event_type"]]!,
        academicGroupId: json["academic_group_id"],
        siteId: json["site_id"],
        academicCalendarHead: json["academic_calendar_head"] == null ? null : CCalendarHead.fromMap(json["academic_calendar_head"]),
    );

    Map<String, dynamic> toMap() => {
        "activate_date": "${activateDate!.year.toString().padLeft(4, '0')}-${activateDate!.month.toString().padLeft(2, '0')}-${activateDate!.day.toString().padLeft(2, '0')}",
        "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "title": titleValues.reverse[title],
        "description": description,
        "academic_calendar_head_id": academicCalendarHeadId,
        "subhead_color_id": subheadColorIdValues.reverse[subheadColorId],
        "day_name": dayNameValues.reverse[dayName],
        "event_type": headKeyValues.reverse[eventType],
        "academic_group_id": academicGroupId,
        "site_id": siteId,
        "academic_calendar_head": academicCalendarHead?.toMap(),
    };
}

enum DayName {
    FRI,
    SAT
}

final dayNameValues = EnumValues({
    "Fri": DayName.FRI,
    "Sat": DayName.SAT
});

enum SubheadColorId {
    DB7093
}

final subheadColorIdValues = EnumValues({
    "#DB7093": SubheadColorId.DB7093
});

enum Title {
    WEEKLY_HOLIDAY
}

final titleValues = EnumValues({
    "Weekly Holiday": Title.WEEKLY_HOLIDAY
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
