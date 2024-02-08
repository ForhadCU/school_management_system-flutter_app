import 'dart:convert';

class TeachsavePeriodicAttendanceModel {
  List<ManualAttendanceList>? manualAttendanceList;

  TeachsavePeriodicAttendanceModel({
    this.manualAttendanceList,
  });

  TeachsavePeriodicAttendanceModel copyWith({
    List<ManualAttendanceList>? manualAttendanceList,
  }) =>
      TeachsavePeriodicAttendanceModel(
        manualAttendanceList: manualAttendanceList ?? this.manualAttendanceList,
      );

  factory TeachsavePeriodicAttendanceModel.fromJson(String str) =>
      TeachsavePeriodicAttendanceModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TeachsavePeriodicAttendanceModel.fromMap(Map<String, dynamic> json) =>
      TeachsavePeriodicAttendanceModel(
        manualAttendanceList: json["manualAttendanceList"] == null
            ? []
            : List<ManualAttendanceList>.from(json["manualAttendanceList"]!
                .map((x) => ManualAttendanceList.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "manualAttendanceList": manualAttendanceList == null
            ? []
            : List<dynamic>.from(manualAttendanceList!.map((x) => x.toMap())),
      };
}

class ManualAttendanceList {
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

  ManualAttendanceList({
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

  ManualAttendanceList copyWith({
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
      ManualAttendanceList(
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

  factory ManualAttendanceList.fromJson(String str) =>
      ManualAttendanceList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ManualAttendanceList.fromMap(Map<String, dynamic> json) =>
      ManualAttendanceList(
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
