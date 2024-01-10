import 'dart:convert';

class QuizInfoModel {
      static String get getParentJsonKey => "present_active_quiz";

  
    final int? studentHistoryId;
    final int? quizDeclareId;
    final int? joinStatus;
    final int? endStatus;
    final dynamic totalQuestion;
    final QuizDeclare? quizDeclare;
    final dynamic totalAnswer;
    final dynamic totalRightAnswer;
    final dynamic totalWrongAnswer;
    final dynamic quizTime;
    final dynamic mark;
    final dynamic rank;

    QuizInfoModel({
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
        this.rank,
    });

    QuizInfoModel copyWith({
        int? studentHistoryId,
        int? quizDeclareId,
        int? joinStatus,
        int? endStatus,
        dynamic totalQuestion,
        QuizDeclare? quizDeclare,
        dynamic totalAnswer,
        dynamic totalRightAnswer,
        dynamic totalWrongAnswer,
        dynamic quizTime,
        dynamic mark,
        dynamic rank,
    }) => 
        QuizInfoModel(
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
            rank: rank ?? this.rank,
        );

    factory QuizInfoModel.fromJson(String str) => QuizInfoModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory QuizInfoModel.fromMap(Map<String, dynamic> json) => QuizInfoModel(
        studentHistoryId: json["student_history_id"],
        quizDeclareId: json["quiz_declare_id"],
        joinStatus: json["join_status"],
        endStatus: json["end_status"],
        totalQuestion: json["total_question"],
        quizDeclare: json["quiz_declare"] == null ? null : QuizDeclare.fromMap(json["quiz_declare"]),
        totalAnswer: json["total_answer"],
        totalRightAnswer: json["total_right_answer"],
        totalWrongAnswer: json["total_wrong_answer"],
        quizTime: json["quiz_time"],
        mark: json["mark"],
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
        "rank": rank,
    };
}

class QuizDeclare {
    final int? id;
    final int? quizId;
    final String? declareKey;
    final QuizDeclareSettings? quizDeclareSettings;
    final Quiz? quiz;

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

    factory QuizDeclare.fromJson(String str) => QuizDeclare.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory QuizDeclare.fromMap(Map<String, dynamic> json) => QuizDeclare(
        id: json["id"],
        quizId: json["quiz_id"],
        declareKey: json["declare_key"],
        quizDeclareSettings: json["quiz_declare_settings"] == null ? null : QuizDeclareSettings.fromMap(json["quiz_declare_settings"]),
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
    final int? id;
    final String? quizKey;
    final String? quizName;
    final int? status;

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
    final int? id;
    final int? duration;
    final DateTime? startDate;
    final String? startTime;
    final String? endTime;
    final String? startDateTime;
    final String? endDateTime;
    final int? isCancel;
    final int? isEnd;
    final int? isStart;
    final int? questionPerStudent;
    final int? quizDeclareId;
    final int? resultShowToStudentPanelStatus;

    QuizDeclareSettings({
        this.id,
        this.duration,
        this.startDate,
        this.startTime,
        this.endTime,
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
        DateTime? startDate,
        String? startTime,
        String? endTime,
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
            startDate: startDate ?? this.startDate,
            startTime: startTime ?? this.startTime,
            endTime: endTime ?? this.endTime,
            startDateTime: startDateTime ?? this.startDateTime,
            endDateTime: endDateTime ?? this.endDateTime,
            isCancel: isCancel ?? this.isCancel,
            isEnd: isEnd ?? this.isEnd,
            isStart: isStart ?? this.isStart,
            questionPerStudent: questionPerStudent ?? this.questionPerStudent,
            quizDeclareId: quizDeclareId ?? this.quizDeclareId,
            resultShowToStudentPanelStatus: resultShowToStudentPanelStatus ?? this.resultShowToStudentPanelStatus,
        );

    factory QuizDeclareSettings.fromJson(String str) => QuizDeclareSettings.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory QuizDeclareSettings.fromMap(Map<String, dynamic> json) => QuizDeclareSettings(
        id: json["id"],
        duration: json["duration"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        startTime: json["start_time"],
        endTime: json["end_time"],
        startDateTime: json["start_date_time"],
        endDateTime: json["end_date_time"],
        isCancel: json["is_cancel"],
        isEnd: json["is_end"],
        isStart: json["is_start"],
        questionPerStudent: json["question_per_student"],
        quizDeclareId: json["quiz_declare_id"],
        resultShowToStudentPanelStatus: json["result_show_to_student_panel_status"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "duration": duration,
        "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
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
