import 'dart:convert';

class StuAttendanceModel {
  static String get getParentJsonKey => "attendance_list";
  static String get getDataListJsonKey => "data";

  final int? userId;
  final String? fullName;
  final String? contactNumber;
  final DateTime? date;
  final String? inTime;
  final dynamic outTime;
  final String? status;

  StuAttendanceModel({
    this.userId,
    this.fullName,
    this.contactNumber,
    this.date,
    this.inTime,
    this.outTime,
    this.status,
  });

  StuAttendanceModel copyWith({
    int? userId,
    String? fullName,
    String? contactNumber,
    DateTime? date,
    String? inTime,
    dynamic outTime,
    String? status,
  }) =>
      StuAttendanceModel(
        userId: userId ?? this.userId,
        fullName: fullName ?? this.fullName,
        contactNumber: contactNumber ?? this.contactNumber,
        date: date ?? this.date,
        inTime: inTime ?? this.inTime,
        outTime: outTime ?? this.outTime,
        status: status ?? this.status,
      );

  factory StuAttendanceModel.fromJson(String str) =>
      StuAttendanceModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StuAttendanceModel.fromMap(Map<String, dynamic> json) =>
      StuAttendanceModel(
        userId: json["user_id"],
        fullName: json["full_name"],
        contactNumber: json["contact_number"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        inTime: json["in_time"],
        outTime: json["out_time"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "full_name": fullName,
        "contact_number": contactNumber,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "in_time": inTime,
        "out_time": outTime,
        "status": status,
      };
}
