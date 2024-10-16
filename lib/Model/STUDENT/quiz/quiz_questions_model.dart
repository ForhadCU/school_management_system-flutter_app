import 'dart:convert';

class QuizQuestionsModel {
  List<QuestionList>? questionList;
  QuizDetails? quizDetails;
  int? backupSecond;
  String? mode;
  String? status;

  QuizQuestionsModel({
    this.questionList,
    this.quizDetails,
    this.backupSecond,
    this.mode,
    this.status,
  });

  QuizQuestionsModel copyWith({
    List<QuestionList>? questionList,
    QuizDetails? quizDetails,
    int? backupSecond,
    String? mode,
    String? status,
  }) =>
      QuizQuestionsModel(
        questionList: questionList ?? this.questionList,
        quizDetails: quizDetails ?? this.quizDetails,
        backupSecond: backupSecond ?? this.backupSecond,
        mode: mode ?? this.mode,
        status: status ?? this.status,
      );

  factory QuizQuestionsModel.fromJson(String str) =>
      QuizQuestionsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuizQuestionsModel.fromMap(Map<String, dynamic> json) =>
      QuizQuestionsModel(
        questionList: json["QuestionList"] == null
            ? []
            : List<QuestionList>.from(
                json["QuestionList"]!.map((x) => QuestionList.fromMap(x))),
        quizDetails: json["QuizDetails"] == null
            ? null
            : QuizDetails.fromMap(json["QuizDetails"]),
        backupSecond: json["backup_second"],
        mode: json["mode"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "QuestionList": questionList == null
            ? []
            : List<dynamic>.from(questionList!.map((x) => x.toMap())),
        "QuizDetails": quizDetails?.toMap(),
        "backup_second": backupSecond,
        "mode": mode,
        "status": status,
      };
}

class QuestionList {
  List<dynamic>? studentAnswerIds;
  int? id;
  int? questionNo;
  int? siteExamQuestionInfoId;
  int? mark;
  String? questionLevel;
  int? siteId;
  dynamic siteGroupId;
  String? moduleKey;
  int? academicGroupId;
  int? status;
  String? questionStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? answerCount;
  String? question;
  List<SiteQuizQuestionDetailsForStudent>? siteQuizQuestionDetailsForStudent;
  List<QuestionListTranslation>? translations;

  QuestionList({
    this.studentAnswerIds,
    this.id,
    this.questionNo,
    this.siteExamQuestionInfoId,
    this.mark,
    this.questionLevel,
    this.siteId,
    this.siteGroupId,
    this.moduleKey,
    this.academicGroupId,
    this.status,
    this.questionStatus,
    this.createdAt,
    this.updatedAt,
    this.answerCount,
    this.question,
    this.siteQuizQuestionDetailsForStudent,
    this.translations,
  });

  QuestionList copyWith({
    List<dynamic>? studentAnswerIds,
    int? id,
    int? questionNo,
    int? siteExamQuestionInfoId,
    int? mark,
    String? questionLevel,
    int? siteId,
    dynamic siteGroupId,
    String? moduleKey,
    int? academicGroupId,
    int? status,
    String? questionStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? answerCount,
    String? question,
    List<SiteQuizQuestionDetailsForStudent>? siteQuizQuestionDetailsForStudent,
    List<QuestionListTranslation>? translations,
  }) =>
      QuestionList(
        studentAnswerIds: studentAnswerIds ?? this.studentAnswerIds,
        id: id ?? this.id,
        questionNo: questionNo ?? this.questionNo,
        siteExamQuestionInfoId:
            siteExamQuestionInfoId ?? this.siteExamQuestionInfoId,
        mark: mark ?? this.mark,
        questionLevel: questionLevel ?? this.questionLevel,
        siteId: siteId ?? this.siteId,
        siteGroupId: siteGroupId ?? this.siteGroupId,
        moduleKey: moduleKey ?? this.moduleKey,
        academicGroupId: academicGroupId ?? this.academicGroupId,
        status: status ?? this.status,
        questionStatus: questionStatus ?? this.questionStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        answerCount: answerCount ?? this.answerCount,
        question: question ?? this.question,
        siteQuizQuestionDetailsForStudent: siteQuizQuestionDetailsForStudent ??
            this.siteQuizQuestionDetailsForStudent,
        translations: translations ?? this.translations,
      );

  factory QuestionList.fromJson(String str) =>
      QuestionList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuestionList.fromMap(Map<String, dynamic> json) => QuestionList(
        studentAnswerIds: json["student_answer_ids"],
        id: json["id"],
        questionNo: json["question_no"],
        siteExamQuestionInfoId: json["site_exam_question_info_id"],
        mark: json["mark"],
        questionLevel: json["question_level"],
        siteId: json["site_id"],
        siteGroupId: json["site_group_id"],
        moduleKey: json["module_key"],
        academicGroupId: json["academic_group_id"],
        status: json["status"],
        questionStatus: json["question_status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        answerCount: json["answer_count"],
        question: json["question"],
        siteQuizQuestionDetailsForStudent:
            json["site_quiz_question_details_for_student"] == null
                ? []
                : List<SiteQuizQuestionDetailsForStudent>.from(
                    json["site_quiz_question_details_for_student"]!.map(
                        (x) => SiteQuizQuestionDetailsForStudent.fromMap(x))),
        translations: json["translations"] == null
            ? []
            : List<QuestionListTranslation>.from(json["translations"]!
                .map((x) => QuestionListTranslation.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "student_answer_ids": studentAnswerIds,
        "id": id,
        "question_no": questionNo,
        "site_exam_question_info_id": siteExamQuestionInfoId,
        "mark": mark,
        "question_level": questionLevel,
        "site_id": siteId,
        "site_group_id": siteGroupId,
        "module_key": moduleKey,
        "academic_group_id": academicGroupId,
        "status": status,
        "question_status": questionStatus,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "answer_count": answerCount,
        "question": question,
        "site_quiz_question_details_for_student":
            siteQuizQuestionDetailsForStudent == null
                ? []
                : List<dynamic>.from(
                    siteQuizQuestionDetailsForStudent!.map((x) => x.toMap())),
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toMap())),
      };
}

class SiteQuizQuestionDetailsForStudent {
  int? id;
  int? siteExamQuestionId;
  String? option;
  List<SiteQuizQuestionDetailsForStudentTranslation>? translations;

  SiteQuizQuestionDetailsForStudent({
    this.id,
    this.siteExamQuestionId,
    this.option,
    this.translations,
  });

  SiteQuizQuestionDetailsForStudent copyWith({
    int? id,
    int? siteExamQuestionId,
    String? option,
    List<SiteQuizQuestionDetailsForStudentTranslation>? translations,
  }) =>
      SiteQuizQuestionDetailsForStudent(
        id: id ?? this.id,
        siteExamQuestionId: siteExamQuestionId ?? this.siteExamQuestionId,
        option: option ?? this.option,
        translations: translations ?? this.translations,
      );

  factory SiteQuizQuestionDetailsForStudent.fromJson(String str) =>
      SiteQuizQuestionDetailsForStudent.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SiteQuizQuestionDetailsForStudent.fromMap(
          Map<String, dynamic> json) =>
      SiteQuizQuestionDetailsForStudent(
        id: json["id"],
        siteExamQuestionId: json["site_exam_question_id"],
        option: json["option"],
        translations: json["translations"] == null
            ? []
            : List<SiteQuizQuestionDetailsForStudentTranslation>.from(
                json["translations"]!.map((x) =>
                    SiteQuizQuestionDetailsForStudentTranslation.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "site_exam_question_id": siteExamQuestionId,
        "option": option,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toMap())),
      };
}

class SiteQuizQuestionDetailsForStudentTranslation {
  int? id;
  int? siteExamQuestionDetailId;
  String? option;
  String? locale;
  int? status;
  dynamic createdAt;
  dynamic updatedAt;

  SiteQuizQuestionDetailsForStudentTranslation({
    this.id,
    this.siteExamQuestionDetailId,
    this.option,
    this.locale,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  SiteQuizQuestionDetailsForStudentTranslation copyWith({
    int? id,
    int? siteExamQuestionDetailId,
    String? option,
    String? locale,
    int? status,
    dynamic createdAt,
    dynamic updatedAt,
  }) =>
      SiteQuizQuestionDetailsForStudentTranslation(
        id: id ?? this.id,
        siteExamQuestionDetailId:
            siteExamQuestionDetailId ?? this.siteExamQuestionDetailId,
        option: option ?? this.option,
        locale: locale ?? this.locale,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory SiteQuizQuestionDetailsForStudentTranslation.fromJson(String str) =>
      SiteQuizQuestionDetailsForStudentTranslation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SiteQuizQuestionDetailsForStudentTranslation.fromMap(
          Map<String, dynamic> json) =>
      SiteQuizQuestionDetailsForStudentTranslation(
        id: json["id"],
        siteExamQuestionDetailId: json["site_exam_question_detail_id"],
        option: json["option"],
        locale: json["locale"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "site_exam_question_detail_id": siteExamQuestionDetailId,
        "option": option,
        "locale": locale,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class QuestionListTranslation {
  int? id;
  int? siteExamQuestionId;
  String? question;
  String? locale;
  dynamic createdAt;
  dynamic updatedAt;

  QuestionListTranslation({
    this.id,
    this.siteExamQuestionId,
    this.question,
    this.locale,
    this.createdAt,
    this.updatedAt,
  });

  QuestionListTranslation copyWith({
    int? id,
    int? siteExamQuestionId,
    String? question,
    String? locale,
    dynamic createdAt,
    dynamic updatedAt,
  }) =>
      QuestionListTranslation(
        id: id ?? this.id,
        siteExamQuestionId: siteExamQuestionId ?? this.siteExamQuestionId,
        question: question ?? this.question,
        locale: locale ?? this.locale,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory QuestionListTranslation.fromJson(String str) =>
      QuestionListTranslation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuestionListTranslation.fromMap(Map<String, dynamic> json) =>
      QuestionListTranslation(
        id: json["id"],
        siteExamQuestionId: json["site_exam_question_id"],
        question: json["question"],
        locale: json["locale"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "site_exam_question_id": siteExamQuestionId,
        "question": question,
        "locale": locale,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class QuizDetails {
  int? studentQuizDeclareId;
  int? quizDeclareId;
  int? studentHistoryId;
  String? quizName;
  DateTime? startDate;
  String? startTime;
  String? endTime;
  int? duration;
  int? questionPerStudent;
  int? isStart;
  int? isEnd;
  int? endStatus;

  QuizDetails({
    this.studentQuizDeclareId,
    this.quizDeclareId,
    this.studentHistoryId,
    this.quizName,
    this.startDate,
    this.startTime,
    this.endTime,
    this.duration,
    this.questionPerStudent,
    this.isStart,
    this.isEnd,
    this.endStatus,
  });

  QuizDetails copyWith({
    int? studentQuizDeclareId,
    int? quizDeclareId,
    int? studentHistoryId,
    String? quizName,
    DateTime? startDate,
    String? startTime,
    String? endTime,
    int? duration,
    int? questionPerStudent,
    int? isStart,
    int? isEnd,
    int? endStatus,
  }) =>
      QuizDetails(
        studentQuizDeclareId: studentQuizDeclareId ?? this.studentQuizDeclareId,
        quizDeclareId: quizDeclareId ?? this.quizDeclareId,
        studentHistoryId: studentHistoryId ?? this.studentHistoryId,
        quizName: quizName ?? this.quizName,
        startDate: startDate ?? this.startDate,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        duration: duration ?? this.duration,
        questionPerStudent: questionPerStudent ?? this.questionPerStudent,
        isStart: isStart ?? this.isStart,
        isEnd: isEnd ?? this.isEnd,
        endStatus: endStatus ?? this.endStatus,
      );

  factory QuizDetails.fromJson(String str) =>
      QuizDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuizDetails.fromMap(Map<String, dynamic> json) => QuizDetails(
        studentQuizDeclareId: json["student_quiz_declare_id"],
        quizDeclareId: json["quiz_declare_id"],
        studentHistoryId: json["student_history_id"],
        quizName: json["quiz_name"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        startTime: json["start_time"],
        endTime: json["end_time"],
        duration: json["duration"],
        questionPerStudent: json["question_per_student"],
        isStart: json["is_start"],
        isEnd: json["is_end"],
        endStatus: json["end_status"],
      );

  Map<String, dynamic> toMap() => {
        "student_quiz_declare_id": studentQuizDeclareId,
        "quiz_declare_id": quizDeclareId,
        "student_history_id": studentHistoryId,
        "quiz_name": quizName,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "duration": duration,
        "question_per_student": questionPerStudent,
        "is_start": isStart,
        "is_end": isEnd,
        "end_status": endStatus,
      };
}
