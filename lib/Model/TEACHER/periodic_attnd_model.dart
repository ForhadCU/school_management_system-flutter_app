
import 'dart:convert';

class TeachPeriodicAttendanceModel {
  static String get getParentJsonKey => "manualAttendanceList";
  int? currentPage;
  List<PeriodicAttendanceData>? periodicAttendanceDataList;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  String? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  TeachPeriodicAttendanceModel({
    this.currentPage,
    this.periodicAttendanceDataList,
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

  TeachPeriodicAttendanceModel copyWith({
    int? currentPage,
    List<PeriodicAttendanceData>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    String? nextPageUrl,
    String? path,
    String? perPage,
    dynamic prevPageUrl,
    int? to,
    int? total,
  }) =>
      TeachPeriodicAttendanceModel(
        currentPage: currentPage ?? this.currentPage,
        periodicAttendanceDataList: data ?? this.periodicAttendanceDataList,
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

  factory TeachPeriodicAttendanceModel.fromJson(String str) =>
      TeachPeriodicAttendanceModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TeachPeriodicAttendanceModel.fromMap(Map<String, dynamic> json) =>
      TeachPeriodicAttendanceModel(
        currentPage: json["current_page"],
        periodicAttendanceDataList: json["data"] == null
            ? []
            : List<PeriodicAttendanceData>.from(
                json["data"]!.map((x) => PeriodicAttendanceData.fromMap(x))),
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
        "data": periodicAttendanceDataList == null
            ? []
            : List<dynamic>.from(periodicAttendanceDataList!.map((x) => x.toMap())),
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

class PeriodicAttendanceData {
  int? id;
  int? academicGroupId;
  String? username;
  String? latestPhoto;
  DateTime? date;
  dynamic periodicId;
  int? present;
  int? classPresent;
  String? stStatus;
  int? stStatusInt;
  dynamic absent;
  int? inLeave;
  dynamic leaveId;
  String? studentRollNumber;
  String? contactNumber;
  String? fullName;
  int? academicShiftId;
  String? note;
  String? presentType;
  String? inTime;
  String? outTime;
  DateTime? presentDate;
  dynamic lateStatus;
  int? siteId;
  dynamic updatedAt;

  PeriodicAttendanceData({
    this.id,
    this.academicGroupId,
    this.username,
    this.latestPhoto,
    this.date,
    this.periodicId,
    this.present,
    this.classPresent,
    this.stStatus,
    this.stStatusInt,
    this.absent,
    this.inLeave,
    this.leaveId,
    this.studentRollNumber,
    this.contactNumber,
    this.fullName,
    this.academicShiftId,
    this.note,
    this.presentType,
    this.inTime,
    this.outTime,
    this.presentDate,
    this.lateStatus,
    this.siteId,
    this.updatedAt,
  });

  PeriodicAttendanceData copyWith({
    int? id,
    int? academicGroupId,
    String? username,
    String? latestPhoto,
    DateTime? date,
    dynamic periodicId,
    int? present,
    int? classPresent,
    String? stStatus,
    int? stStatusInt,
    dynamic absent,
    int? inLeave,
    dynamic leaveId,
    String? studentRollNumber,
    String? contactNumber,
    String? fullName,
    int? academicShiftId,
    String? note,
    String? presentType,
    String? inTime,
    String? outTime,
    DateTime? presentDate,
    bool? lateStatus,
    int? siteId,
    dynamic updatedAt,
  }) =>
      PeriodicAttendanceData(
        id: id ?? this.id,
        academicGroupId: academicGroupId ?? this.academicGroupId,
        username: username ?? this.username,
        latestPhoto: latestPhoto ?? this.latestPhoto,
        date: date ?? this.date,
        periodicId: periodicId ?? this.periodicId,
        present: present ?? this.present,
        classPresent: classPresent ?? this.classPresent,
        stStatus: stStatus ?? this.stStatus,
        stStatusInt: stStatusInt ?? this.stStatusInt,
        absent: absent ?? this.absent,
        inLeave: inLeave ?? this.inLeave,
        leaveId: leaveId ?? this.leaveId,
        studentRollNumber: studentRollNumber ?? this.studentRollNumber,
        contactNumber: contactNumber ?? this.contactNumber,
        fullName: fullName ?? this.fullName,
        academicShiftId: academicShiftId ?? this.academicShiftId,
        note: note ?? this.note,
        presentType: presentType ?? this.presentType,
        inTime: inTime ?? this.inTime,
        outTime: outTime ?? this.outTime,
        presentDate: presentDate ?? this.presentDate,
        lateStatus: lateStatus ?? this.lateStatus,
        siteId: siteId ?? this.siteId,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory PeriodicAttendanceData.fromJson(String str) =>
      PeriodicAttendanceData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PeriodicAttendanceData.fromMap(Map<String, dynamic> json) =>
      PeriodicAttendanceData(
        id: json["id"],
        academicGroupId: json["academic_group_id"],
        username: json["username"],
        latestPhoto: json["latest_photo"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        periodicId: json["periodic_id"],
        present: json["present"],
        classPresent: json["class_present"],
        stStatus: json["st_status"],
        stStatusInt: json["st_status_int"],
        absent: json["absent"],
        inLeave: json["in_leave"],
        leaveId: json["leave_id"],
        studentRollNumber: json["student_roll_number"],
        contactNumber: json["contact_number"],
        fullName: json["full_name"],
        academicShiftId: json["academic_shift_id"],
        note: json["note"],
        presentType: json["present_type"],
        inTime: json["in_time"],
        outTime: json["out_time"],
        presentDate: json["present_date"] == null
            ? null
            : DateTime.parse(json["present_date"]),
        lateStatus: json["late_status"],
        siteId: json["site_id"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "academic_group_id": academicGroupId,
        "username": username,
        "latest_photo": latestPhoto,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "periodic_id": periodicId,
        "present": present,
        "class_present": classPresent,
        "st_status": stStatus,
        "st_status_int": stStatusInt,
        "absent": absent,
        "in_leave": inLeave,
        "leave_id": leaveId,
        "student_roll_number": studentRollNumber,
        "contact_number": contactNumber,
        "full_name": fullName,
        "academic_shift_id": academicShiftId,
        "note": note,
        "present_type": presentType,
        "in_time": inTime,
        "out_time": outTime,
        "present_date":
            "${presentDate!.year.toString().padLeft(4, '0')}-${presentDate!.month.toString().padLeft(2, '0')}-${presentDate!.day.toString().padLeft(2, '0')}",
        "late_status": lateStatus,
        "site_id": siteId,
        "updated_at": updatedAt,
      };
}
