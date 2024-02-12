import 'dart:convert';

class AttendanceListModel {
  static String get getParentJsonKeyForStudent => "attendance_list";
  static String get getParentJsonKeyForTeacher => "emp_att_data";

  int? currentPage;
  List<AttendanceListModelData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  AttendanceListModel({
    this.currentPage,
    this.data,
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

  AttendanceListModel copyWith({
    int? currentPage,
    List<AttendanceListModelData>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    dynamic nextPageUrl,
    String? path,
    int? perPage,
    String? prevPageUrl,
    int? to,
    int? total,
  }) =>
      AttendanceListModel(
        currentPage: currentPage ?? this.currentPage,
        data: data ?? this.data,
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

  factory AttendanceListModel.fromJson(String str) =>
      AttendanceListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AttendanceListModel.fromMap(Map<String, dynamic> json) =>
      AttendanceListModel(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<AttendanceListModelData>.from(
                json["data"]!.map((x) => AttendanceListModelData.fromMap(x))),
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
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
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

class AttendanceListModelData {
  int? userId;
  String? fullName;
  String? contactNumber;
  DateTime? date;
  String? inTime;
  dynamic outTime;
  String? status;

  AttendanceListModelData({
    this.userId,
    this.fullName,
    this.contactNumber,
    this.date,
    this.inTime,
    this.outTime,
    this.status,
  });

  AttendanceListModelData copyWith({
    int? userId,
    String? fullName,
    String? contactNumber,
    DateTime? date,
    String? inTime,
    dynamic outTime,
    String? status,
  }) =>
      AttendanceListModelData(
        userId: userId ?? this.userId,
        fullName: fullName ?? this.fullName,
        contactNumber: contactNumber ?? this.contactNumber,
        date: date ?? this.date,
        inTime: inTime ?? this.inTime,
        outTime: outTime ?? this.outTime,
        status: status ?? this.status,
      );

  factory AttendanceListModelData.fromJson(String str) =>
      AttendanceListModelData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AttendanceListModelData.fromMap(Map<String, dynamic> json) =>
      AttendanceListModelData(
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
