import 'dart:convert';

class StuQuizResultModel {
  static String get getParentJsonKey => "quiz_list";

  int? currentPage;
  List<QuizData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  String? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  StuQuizResultModel({
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

  StuQuizResultModel copyWith({
    int? currentPage,
    List<QuizData>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    dynamic nextPageUrl,
    String? path,
    String? perPage,
    dynamic prevPageUrl,
    int? to,
    int? total,
  }) =>
      StuQuizResultModel(
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

  factory StuQuizResultModel.fromJson(String str) =>
      StuQuizResultModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StuQuizResultModel.fromMap(Map<String, dynamic> json) =>
      StuQuizResultModel(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<QuizData>.from(json["data"]!.map((x) => QuizData.fromMap(x))),
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

class QuizData {
  int? studentHistoryId;
  int? quizDeclareId;
  int? joinStatus;
  int? endStatus;
  int? totalQuestion;
  QuizDeclare? quizDeclare;
  int? totalAnswer;
  int? totalRightAnswer;
  int? totalWrongAnswer;
  String? quizTime;
  int? mark;
  String? rightAnsPercentage;
  dynamic rank;

  QuizData({
    this.studentHistoryId,
    this.quizDeclareId,
    this.joinStatus,
    this.endStatus,
    this.totalQuestion,
    this.quizDeclare,
    this.totalAnswer,
    this.totalRightAnswer,
    this.totalWrongAnswer,
    this.quizTime,
    this.mark,
    this.rightAnsPercentage,
    this.rank,
  });

  QuizData copyWith({
    int? studentHistoryId,
    int? quizDeclareId,
    int? joinStatus,
    int? endStatus,
    int? totalQuestion,
    QuizDeclare? quizDeclare,
    int? totalAnswer,
    int? totalRightAnswer,
    int? totalWrongAnswer,
    String? quizTime,
    int? mark,
    String? rightAnsPercentage,
    dynamic rank,
  }) =>
      QuizData(
        studentHistoryId: studentHistoryId ?? this.studentHistoryId,
        quizDeclareId: quizDeclareId ?? this.quizDeclareId,
        joinStatus: joinStatus ?? this.joinStatus,
        endStatus: endStatus ?? this.endStatus,
        totalQuestion: totalQuestion ?? this.totalQuestion,
        quizDeclare: quizDeclare ?? this.quizDeclare,
        totalAnswer: totalAnswer ?? this.totalAnswer,
        totalRightAnswer: totalRightAnswer ?? this.totalRightAnswer,
        totalWrongAnswer: totalWrongAnswer ?? this.totalWrongAnswer,
        quizTime: quizTime ?? this.quizTime,
        mark: mark ?? this.mark,
        rightAnsPercentage: rightAnsPercentage ?? this.rightAnsPercentage,
        rank: rank ?? this.rank,
      );

  factory QuizData.fromJson(String str) => QuizData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuizData.fromMap(Map<String, dynamic> json) => QuizData(
        studentHistoryId: json["student_history_id"],
        quizDeclareId: json["quiz_declare_id"],
        joinStatus: json["join_status"],
        endStatus: json["end_status"],
        totalQuestion: json["total_question"],
        quizDeclare: json["quiz_declare"] == null
            ? null
            : QuizDeclare.fromMap(json["quiz_declare"]),
        totalAnswer: json["total_answer"],
        totalRightAnswer: json["total_right_answer"],
        totalWrongAnswer: json["total_wrong_answer"],
        quizTime: json["quiz_time"],
        mark: json["mark"],
        rightAnsPercentage: json["right_ans_percentage"],
        rank: json["rank"],
      );

  Map<String, dynamic> toMap() => {
        "student_history_id": studentHistoryId,
        "quiz_declare_id": quizDeclareId,
        "join_status": joinStatus,
        "end_status": endStatus,
        "total_question": totalQuestion,
        "quiz_declare": quizDeclare?.toMap(),
        "total_answer": totalAnswer,
        "total_right_answer": totalRightAnswer,
        "total_wrong_answer": totalWrongAnswer,
        "quiz_time": quizTime,
        "mark": mark,
        "right_ans_percentage": rightAnsPercentage,
        "rank": rank,
      };
}

class QuizDeclare {
  int? id;
  int? quizId;
  String? declareKey;
  QuizDeclareSettings? quizDeclareSettings;
  Quiz? quiz;

  QuizDeclare({
    this.id,
    this.quizId,
    this.declareKey,
    this.quizDeclareSettings,
    this.quiz,
  });

  QuizDeclare copyWith({
    int? id,
    int? quizId,
    String? declareKey,
    QuizDeclareSettings? quizDeclareSettings,
    Quiz? quiz,
  }) =>
      QuizDeclare(
        id: id ?? this.id,
        quizId: quizId ?? this.quizId,
        declareKey: declareKey ?? this.declareKey,
        quizDeclareSettings: quizDeclareSettings ?? this.quizDeclareSettings,
        quiz: quiz ?? this.quiz,
      );

  factory QuizDeclare.fromJson(String str) =>
      QuizDeclare.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuizDeclare.fromMap(Map<String, dynamic> json) => QuizDeclare(
        id: json["id"],
        quizId: json["quiz_id"],
        declareKey: json["declare_key"],
        quizDeclareSettings: json["quiz_declare_settings"] == null
            ? null
            : QuizDeclareSettings.fromMap(json["quiz_declare_settings"]),
        quiz: json["quiz"] == null ? null : Quiz.fromMap(json["quiz"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "quiz_id": quizId,
        "declare_key": declareKey,
        "quiz_declare_settings": quizDeclareSettings?.toMap(),
        "quiz": quiz?.toMap(),
      };
}

class Quiz {
  int? id;
  String? quizKey;
  String? quizName;
  int? status;

  Quiz({
    this.id,
    this.quizKey,
    this.quizName,
    this.status,
  });

  Quiz copyWith({
    int? id,
    String? quizKey,
    String? quizName,
    int? status,
  }) =>
      Quiz(
        id: id ?? this.id,
        quizKey: quizKey ?? this.quizKey,
        quizName: quizName ?? this.quizName,
        status: status ?? this.status,
      );

  factory Quiz.fromJson(String str) => Quiz.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Quiz.fromMap(Map<String, dynamic> json) => Quiz(
        id: json["id"],
        quizKey: json["quiz_key"],
        quizName: json["quiz_name"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "quiz_key": quizKey,
        "quiz_name": quizName,
        "status": status,
      };
}

class QuizDeclareSettings {
  int? id;
  int? duration;
  String? startDateTime;
  String? endDateTime;
  int? isCancel;
  int? isEnd;
  int? isStart;
  int? questionPerStudent;
  int? quizDeclareId;
  int? resultShowToStudentPanelStatus;

  QuizDeclareSettings({
    this.id,
    this.duration,
    this.startDateTime,
    this.endDateTime,
    this.isCancel,
    this.isEnd,
    this.isStart,
    this.questionPerStudent,
    this.quizDeclareId,
    this.resultShowToStudentPanelStatus,
  });

  QuizDeclareSettings copyWith({
    int? id,
    int? duration,
    String? startDateTime,
    String? endDateTime,
    int? isCancel,
    int? isEnd,
    int? isStart,
    int? questionPerStudent,
    int? quizDeclareId,
    int? resultShowToStudentPanelStatus,
  }) =>
      QuizDeclareSettings(
        id: id ?? this.id,
        duration: duration ?? this.duration,
        startDateTime: startDateTime ?? this.startDateTime,
        endDateTime: endDateTime ?? this.endDateTime,
        isCancel: isCancel ?? this.isCancel,
        isEnd: isEnd ?? this.isEnd,
        isStart: isStart ?? this.isStart,
        questionPerStudent: questionPerStudent ?? this.questionPerStudent,
        quizDeclareId: quizDeclareId ?? this.quizDeclareId,
        resultShowToStudentPanelStatus: resultShowToStudentPanelStatus ??
            this.resultShowToStudentPanelStatus,
      );

  factory QuizDeclareSettings.fromJson(String str) =>
      QuizDeclareSettings.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuizDeclareSettings.fromMap(Map<String, dynamic> json) =>
      QuizDeclareSettings(
        id: json["id"],
        duration: json["duration"],
        startDateTime: json["start_date_time"],
        endDateTime: json["end_date_time"],
        isCancel: json["is_cancel"],
        isEnd: json["is_end"],
        isStart: json["is_start"],
        questionPerStudent: json["question_per_student"],
        quizDeclareId: json["quiz_declare_id"],
        resultShowToStudentPanelStatus:
            json["result_show_to_student_panel_status"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "duration": duration,
        "start_date_time": startDateTime,
        "end_date_time": endDateTime,
        "is_cancel": isCancel,
        "is_end": isEnd,
        "is_start": isStart,
        "question_per_student": questionPerStudent,
        "quiz_declare_id": quizDeclareId,
        "result_show_to_student_panel_status": resultShowToStudentPanelStatus,
      };
}
