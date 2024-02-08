import 'dart:convert';

class MessageModel {
  static String get getDataListJsonKey => "message_list";

  int? currentPage;
  List<MessageData>? data;
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

  MessageModel({
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

  MessageModel copyWith({
    int? currentPage,
    List<MessageData>? data,
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
      MessageModel(
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

  factory MessageModel.fromJson(String str) =>
      MessageModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MessageModel.fromMap(Map<String, dynamic> json) => MessageModel(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<MessageData>.from(
                json["data"]!.map((x) => MessageData.fromMap(x))),
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

class MessageData {
  int? id;
  int? userId;
  int? siteId;
  String? title;
  String? message;
  String? messageTypeKey;
  String? category;
  int? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic creator;

  MessageData({
    this.id,
    this.userId,
    this.siteId,
    this.title,
    this.message,
    this.messageTypeKey,
    this.category,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.creator,
  });

  MessageData copyWith({
    int? id,
    int? userId,
    int? siteId,
    String? title,
    String? message,
    String? messageTypeKey,
    String? category,
    int? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic creator,
  }) =>
      MessageData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        siteId: siteId ?? this.siteId,
        title: title ?? this.title,
        message: message ?? this.message,
        messageTypeKey: messageTypeKey ?? this.messageTypeKey,
        category: category ?? this.category,
        createdBy: createdBy ?? this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        creator: creator ?? this.creator,
      );

  factory MessageData.fromJson(String str) =>
      MessageData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MessageData.fromMap(Map<String, dynamic> json) => MessageData(
        id: json["id"],
        userId: json["user_id"],
        siteId: json["site_id"],
        title: json["title"],
        message: json["message"],
        messageTypeKey: json["message_type_key"],
        category: json["category"],
        createdBy: json["created_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        creator: json["creator"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "site_id": siteId,
        "title": title,
        "message": message,
        "message_type_key": messageTypeKey,
        "category": category,
        "created_by": createdBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "creator": creator,
      };
}
