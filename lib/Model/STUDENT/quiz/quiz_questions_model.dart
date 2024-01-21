import 'dart:convert';

class QuizQuestionsModel {
    final List<QuestionList>? questionList;
    final QuizDetails? quizDetails;
    final List<dynamic>? studentAnswerList;
    final int? backupSecond;
    final String? mode;
    final String? status;

    QuizQuestionsModel({
        this.questionList,
        this.quizDetails,
        this.studentAnswerList,
        this.backupSecond,
        this.mode,
        this.status,
    });

    QuizQuestionsModel copyWith({
        List<QuestionList>? questionList,
        QuizDetails? quizDetails,
        List<dynamic>? studentAnswerList,
        int? backupSecond,
        String? mode,
        String? status,
    }) => 
        QuizQuestionsModel(
            questionList: questionList ?? this.questionList,
            quizDetails: quizDetails ?? this.quizDetails,
            studentAnswerList: studentAnswerList ?? this.studentAnswerList,
            backupSecond: backupSecond ?? this.backupSecond,
            mode: mode ?? this.mode,
            status: status ?? this.status,
        );

    factory QuizQuestionsModel.fromJson(String str) => QuizQuestionsModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory QuizQuestionsModel.fromMap(Map<String, dynamic> json) => QuizQuestionsModel(
        questionList: json["QuestionList"] == null ? [] : List<QuestionList>.from(json["QuestionList"]!.map((x) => QuestionList.fromMap(x))),
        quizDetails: json["QuizDetails"] == null ? null : QuizDetails.fromMap(json["QuizDetails"]),
        studentAnswerList: json["student_answer_list"] == null ? [] : List<dynamic>.from(json["student_answer_list"]!.map((x) => x)),
        backupSecond: json["backup_second"],
        mode: json["mode"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "QuestionList": questionList == null ? [] : List<dynamic>.from(questionList!.map((x) => x.toMap())),
        "QuizDetails": quizDetails?.toMap(),
        "student_answer_list": studentAnswerList == null ? [] : List<dynamic>.from(studentAnswerList!.map((x) => x)),
        "backup_second": backupSecond,
        "mode": mode,
        "status": status,
    };
}

class QuestionList {
    final int? id;
    final int? questionNo;
    final int? siteExamQuestionInfoId;
    final int? mark;
    final QuestionLevel? questionLevel;
    final int? siteId;
    final int? siteGroupId;
    final ModuleKey? moduleKey;
    final dynamic academicGroupId;
    final int? status;
    final QuestionStatus? questionStatus;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? answerCount;
    final List<dynamic>? studentAnswerIds;
    final String? question;
    final List<SiteQuizQuestionDetailsForStudent>? siteQuizQuestionDetailsForStudent;
    final List<QuestionListTranslation>? translations;

    QuestionList({
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
        this.studentAnswerIds,
        this.question,
        this.siteQuizQuestionDetailsForStudent,
        this.translations,
    });

    QuestionList copyWith({
        int? id,
        int? questionNo,
        int? siteExamQuestionInfoId,
        int? mark,
        QuestionLevel? questionLevel,
        int? siteId,
        int? siteGroupId,
        ModuleKey? moduleKey,
        dynamic academicGroupId,
        int? status,
        QuestionStatus? questionStatus,
        DateTime? createdAt,
        DateTime? updatedAt,
        int? answerCount,
        List<dynamic>? studentAnswerIds,
        String? question,
        List<SiteQuizQuestionDetailsForStudent>? siteQuizQuestionDetailsForStudent,
        List<QuestionListTranslation>? translations,
    }) => 
        QuestionList(
            id: id ?? this.id,
            questionNo: questionNo ?? this.questionNo,
            siteExamQuestionInfoId: siteExamQuestionInfoId ?? this.siteExamQuestionInfoId,
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
            studentAnswerIds: studentAnswerIds ?? this.studentAnswerIds,
            question: question ?? this.question,
            siteQuizQuestionDetailsForStudent: siteQuizQuestionDetailsForStudent ?? this.siteQuizQuestionDetailsForStudent,
            translations: translations ?? this.translations,
        );

    factory QuestionList.fromJson(String str) => QuestionList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory QuestionList.fromMap(Map<String, dynamic> json) => QuestionList(
        id: json["id"],
        questionNo: json["question_no"],
        siteExamQuestionInfoId: json["site_exam_question_info_id"],
        mark: json["mark"],
        questionLevel: questionLevelValues.map[json["question_level"]]!,
        siteId: json["site_id"],
        siteGroupId: json["site_group_id"],
        moduleKey: moduleKeyValues.map[json["module_key"]]!,
        academicGroupId: json["academic_group_id"],
        status: json["status"],
        questionStatus: questionStatusValues.map[json["question_status"]]!,
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        answerCount: json["answer_count"],
        studentAnswerIds: json["student_answer_ids"] == null ? [] : List<dynamic>.from(json["student_answer_ids"]!.map((x) => x)),
        question: json["question"],
        siteQuizQuestionDetailsForStudent: json["site_quiz_question_details_for_student"] == null ? [] : List<SiteQuizQuestionDetailsForStudent>.from(json["site_quiz_question_details_for_student"]!.map((x) => SiteQuizQuestionDetailsForStudent.fromMap(x))),
        translations: json["translations"] == null ? [] : List<QuestionListTranslation>.from(json["translations"]!.map((x) => QuestionListTranslation.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "question_no": questionNo,
        "site_exam_question_info_id": siteExamQuestionInfoId,
        "mark": mark,
        "question_level": questionLevelValues.reverse[questionLevel],
        "site_id": siteId,
        "site_group_id": siteGroupId,
        "module_key": moduleKeyValues.reverse[moduleKey],
        "academic_group_id": academicGroupId,
        "status": status,
        "question_status": questionStatusValues.reverse[questionStatus],
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "answer_count": answerCount,
        "student_answer_ids": studentAnswerIds == null ? [] : List<dynamic>.from(studentAnswerIds!.map((x) => x)),
        "question": question,
        "site_quiz_question_details_for_student": siteQuizQuestionDetailsForStudent == null ? [] : List<dynamic>.from(siteQuizQuestionDetailsForStudent!.map((x) => x.toMap())),
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x.toMap())),
    };
}

enum ModuleKey {
    QUIZ
}

final moduleKeyValues = EnumValues({
    "quiz": ModuleKey.QUIZ
});

enum QuestionLevel {
    EASY
}

final questionLevelValues = EnumValues({
    "easy": QuestionLevel.EASY
});

enum QuestionStatus {
    APPROVED
}

final questionStatusValues = EnumValues({
    "approved": QuestionStatus.APPROVED
});

class SiteQuizQuestionDetailsForStudent {
    final int? id;
    final int? siteExamQuestionId;
    final String? option;
    final List<SiteQuizQuestionDetailsForStudentTranslation>? translations;

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

    factory SiteQuizQuestionDetailsForStudent.fromJson(String str) => SiteQuizQuestionDetailsForStudent.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SiteQuizQuestionDetailsForStudent.fromMap(Map<String, dynamic> json) => SiteQuizQuestionDetailsForStudent(
        id: json["id"],
        siteExamQuestionId: json["site_exam_question_id"],
        option: json["option"],
        translations: json["translations"] == null ? [] : List<SiteQuizQuestionDetailsForStudentTranslation>.from(json["translations"]!.map((x) => SiteQuizQuestionDetailsForStudentTranslation.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "site_exam_question_id": siteExamQuestionId,
        "option": option,
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x.toMap())),
    };
}

class SiteQuizQuestionDetailsForStudentTranslation {
    final int? id;
    final int? siteExamQuestionDetailId;
    final String? option;
    final Locale? locale;
    final int? status;
    final dynamic createdAt;
    final dynamic updatedAt;

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
        Locale? locale,
        int? status,
        dynamic createdAt,
        dynamic updatedAt,
    }) => 
        SiteQuizQuestionDetailsForStudentTranslation(
            id: id ?? this.id,
            siteExamQuestionDetailId: siteExamQuestionDetailId ?? this.siteExamQuestionDetailId,
            option: option ?? this.option,
            locale: locale ?? this.locale,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory SiteQuizQuestionDetailsForStudentTranslation.fromJson(String str) => SiteQuizQuestionDetailsForStudentTranslation.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SiteQuizQuestionDetailsForStudentTranslation.fromMap(Map<String, dynamic> json) => SiteQuizQuestionDetailsForStudentTranslation(
        id: json["id"],
        siteExamQuestionDetailId: json["site_exam_question_detail_id"],
        option: json["option"],
        locale: localeValues.map[json["locale"]]!,
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "site_exam_question_detail_id": siteExamQuestionDetailId,
        "option": option,
        "locale": localeValues.reverse[locale],
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}

enum Locale {
    EN
}

final localeValues = EnumValues({
    "en": Locale.EN
});

class QuestionListTranslation {
    final int? id;
    final int? siteExamQuestionId;
    final String? question;
    final Locale? locale;
    final dynamic createdAt;
    final dynamic updatedAt;

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
        Locale? locale,
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

    factory QuestionListTranslation.fromJson(String str) => QuestionListTranslation.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory QuestionListTranslation.fromMap(Map<String, dynamic> json) => QuestionListTranslation(
        id: json["id"],
        siteExamQuestionId: json["site_exam_question_id"],
        question: json["question"],
        locale: localeValues.map[json["locale"]]!,
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "site_exam_question_id": siteExamQuestionId,
        "question": question,
        "locale": localeValues.reverse[locale],
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}

class QuizDetails {
    final int? studentQuizDeclareId;
    final int? quizDeclareId;
    final int? studentHistoryId;
    final String? quizName;
    final DateTime? startDate;
    final String? startTime;
    final String? endTime;
    final int? duration;
    final int? questionPerStudent;
    final int? isStart;
    final int? isEnd;

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
        );

    factory QuizDetails.fromJson(String str) => QuizDetails.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory QuizDetails.fromMap(Map<String, dynamic> json) => QuizDetails(
        studentQuizDeclareId: json["student_quiz_declare_id"],
        quizDeclareId: json["quiz_declare_id"],
        studentHistoryId: json["student_history_id"],
        quizName: json["quiz_name"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        startTime: json["start_time"],
        endTime: json["end_time"],
        duration: json["duration"],
        questionPerStudent: json["question_per_student"],
        isStart: json["is_start"],
        isEnd: json["is_end"],
    );

    Map<String, dynamic> toMap() => {
        "student_quiz_declare_id": studentQuizDeclareId,
        "quiz_declare_id": quizDeclareId,
        "student_history_id": studentHistoryId,
        "quiz_name": quizName,
        "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "duration": duration,
        "question_per_student": questionPerStudent,
        "is_start": isStart,
        "is_end": isEnd,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
