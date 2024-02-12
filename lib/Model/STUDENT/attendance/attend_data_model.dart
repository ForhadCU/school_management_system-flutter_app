import 'dart:convert';

class StuAttendanceDataModel {
  static String get getParentJsonKey => "attendance_list";
  static String get getDataListJsonKey => "data";

  final int? userId;
  final String? fullName;
  final String? contactNumber;
  final String? date;
  final String? inTime;
  final dynamic outTime;
  final String? status;

  StuAttendanceDataModel({
    this.userId,
    this.fullName,
    this.contactNumber,
    this.date,
    this.inTime,
    this.outTime,
    this.status,
  });

  StuAttendanceDataModel copyWith({
    int? userId,
    String? fullName,
    String? contactNumber,
    String? date,
    String? inTime,
    dynamic outTime,
    String? status,
  }) =>
      StuAttendanceDataModel(
        userId: userId ?? this.userId,
        fullName: fullName ?? this.fullName,
        contactNumber: contactNumber ?? this.contactNumber,
        date: date ?? this.date,
        inTime: inTime ?? this.inTime,
        outTime: outTime ?? this.outTime,
        status: status ?? this.status,
      );

  factory StuAttendanceDataModel.fromJson(String str) =>
      StuAttendanceDataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StuAttendanceDataModel.fromMap(Map<String, dynamic> json) =>
      StuAttendanceDataModel(
        userId: json["user_id"],
        fullName: json["full_name"],
        contactNumber: json["contact_number"],
        date: json["date"],
        inTime: json["in_time"],
        outTime: json["out_time"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "full_name": fullName,
        "contact_number": contactNumber,
        "date": date,
        // "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "in_time": inTime,
        "out_time": outTime,
        "status": status,
      };
}
