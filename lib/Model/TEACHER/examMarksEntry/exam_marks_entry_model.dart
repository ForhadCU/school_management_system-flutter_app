import 'dart:convert';

class ExamMarksEntryListModel {
  List<StudentListForMarksEntry>? studentListForMarksEntry;
  List<GetExamType>? getExamType;
  bool? academicClassGroupPresentStatus;
  bool? academicSectionPresentStatus;
  bool? academicSessionPresentStatus;
  bool? timeRange;
  String? mode;
  String? status;

  ExamMarksEntryListModel({
    this.studentListForMarksEntry,
    this.getExamType,
    this.academicClassGroupPresentStatus,
    this.academicSectionPresentStatus,
    this.academicSessionPresentStatus,
    this.timeRange,
    this.mode,
    this.status,
  });

  ExamMarksEntryListModel copyWith({
    List<StudentListForMarksEntry>? studentListForMarksEntry,
    List<GetExamType>? getExamType,
    bool? academicClassGroupPresentStatus,
    bool? academicSectionPresentStatus,
    bool? academicSessionPresentStatus,
    bool? timeRange,
    String? mode,
    String? status,
  }) =>
      ExamMarksEntryListModel(
        studentListForMarksEntry:
            studentListForMarksEntry ?? this.studentListForMarksEntry,
        getExamType: getExamType ?? this.getExamType,
        academicClassGroupPresentStatus: academicClassGroupPresentStatus ??
            this.academicClassGroupPresentStatus,
        academicSectionPresentStatus:
            academicSectionPresentStatus ?? this.academicSectionPresentStatus,
        academicSessionPresentStatus:
            academicSessionPresentStatus ?? this.academicSessionPresentStatus,
        timeRange: timeRange ?? this.timeRange,
        mode: mode ?? this.mode,
        status: status ?? this.status,
      );

  factory ExamMarksEntryListModel.fromJson(String str) =>
      ExamMarksEntryListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamMarksEntryListModel.fromMap(Map<String, dynamic> json) =>
      ExamMarksEntryListModel(
        studentListForMarksEntry: json["StudentListForMarksEntry"] == null
            ? []
            : List<StudentListForMarksEntry>.from(
                json["StudentListForMarksEntry"]!
                    .map((x) => StudentListForMarksEntry.fromMap(x))),
        getExamType: json["getExamType"] == null
            ? []
            : List<GetExamType>.from(
                json["getExamType"]!.map((x) => GetExamType.fromMap(x))),
        academicClassGroupPresentStatus:
            json["academic_class_group_present_status"],
        academicSectionPresentStatus: json["academic_section_present_status"],
        academicSessionPresentStatus: json["academic_session_present_status"],
        timeRange: json["time_range"],
        mode: json["mode"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "StudentListForMarksEntry": studentListForMarksEntry == null
            ? []
            : List<dynamic>.from(
                studentListForMarksEntry!.map((x) => x.toMap())),
        "getExamType": getExamType == null
            ? []
            : List<dynamic>.from(getExamType!.map((x) => x.toMap())),
        "academic_class_group_present_status": academicClassGroupPresentStatus,
        "academic_section_present_status": academicSectionPresentStatus,
        "academic_session_present_status": academicSessionPresentStatus,
        "time_range": timeRange,
        "mode": mode,
        "status": status,
      };
}

class GetExamType {
  int? academicExamTypeId;
  bool? loadingShow;
  AcademicExamType? academicExamType;

  GetExamType({
    this.academicExamTypeId,
    this.loadingShow,
    this.academicExamType,
  });

  GetExamType copyWith({
    int? academicExamTypeId,
    bool? loadingShow,
    AcademicExamType? academicExamType,
  }) =>
      GetExamType(
        academicExamTypeId: academicExamTypeId ?? this.academicExamTypeId,
        loadingShow: loadingShow ?? this.loadingShow,
        academicExamType: academicExamType ?? this.academicExamType,
      );

  factory GetExamType.fromJson(String str) =>
      GetExamType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetExamType.fromMap(Map<String, dynamic> json) => GetExamType(
        academicExamTypeId: json["academic_exam_type_id"],
        loadingShow: json["loading_show"],
        academicExamType: json["academic_exam_type"] == null
            ? null
            : AcademicExamType.fromMap(json["academic_exam_type"]),
      );

  Map<String, dynamic> toMap() => {
        "academic_exam_type_id": academicExamTypeId,
        "loading_show": loadingShow,
        "academic_exam_type": academicExamType?.toMap(),
      };
}

class AcademicExamType {
  int? id;
  String? marksType;
  int? status;
  dynamic deletedAt;
  String? headKey;

  AcademicExamType({
    this.id,
    this.marksType,
    this.status,
    this.deletedAt,
    this.headKey,
  });

  AcademicExamType copyWith({
    int? id,
    String? marksType,
    int? status,
    dynamic deletedAt,
    String? headKey,
  }) =>
      AcademicExamType(
        id: id ?? this.id,
        marksType: marksType ?? this.marksType,
        status: status ?? this.status,
        deletedAt: deletedAt ?? this.deletedAt,
        headKey: headKey ?? this.headKey,
      );

  factory AcademicExamType.fromJson(String str) =>
      AcademicExamType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AcademicExamType.fromMap(Map<String, dynamic> json) =>
      AcademicExamType(
        id: json["id"],
        marksType: json["marks_type"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        headKey: json["head_key"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "marks_type": marksType,
        "status": status,
        "deleted_at": deletedAt,
        "head_key": headKey,
      };
}

class StudentListForMarksEntry {
  int? id;
  int? siteExamDeclareId;
  int? studentHistoryId;
  int? studentRollNumber;
  List<SiteExamDeclareStudentSubject>? siteExamDeclareStudentSubject;
  StudentHistory? studentHistory;

  StudentListForMarksEntry({
    this.id,
    this.siteExamDeclareId,
    this.studentHistoryId,
    this.studentRollNumber,
    this.siteExamDeclareStudentSubject,
    this.studentHistory,
  });

  StudentListForMarksEntry copyWith({
    int? id,
    int? siteExamDeclareId,
    int? studentHistoryId,
    int? studentRollNumber,
    List<SiteExamDeclareStudentSubject>? siteExamDeclareStudentSubject,
    StudentHistory? studentHistory,
  }) =>
      StudentListForMarksEntry(
        id: id ?? this.id,
        siteExamDeclareId: siteExamDeclareId ?? this.siteExamDeclareId,
        studentHistoryId: studentHistoryId ?? this.studentHistoryId,
        studentRollNumber: studentRollNumber ?? this.studentRollNumber,
        siteExamDeclareStudentSubject:
            siteExamDeclareStudentSubject ?? this.siteExamDeclareStudentSubject,
        studentHistory: studentHistory ?? this.studentHistory,
      );

  factory StudentListForMarksEntry.fromJson(String str) =>
      StudentListForMarksEntry.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StudentListForMarksEntry.fromMap(Map<String, dynamic> json) =>
      StudentListForMarksEntry(
        id: json["id"],
        siteExamDeclareId: json["site_exam_declare_id"],
        studentHistoryId: json["student_history_id"],
        studentRollNumber: json["student_roll_number"],
        siteExamDeclareStudentSubject:
            json["site_exam_declare_student_subject"] == null
                ? []
                : List<SiteExamDeclareStudentSubject>.from(
                    json["site_exam_declare_student_subject"]!
                        .map((x) => SiteExamDeclareStudentSubject.fromMap(x))),
        studentHistory: json["student_history"] == null
            ? null
            : StudentHistory.fromMap(json["student_history"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "site_exam_declare_id": siteExamDeclareId,
        "student_history_id": studentHistoryId,
        "student_roll_number": studentRollNumber,
        "site_exam_declare_student_subject":
            siteExamDeclareStudentSubject == null
                ? []
                : List<dynamic>.from(
                    siteExamDeclareStudentSubject!.map((x) => x.toMap())),
        "student_history": studentHistory?.toMap(),
      };
}

class SiteExamDeclareStudentSubject {
  int? id;
  int? siteExamDeclareId;
  int? siteExamDeclareStudentId;
  int? studentHistoryId;
  int? siteExamRoutineId;
  int? examinationId;
  int? academicExamTypeId;
  int? onlineExamStatus;
  dynamic onlineExamTime;
  dynamic onlineExamTimeLeft;
  int? onlineExamApplyForRestart;
  int? onlineExamRestartApprove;
  dynamic onlineExamRestartApplyTime;
  int? onlineExamRestartApplyAmount;
  int? onlineExamPresentByStudent;
  int? onlineExamStartByTeacher;
  int? onlineExamStart;
  dynamic onlineExamStartTime;
  int? onlineExamEnd;
  dynamic onlineExamEndTime;
  int? onlineExamPause;
  dynamic onlineExamPauseTime;
  int? siteSubjectGroupConditionSettingId;
  bool? examAttendanceStatus;
  bool? examHeldStatus;
  int? attendanceSubmitByMachine;
  DateTime? attendanceUpdateAt;
  int? obtaineMarks;
  int? countableObtaineMarks;
  dynamic graceMarks;
  int? passMark;
  int? examTypeCountableMarksStatus;
  int? examTypeCountableMarks;
  int? examTypeCountablePersentOfObtainMarks;
  int? subjectExamTypeMark;
  dynamic siteSubjectExaminationMarkId;
  dynamic siteSubjectExaminationExamTypeMarkId;
  dynamic siteBaseExamRoomSettingId;
  dynamic roomId;
  dynamic columnPosition;
  dynamic seatNumber;
  dynamic academicSeatPlanTypeId;
  dynamic academicSeatPlanStyleId;
  int? siteId;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? marksInputBy;
  dynamic marksLastUpdateBy;
  int? attendanceSubmitBy;
  bool? loadingShow;
  AcademicExamType? academicExamType;

  SiteExamDeclareStudentSubject({
    this.id,
    this.siteExamDeclareId,
    this.siteExamDeclareStudentId,
    this.studentHistoryId,
    this.siteExamRoutineId,
    this.examinationId,
    this.academicExamTypeId,
    this.onlineExamStatus,
    this.onlineExamTime,
    this.onlineExamTimeLeft,
    this.onlineExamApplyForRestart,
    this.onlineExamRestartApprove,
    this.onlineExamRestartApplyTime,
    this.onlineExamRestartApplyAmount,
    this.onlineExamPresentByStudent,
    this.onlineExamStartByTeacher,
    this.onlineExamStart,
    this.onlineExamStartTime,
    this.onlineExamEnd,
    this.onlineExamEndTime,
    this.onlineExamPause,
    this.onlineExamPauseTime,
    this.siteSubjectGroupConditionSettingId,
    this.examAttendanceStatus,
    this.examHeldStatus,
    this.attendanceSubmitByMachine,
    this.attendanceUpdateAt,
    this.obtaineMarks,
    this.countableObtaineMarks,
    this.graceMarks,
    this.passMark,
    this.examTypeCountableMarksStatus,
    this.examTypeCountableMarks,
    this.examTypeCountablePersentOfObtainMarks,
    this.subjectExamTypeMark,
    this.siteSubjectExaminationMarkId,
    this.siteSubjectExaminationExamTypeMarkId,
    this.siteBaseExamRoomSettingId,
    this.roomId,
    this.columnPosition,
    this.seatNumber,
    this.academicSeatPlanTypeId,
    this.academicSeatPlanStyleId,
    this.siteId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.marksInputBy,
    this.marksLastUpdateBy,
    this.attendanceSubmitBy,
    this.loadingShow,
    this.academicExamType,
  });

  SiteExamDeclareStudentSubject copyWith({
    int? id,
    int? siteExamDeclareId,
    int? siteExamDeclareStudentId,
    int? studentHistoryId,
    int? siteExamRoutineId,
    int? examinationId,
    int? academicExamTypeId,
    int? onlineExamStatus,
    dynamic onlineExamTime,
    dynamic onlineExamTimeLeft,
    int? onlineExamApplyForRestart,
    int? onlineExamRestartApprove,
    dynamic onlineExamRestartApplyTime,
    int? onlineExamRestartApplyAmount,
    int? onlineExamPresentByStudent,
    int? onlineExamStartByTeacher,
    int? onlineExamStart,
    dynamic onlineExamStartTime,
    int? onlineExamEnd,
    dynamic onlineExamEndTime,
    int? onlineExamPause,
    dynamic onlineExamPauseTime,
    int? siteSubjectGroupConditionSettingId,
    bool? examAttendanceStatus,
    bool? examHeldStatus,
    int? attendanceSubmitByMachine,
    DateTime? attendanceUpdateAt,
    int? obtaineMarks,
    int? countableObtaineMarks,
    dynamic graceMarks,
    int? passMark,
    int? examTypeCountableMarksStatus,
    int? examTypeCountableMarks,
    int? examTypeCountablePersentOfObtainMarks,
    int? subjectExamTypeMark,
    dynamic siteSubjectExaminationMarkId,
    dynamic siteSubjectExaminationExamTypeMarkId,
    dynamic siteBaseExamRoomSettingId,
    dynamic roomId,
    dynamic columnPosition,
    dynamic seatNumber,
    dynamic academicSeatPlanTypeId,
    dynamic academicSeatPlanStyleId,
    int? siteId,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? marksInputBy,
    dynamic marksLastUpdateBy,
    int? attendanceSubmitBy,
    bool? loadingShow,
    AcademicExamType? academicExamType,
  }) =>
      SiteExamDeclareStudentSubject(
        id: id ?? this.id,
        siteExamDeclareId: siteExamDeclareId ?? this.siteExamDeclareId,
        siteExamDeclareStudentId:
            siteExamDeclareStudentId ?? this.siteExamDeclareStudentId,
        studentHistoryId: studentHistoryId ?? this.studentHistoryId,
        siteExamRoutineId: siteExamRoutineId ?? this.siteExamRoutineId,
        examinationId: examinationId ?? this.examinationId,
        academicExamTypeId: academicExamTypeId ?? this.academicExamTypeId,
        onlineExamStatus: onlineExamStatus ?? this.onlineExamStatus,
        onlineExamTime: onlineExamTime ?? this.onlineExamTime,
        onlineExamTimeLeft: onlineExamTimeLeft ?? this.onlineExamTimeLeft,
        onlineExamApplyForRestart:
            onlineExamApplyForRestart ?? this.onlineExamApplyForRestart,
        onlineExamRestartApprove:
            onlineExamRestartApprove ?? this.onlineExamRestartApprove,
        onlineExamRestartApplyTime:
            onlineExamRestartApplyTime ?? this.onlineExamRestartApplyTime,
        onlineExamRestartApplyAmount:
            onlineExamRestartApplyAmount ?? this.onlineExamRestartApplyAmount,
        onlineExamPresentByStudent:
            onlineExamPresentByStudent ?? this.onlineExamPresentByStudent,
        onlineExamStartByTeacher:
            onlineExamStartByTeacher ?? this.onlineExamStartByTeacher,
        onlineExamStart: onlineExamStart ?? this.onlineExamStart,
        onlineExamStartTime: onlineExamStartTime ?? this.onlineExamStartTime,
        onlineExamEnd: onlineExamEnd ?? this.onlineExamEnd,
        onlineExamEndTime: onlineExamEndTime ?? this.onlineExamEndTime,
        onlineExamPause: onlineExamPause ?? this.onlineExamPause,
        onlineExamPauseTime: onlineExamPauseTime ?? this.onlineExamPauseTime,
        siteSubjectGroupConditionSettingId:
            siteSubjectGroupConditionSettingId ??
                this.siteSubjectGroupConditionSettingId,
        examAttendanceStatus: examAttendanceStatus ?? this.examAttendanceStatus,
        examHeldStatus: examHeldStatus ?? this.examHeldStatus,
        attendanceSubmitByMachine:
            attendanceSubmitByMachine ?? this.attendanceSubmitByMachine,
        attendanceUpdateAt: attendanceUpdateAt ?? this.attendanceUpdateAt,
        obtaineMarks: obtaineMarks ?? this.obtaineMarks,
        countableObtaineMarks:
            countableObtaineMarks ?? this.countableObtaineMarks,
        graceMarks: graceMarks ?? this.graceMarks,
        passMark: passMark ?? this.passMark,
        examTypeCountableMarksStatus:
            examTypeCountableMarksStatus ?? this.examTypeCountableMarksStatus,
        examTypeCountableMarks:
            examTypeCountableMarks ?? this.examTypeCountableMarks,
        examTypeCountablePersentOfObtainMarks:
            examTypeCountablePersentOfObtainMarks ??
                this.examTypeCountablePersentOfObtainMarks,
        subjectExamTypeMark: subjectExamTypeMark ?? this.subjectExamTypeMark,
        siteSubjectExaminationMarkId:
            siteSubjectExaminationMarkId ?? this.siteSubjectExaminationMarkId,
        siteSubjectExaminationExamTypeMarkId:
            siteSubjectExaminationExamTypeMarkId ??
                this.siteSubjectExaminationExamTypeMarkId,
        siteBaseExamRoomSettingId:
            siteBaseExamRoomSettingId ?? this.siteBaseExamRoomSettingId,
        roomId: roomId ?? this.roomId,
        columnPosition: columnPosition ?? this.columnPosition,
        seatNumber: seatNumber ?? this.seatNumber,
        academicSeatPlanTypeId:
            academicSeatPlanTypeId ?? this.academicSeatPlanTypeId,
        academicSeatPlanStyleId:
            academicSeatPlanStyleId ?? this.academicSeatPlanStyleId,
        siteId: siteId ?? this.siteId,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        marksInputBy: marksInputBy ?? this.marksInputBy,
        marksLastUpdateBy: marksLastUpdateBy ?? this.marksLastUpdateBy,
        attendanceSubmitBy: attendanceSubmitBy ?? this.attendanceSubmitBy,
        loadingShow: loadingShow ?? this.loadingShow,
        academicExamType: academicExamType ?? this.academicExamType,
      );

  factory SiteExamDeclareStudentSubject.fromJson(String str) =>
      SiteExamDeclareStudentSubject.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SiteExamDeclareStudentSubject.fromMap(Map<String, dynamic> json) =>
      SiteExamDeclareStudentSubject(
        id: json["id"],
        siteExamDeclareId: json["site_exam_declare_id"],
        siteExamDeclareStudentId: json["site_exam_declare_student_id"],
        studentHistoryId: json["student_history_id"],
        siteExamRoutineId: json["site_exam_routine_id"],
        examinationId: json["examination_id"],
        academicExamTypeId: json["academic_exam_type_id"],
        onlineExamStatus: json["online_exam_status"],
        onlineExamTime: json["online_exam_time"],
        onlineExamTimeLeft: json["online_exam_time_left"],
        onlineExamApplyForRestart: json["online_exam_apply_for_restart"],
        onlineExamRestartApprove: json["online_exam_restart_approve"],
        onlineExamRestartApplyTime: json["online_exam_restart_apply_time"],
        onlineExamRestartApplyAmount: json["online_exam_restart_apply_amount"],
        onlineExamPresentByStudent: json["online_exam_present_by_student"],
        onlineExamStartByTeacher: json["online_exam_start_by_teacher"],
        onlineExamStart: json["online_exam_start"],
        onlineExamStartTime: json["online_exam_start_time"],
        onlineExamEnd: json["online_exam_end"],
        onlineExamEndTime: json["online_exam_end_time"],
        onlineExamPause: json["online_exam_pause"],
        onlineExamPauseTime: json["online_exam_pause_time"],
        siteSubjectGroupConditionSettingId:
            json["site_subject_group_condition_setting_id"],
        examAttendanceStatus: json["exam_attendance_status"],
        examHeldStatus: json["exam_held_status"],
        attendanceSubmitByMachine: json["attendance_submit_by_machine"],
        attendanceUpdateAt: json["Attendance_update_at"] == null
            ? null
            : DateTime.parse(json["Attendance_update_at"]),
        obtaineMarks: json["obtaine_marks"],
        countableObtaineMarks: json["countable_obtaine_marks"],
        graceMarks: json["grace_marks"],
        passMark: json["pass_mark"],
        examTypeCountableMarksStatus: json["exam_type_countable_marks_status"],
        examTypeCountableMarks: json["exam_type_countable_marks"],
        examTypeCountablePersentOfObtainMarks:
            json["exam_type_countable_persent_of_obtain_marks"],
        subjectExamTypeMark: json["subject_exam_type_mark"],
        siteSubjectExaminationMarkId: json["site_subject_examination_mark_id"],
        siteSubjectExaminationExamTypeMarkId:
            json["site_subject_examination_exam_type_mark_id"],
        siteBaseExamRoomSettingId: json["site_base_exam_room_setting_id"],
        roomId: json["room_id"],
        columnPosition: json["column_position"],
        seatNumber: json["seat_number"],
        academicSeatPlanTypeId: json["academic_seat_plan_type_id"],
        academicSeatPlanStyleId: json["academic_seat_plan_style_id"],
        siteId: json["site_id"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        marksInputBy: json["marks_input_by"],
        marksLastUpdateBy: json["marks_last_update_by"],
        attendanceSubmitBy: json["attendance_submit_by"],
        loadingShow: json["loading_show"],
        academicExamType: json["academic_exam_type"] == null
            ? null
            : AcademicExamType.fromMap(json["academic_exam_type"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "site_exam_declare_id": siteExamDeclareId,
        "site_exam_declare_student_id": siteExamDeclareStudentId,
        "student_history_id": studentHistoryId,
        "site_exam_routine_id": siteExamRoutineId,
        "examination_id": examinationId,
        "academic_exam_type_id": academicExamTypeId,
        "online_exam_status": onlineExamStatus,
        "online_exam_time": onlineExamTime,
        "online_exam_time_left": onlineExamTimeLeft,
        "online_exam_apply_for_restart": onlineExamApplyForRestart,
        "online_exam_restart_approve": onlineExamRestartApprove,
        "online_exam_restart_apply_time": onlineExamRestartApplyTime,
        "online_exam_restart_apply_amount": onlineExamRestartApplyAmount,
        "online_exam_present_by_student": onlineExamPresentByStudent,
        "online_exam_start_by_teacher": onlineExamStartByTeacher,
        "online_exam_start": onlineExamStart,
        "online_exam_start_time": onlineExamStartTime,
        "online_exam_end": onlineExamEnd,
        "online_exam_end_time": onlineExamEndTime,
        "online_exam_pause": onlineExamPause,
        "online_exam_pause_time": onlineExamPauseTime,
        "site_subject_group_condition_setting_id":
            siteSubjectGroupConditionSettingId,
        "exam_attendance_status": examAttendanceStatus,
        "exam_held_status": examHeldStatus,
        "attendance_submit_by_machine": attendanceSubmitByMachine,
        "Attendance_update_at": attendanceUpdateAt?.toIso8601String(),
        "obtaine_marks": obtaineMarks,
        "countable_obtaine_marks": countableObtaineMarks,
        "grace_marks": graceMarks,
        "pass_mark": passMark,
        "exam_type_countable_marks_status": examTypeCountableMarksStatus,
        "exam_type_countable_marks": examTypeCountableMarks,
        "exam_type_countable_persent_of_obtain_marks":
            examTypeCountablePersentOfObtainMarks,
        "subject_exam_type_mark": subjectExamTypeMark,
        "site_subject_examination_mark_id": siteSubjectExaminationMarkId,
        "site_subject_examination_exam_type_mark_id":
            siteSubjectExaminationExamTypeMarkId,
        "site_base_exam_room_setting_id": siteBaseExamRoomSettingId,
        "room_id": roomId,
        "column_position": columnPosition,
        "seat_number": seatNumber,
        "academic_seat_plan_type_id": academicSeatPlanTypeId,
        "academic_seat_plan_style_id": academicSeatPlanStyleId,
        "site_id": siteId,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "marks_input_by": marksInputBy,
        "marks_last_update_by": marksLastUpdateBy,
        "attendance_submit_by": attendanceSubmitBy,
        "loading_show": loadingShow,
        "academic_exam_type": academicExamType?.toMap(),
      };
}

class StudentHistory {
  int? id;
  int? userId;
  int? studentRollNumber;
  int? academicClassGroupId;
  int? academicSectionId;
  int? academicSessionId;
  String? fullName;
  String? studentFullRollNumber;
  String? fullNameUsername;
  String? rollFullNameUsername;
  ClassGroup? classGroup;
  Session? session;
  dynamic section;
  Student? student;

  StudentHistory({
    this.id,
    this.userId,
    this.studentRollNumber,
    this.academicClassGroupId,
    this.academicSectionId,
    this.academicSessionId,
    this.fullName,
    this.studentFullRollNumber,
    this.fullNameUsername,
    this.rollFullNameUsername,
    this.classGroup,
    this.session,
    this.section,
    this.student,
  });

  StudentHistory copyWith({
    int? id,
    int? userId,
    int? studentRollNumber,
    int? academicClassGroupId,
    int? academicSectionId,
    int? academicSessionId,
    String? fullName,
    String? studentFullRollNumber,
    String? fullNameUsername,
    String? rollFullNameUsername,
    ClassGroup? classGroup,
    Session? session,
    dynamic section,
    Student? student,
  }) =>
      StudentHistory(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        studentRollNumber: studentRollNumber ?? this.studentRollNumber,
        academicClassGroupId: academicClassGroupId ?? this.academicClassGroupId,
        academicSectionId: academicSectionId ?? this.academicSectionId,
        academicSessionId: academicSessionId ?? this.academicSessionId,
        fullName: fullName ?? this.fullName,
        studentFullRollNumber:
            studentFullRollNumber ?? this.studentFullRollNumber,
        fullNameUsername: fullNameUsername ?? this.fullNameUsername,
        rollFullNameUsername: rollFullNameUsername ?? this.rollFullNameUsername,
        classGroup: classGroup ?? this.classGroup,
        session: session ?? this.session,
        section: section ?? this.section,
        student: student ?? this.student,
      );

  factory StudentHistory.fromJson(String str) =>
      StudentHistory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StudentHistory.fromMap(Map<String, dynamic> json) => StudentHistory(
        id: json["id"],
        userId: json["user_id"],
        studentRollNumber: json["student_roll_number"],
        academicClassGroupId: json["academic_class_group_id"],
        academicSectionId: json["academic_section_id"],
        academicSessionId: json["academic_session_id"],
        fullName: json["full_name"],
        studentFullRollNumber: json["student_full_roll_number"],
        fullNameUsername: json["full_name_username"],
        rollFullNameUsername: json["roll_full_name_username"],
        classGroup: json["class_group"] == null
            ? null
            : ClassGroup.fromMap(json["class_group"]),
        session:
            json["session"] == null ? null : Session.fromMap(json["session"]),
        section: json["section"],
        student:
            json["student"] == null ? null : Student.fromMap(json["student"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "student_roll_number": studentRollNumber,
        "academic_class_group_id": academicClassGroupId,
        "academic_section_id": academicSectionId,
        "academic_session_id": academicSessionId,
        "full_name": fullName,
        "student_full_roll_number": studentFullRollNumber,
        "full_name_username": fullNameUsername,
        "roll_full_name_username": rollFullNameUsername,
        "class_group": classGroup?.toMap(),
        "session": session?.toMap(),
        "section": section,
        "student": student?.toMap(),
      };
}

class ClassGroup {
  int? id;
  String? groupName;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  ClassGroup({
    this.id,
    this.groupName,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  ClassGroup copyWith({
    int? id,
    String? groupName,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
  }) =>
      ClassGroup(
        id: id ?? this.id,
        groupName: groupName ?? this.groupName,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory ClassGroup.fromJson(String str) =>
      ClassGroup.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ClassGroup.fromMap(Map<String, dynamic> json) => ClassGroup(
        id: json["id"],
        groupName: json["group_name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "group_name": groupName,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

class Session {
  int? id;
  String? sessionName;
  int? serialNo;
  int? status;
  dynamic createdAt;
  dynamic updatedAt;

  Session({
    this.id,
    this.sessionName,
    this.serialNo,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Session copyWith({
    int? id,
    String? sessionName,
    int? serialNo,
    int? status,
    dynamic createdAt,
    dynamic updatedAt,
  }) =>
      Session(
        id: id ?? this.id,
        sessionName: sessionName ?? this.sessionName,
        serialNo: serialNo ?? this.serialNo,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Session.fromJson(String str) => Session.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Session.fromMap(Map<String, dynamic> json) => Session(
        id: json["id"],
        sessionName: json["session_name"],
        serialNo: json["serial_no"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "session_name": sessionName,
        "serial_no": serialNo,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Student {
  int? id;
  String? username;
  String? userType;
  dynamic email;
  int? canUpdate;
  String? alias;
  dynamic employeeId;
  int? instituteHead;
  dynamic signature;
  int? employeeSerial;
  int? companyBranchId;
  dynamic biometricId;
  int? fingerTaken;
  int? attendanceSms;
  String? nameNativeLanguage;
  String? contactNumber;
  dynamic bloodGroupId;
  int? motherOccupationId;
  dynamic motherYearlyIncome;
  String? motherContactNumber;
  dynamic motherEmail;
  String? motherNid;
  dynamic motherBcn;
  int? fatherOccupationId;
  int? fatherYearlyIncome;
  dynamic fatherContactNumber;
  dynamic fatherEmail;
  String? fatherNid;
  dynamic fatherBcn;
  int? presentCountryId;
  int? presentDivisionId;
  int? presentDistrictId;
  dynamic presentThanaId;
  int? permanentCountryId;
  int? permanentDivisionId;
  int? permanentDistrictId;
  int? permanentThanaId;
  int? genderId;
  int? religionId;
  int? academicVersionId;
  int? academicYearId;
  int? academicSessionId;
  int? academicStudentCategoryId;
  dynamic academicStudentTypeId;
  int? academicStudentAdmissionTypeId;
  dynamic academicQuataId;
  dynamic studentRegistrationNumber;
  dynamic boardRegistrationNumber;
  int? religionSubjectId;
  String? academicSubjectIds;
  List<SubjectId>? compulsorySubjectIds;
  List<SubjectId>? selectiveCompulsorySubjectIds;
  List<SubjectId>? optionalSubjectIds;
  List<dynamic>? selectiveMarkinglessSubjectIds;
  int? guardianStudentRelationId;
  int? academicClassId;
  dynamic siteBatchDetailId;
  int? academicSectionId;
  int? academicClassGroupId;
  int? studentRollNumber;
  dynamic profession;
  int? localGuardianUserId;
  dynamic academicDepartmentId;
  dynamic academicResidenceId;
  dynamic academicTransportId;
  dynamic designationId;
  dynamic empCategoryId;
  dynamic empPositionId;
  int? academicShiftId;
  dynamic deptJoinDate;
  dynamic phone;
  dynamic emergencyContact;
  dynamic nidNumber;
  dynamic passportNo;
  dynamic birthCertificateNo;
  dynamic nationality;
  dynamic instituteJoiningDate;
  dynamic ntrcRegistrationNumber;
  int? status;
  DateTime? dateOfBirth;
  int? siteId;
  int? academicGroupId;
  dynamic deletedAt;
  dynamic locale;
  dynamic lastAcademicGroupId;
  int? siteStudentRegistrationApplicationId;
  String? presentIdCardCode;
  dynamic exIdCardCode;
  dynamic studentRollNumberPrefix;
  DateTime? lastLogin;
  DateTime? createdAt;
  int? createdBy;
  DateTime? updatedAt;
  int? updatedBy;
  int? studentEduPaymentStatus;
  dynamic eduStudentPanelCloseDate;
  String? smsContactField;
  String? fullName;
  String? studentFullRollNumber;
  String? firstName;
  dynamic lastName;
  String? address;
  dynamic spouseName;
  String? motherName;
  String? fatherName;
  String? permanentAddress;
  List<StudentTranslation>? translations;

  Student({
    this.id,
    this.username,
    this.userType,
    this.email,
    this.canUpdate,
    this.alias,
    this.employeeId,
    this.instituteHead,
    this.signature,
    this.employeeSerial,
    this.companyBranchId,
    this.biometricId,
    this.fingerTaken,
    this.attendanceSms,
    this.nameNativeLanguage,
    this.contactNumber,
    this.bloodGroupId,
    this.motherOccupationId,
    this.motherYearlyIncome,
    this.motherContactNumber,
    this.motherEmail,
    this.motherNid,
    this.motherBcn,
    this.fatherOccupationId,
    this.fatherYearlyIncome,
    this.fatherContactNumber,
    this.fatherEmail,
    this.fatherNid,
    this.fatherBcn,
    this.presentCountryId,
    this.presentDivisionId,
    this.presentDistrictId,
    this.presentThanaId,
    this.permanentCountryId,
    this.permanentDivisionId,
    this.permanentDistrictId,
    this.permanentThanaId,
    this.genderId,
    this.religionId,
    this.academicVersionId,
    this.academicYearId,
    this.academicSessionId,
    this.academicStudentCategoryId,
    this.academicStudentTypeId,
    this.academicStudentAdmissionTypeId,
    this.academicQuataId,
    this.studentRegistrationNumber,
    this.boardRegistrationNumber,
    this.religionSubjectId,
    this.academicSubjectIds,
    this.compulsorySubjectIds,
    this.selectiveCompulsorySubjectIds,
    this.optionalSubjectIds,
    this.selectiveMarkinglessSubjectIds,
    this.guardianStudentRelationId,
    this.academicClassId,
    this.siteBatchDetailId,
    this.academicSectionId,
    this.academicClassGroupId,
    this.studentRollNumber,
    this.profession,
    this.localGuardianUserId,
    this.academicDepartmentId,
    this.academicResidenceId,
    this.academicTransportId,
    this.designationId,
    this.empCategoryId,
    this.empPositionId,
    this.academicShiftId,
    this.deptJoinDate,
    this.phone,
    this.emergencyContact,
    this.nidNumber,
    this.passportNo,
    this.birthCertificateNo,
    this.nationality,
    this.instituteJoiningDate,
    this.ntrcRegistrationNumber,
    this.status,
    this.dateOfBirth,
    this.siteId,
    this.academicGroupId,
    this.deletedAt,
    this.locale,
    this.lastAcademicGroupId,
    this.siteStudentRegistrationApplicationId,
    this.presentIdCardCode,
    this.exIdCardCode,
    this.studentRollNumberPrefix,
    this.lastLogin,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.studentEduPaymentStatus,
    this.eduStudentPanelCloseDate,
    this.smsContactField,
    this.fullName,
    this.studentFullRollNumber,
    this.firstName,
    this.lastName,
    this.address,
    this.spouseName,
    this.motherName,
    this.fatherName,
    this.permanentAddress,
    this.translations,
  });

  Student copyWith({
    int? id,
    String? username,
    String? userType,
    dynamic email,
    int? canUpdate,
    String? alias,
    dynamic employeeId,
    int? instituteHead,
    dynamic signature,
    int? employeeSerial,
    int? companyBranchId,
    dynamic biometricId,
    int? fingerTaken,
    int? attendanceSms,
    String? nameNativeLanguage,
    String? contactNumber,
    dynamic bloodGroupId,
    int? motherOccupationId,
    dynamic motherYearlyIncome,
    String? motherContactNumber,
    dynamic motherEmail,
    String? motherNid,
    dynamic motherBcn,
    int? fatherOccupationId,
    int? fatherYearlyIncome,
    dynamic fatherContactNumber,
    dynamic fatherEmail,
    String? fatherNid,
    dynamic fatherBcn,
    int? presentCountryId,
    int? presentDivisionId,
    int? presentDistrictId,
    dynamic presentThanaId,
    int? permanentCountryId,
    int? permanentDivisionId,
    int? permanentDistrictId,
    int? permanentThanaId,
    int? genderId,
    int? religionId,
    int? academicVersionId,
    int? academicYearId,
    int? academicSessionId,
    int? academicStudentCategoryId,
    dynamic academicStudentTypeId,
    int? academicStudentAdmissionTypeId,
    dynamic academicQuataId,
    dynamic studentRegistrationNumber,
    dynamic boardRegistrationNumber,
    int? religionSubjectId,
    String? academicSubjectIds,
    List<SubjectId>? compulsorySubjectIds,
    List<SubjectId>? selectiveCompulsorySubjectIds,
    List<SubjectId>? optionalSubjectIds,
    List<dynamic>? selectiveMarkinglessSubjectIds,
    int? guardianStudentRelationId,
    int? academicClassId,
    dynamic siteBatchDetailId,
    int? academicSectionId,
    int? academicClassGroupId,
    int? studentRollNumber,
    dynamic profession,
    int? localGuardianUserId,
    dynamic academicDepartmentId,
    dynamic academicResidenceId,
    dynamic academicTransportId,
    dynamic designationId,
    dynamic empCategoryId,
    dynamic empPositionId,
    int? academicShiftId,
    dynamic deptJoinDate,
    dynamic phone,
    dynamic emergencyContact,
    dynamic nidNumber,
    dynamic passportNo,
    dynamic birthCertificateNo,
    dynamic nationality,
    dynamic instituteJoiningDate,
    dynamic ntrcRegistrationNumber,
    int? status,
    DateTime? dateOfBirth,
    int? siteId,
    int? academicGroupId,
    dynamic deletedAt,
    dynamic locale,
    dynamic lastAcademicGroupId,
    int? siteStudentRegistrationApplicationId,
    String? presentIdCardCode,
    dynamic exIdCardCode,
    dynamic studentRollNumberPrefix,
    DateTime? lastLogin,
    DateTime? createdAt,
    int? createdBy,
    DateTime? updatedAt,
    int? updatedBy,
    int? studentEduPaymentStatus,
    dynamic eduStudentPanelCloseDate,
    String? smsContactField,
    String? fullName,
    String? studentFullRollNumber,
    String? firstName,
    dynamic lastName,
    String? address,
    dynamic spouseName,
    String? motherName,
    String? fatherName,
    String? permanentAddress,
    List<StudentTranslation>? translations,
  }) =>
      Student(
        id: id ?? this.id,
        username: username ?? this.username,
        userType: userType ?? this.userType,
        email: email ?? this.email,
        canUpdate: canUpdate ?? this.canUpdate,
        alias: alias ?? this.alias,
        employeeId: employeeId ?? this.employeeId,
        instituteHead: instituteHead ?? this.instituteHead,
        signature: signature ?? this.signature,
        employeeSerial: employeeSerial ?? this.employeeSerial,
        companyBranchId: companyBranchId ?? this.companyBranchId,
        biometricId: biometricId ?? this.biometricId,
        fingerTaken: fingerTaken ?? this.fingerTaken,
        attendanceSms: attendanceSms ?? this.attendanceSms,
        nameNativeLanguage: nameNativeLanguage ?? this.nameNativeLanguage,
        contactNumber: contactNumber ?? this.contactNumber,
        bloodGroupId: bloodGroupId ?? this.bloodGroupId,
        motherOccupationId: motherOccupationId ?? this.motherOccupationId,
        motherYearlyIncome: motherYearlyIncome ?? this.motherYearlyIncome,
        motherContactNumber: motherContactNumber ?? this.motherContactNumber,
        motherEmail: motherEmail ?? this.motherEmail,
        motherNid: motherNid ?? this.motherNid,
        motherBcn: motherBcn ?? this.motherBcn,
        fatherOccupationId: fatherOccupationId ?? this.fatherOccupationId,
        fatherYearlyIncome: fatherYearlyIncome ?? this.fatherYearlyIncome,
        fatherContactNumber: fatherContactNumber ?? this.fatherContactNumber,
        fatherEmail: fatherEmail ?? this.fatherEmail,
        fatherNid: fatherNid ?? this.fatherNid,
        fatherBcn: fatherBcn ?? this.fatherBcn,
        presentCountryId: presentCountryId ?? this.presentCountryId,
        presentDivisionId: presentDivisionId ?? this.presentDivisionId,
        presentDistrictId: presentDistrictId ?? this.presentDistrictId,
        presentThanaId: presentThanaId ?? this.presentThanaId,
        permanentCountryId: permanentCountryId ?? this.permanentCountryId,
        permanentDivisionId: permanentDivisionId ?? this.permanentDivisionId,
        permanentDistrictId: permanentDistrictId ?? this.permanentDistrictId,
        permanentThanaId: permanentThanaId ?? this.permanentThanaId,
        genderId: genderId ?? this.genderId,
        religionId: religionId ?? this.religionId,
        academicVersionId: academicVersionId ?? this.academicVersionId,
        academicYearId: academicYearId ?? this.academicYearId,
        academicSessionId: academicSessionId ?? this.academicSessionId,
        academicStudentCategoryId:
            academicStudentCategoryId ?? this.academicStudentCategoryId,
        academicStudentTypeId:
            academicStudentTypeId ?? this.academicStudentTypeId,
        academicStudentAdmissionTypeId: academicStudentAdmissionTypeId ??
            this.academicStudentAdmissionTypeId,
        academicQuataId: academicQuataId ?? this.academicQuataId,
        studentRegistrationNumber:
            studentRegistrationNumber ?? this.studentRegistrationNumber,
        boardRegistrationNumber:
            boardRegistrationNumber ?? this.boardRegistrationNumber,
        religionSubjectId: religionSubjectId ?? this.religionSubjectId,
        academicSubjectIds: academicSubjectIds ?? this.academicSubjectIds,
        compulsorySubjectIds: compulsorySubjectIds ?? this.compulsorySubjectIds,
        selectiveCompulsorySubjectIds:
            selectiveCompulsorySubjectIds ?? this.selectiveCompulsorySubjectIds,
        optionalSubjectIds: optionalSubjectIds ?? this.optionalSubjectIds,
        selectiveMarkinglessSubjectIds: selectiveMarkinglessSubjectIds ??
            this.selectiveMarkinglessSubjectIds,
        guardianStudentRelationId:
            guardianStudentRelationId ?? this.guardianStudentRelationId,
        academicClassId: academicClassId ?? this.academicClassId,
        siteBatchDetailId: siteBatchDetailId ?? this.siteBatchDetailId,
        academicSectionId: academicSectionId ?? this.academicSectionId,
        academicClassGroupId: academicClassGroupId ?? this.academicClassGroupId,
        studentRollNumber: studentRollNumber ?? this.studentRollNumber,
        profession: profession ?? this.profession,
        localGuardianUserId: localGuardianUserId ?? this.localGuardianUserId,
        academicDepartmentId: academicDepartmentId ?? this.academicDepartmentId,
        academicResidenceId: academicResidenceId ?? this.academicResidenceId,
        academicTransportId: academicTransportId ?? this.academicTransportId,
        designationId: designationId ?? this.designationId,
        empCategoryId: empCategoryId ?? this.empCategoryId,
        empPositionId: empPositionId ?? this.empPositionId,
        academicShiftId: academicShiftId ?? this.academicShiftId,
        deptJoinDate: deptJoinDate ?? this.deptJoinDate,
        phone: phone ?? this.phone,
        emergencyContact: emergencyContact ?? this.emergencyContact,
        nidNumber: nidNumber ?? this.nidNumber,
        passportNo: passportNo ?? this.passportNo,
        birthCertificateNo: birthCertificateNo ?? this.birthCertificateNo,
        nationality: nationality ?? this.nationality,
        instituteJoiningDate: instituteJoiningDate ?? this.instituteJoiningDate,
        ntrcRegistrationNumber:
            ntrcRegistrationNumber ?? this.ntrcRegistrationNumber,
        status: status ?? this.status,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        siteId: siteId ?? this.siteId,
        academicGroupId: academicGroupId ?? this.academicGroupId,
        deletedAt: deletedAt ?? this.deletedAt,
        locale: locale ?? this.locale,
        lastAcademicGroupId: lastAcademicGroupId ?? this.lastAcademicGroupId,
        siteStudentRegistrationApplicationId:
            siteStudentRegistrationApplicationId ??
                this.siteStudentRegistrationApplicationId,
        presentIdCardCode: presentIdCardCode ?? this.presentIdCardCode,
        exIdCardCode: exIdCardCode ?? this.exIdCardCode,
        studentRollNumberPrefix:
            studentRollNumberPrefix ?? this.studentRollNumberPrefix,
        lastLogin: lastLogin ?? this.lastLogin,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
        studentEduPaymentStatus:
            studentEduPaymentStatus ?? this.studentEduPaymentStatus,
        eduStudentPanelCloseDate:
            eduStudentPanelCloseDate ?? this.eduStudentPanelCloseDate,
        smsContactField: smsContactField ?? this.smsContactField,
        fullName: fullName ?? this.fullName,
        studentFullRollNumber:
            studentFullRollNumber ?? this.studentFullRollNumber,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        address: address ?? this.address,
        spouseName: spouseName ?? this.spouseName,
        motherName: motherName ?? this.motherName,
        fatherName: fatherName ?? this.fatherName,
        permanentAddress: permanentAddress ?? this.permanentAddress,
        translations: translations ?? this.translations,
      );

  factory Student.fromJson(String str) => Student.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Student.fromMap(Map<String, dynamic> json) => Student(
        id: json["id"],
        username: json["username"],
        userType: json["user_type"],
        email: json["email"],
        canUpdate: json["can_update"],
        alias: json["alias"],
        employeeId: json["employee_id"],
        instituteHead: json["institute_head"],
        signature: json["signature"],
        employeeSerial: json["employee_serial"],
        companyBranchId: json["company_branch_id"],
        biometricId: json["biometric_id"],
        fingerTaken: json["finger_taken"],
        attendanceSms: json["attendance_sms"],
        nameNativeLanguage: json["name_native_language"],
        contactNumber: json["contact_number"],
        bloodGroupId: json["blood_group_id"],
        motherOccupationId: json["mother_occupation_id"],
        motherYearlyIncome: json["mother_yearly_income"],
        motherContactNumber: json["mother_contact_number"],
        motherEmail: json["mother_email"],
        motherNid: json["mother_nid"],
        motherBcn: json["mother_bcn"],
        fatherOccupationId: json["father_occupation_id"],
        fatherYearlyIncome: json["father_yearly_income"],
        fatherContactNumber: json["father_contact_number"],
        fatherEmail: json["father_email"],
        fatherNid: json["father_nid"],
        fatherBcn: json["father_bcn"],
        presentCountryId: json["present_country_id"],
        presentDivisionId: json["present_division_id"],
        presentDistrictId: json["present_district_id"],
        presentThanaId: json["present_thana_id"],
        permanentCountryId: json["permanent_country_id"],
        permanentDivisionId: json["permanent_division_id"],
        permanentDistrictId: json["permanent_district_id"],
        permanentThanaId: json["permanent_thana_id"],
        genderId: json["gender_id"],
        religionId: json["religion_id"],
        academicVersionId: json["academic_version_id"],
        academicYearId: json["academic_year_id"],
        academicSessionId: json["academic_session_id"],
        academicStudentCategoryId: json["academic_student_category_id"],
        academicStudentTypeId: json["academic_student_type_id"],
        academicStudentAdmissionTypeId:
            json["academic_student_admission_type_id"],
        academicQuataId: json["academic_quata_id"],
        studentRegistrationNumber: json["student_registration_number"],
        boardRegistrationNumber: json["board_registration_number"],
        religionSubjectId: json["religion_subject_id"],
        academicSubjectIds: json["academic_subject_ids"],
        compulsorySubjectIds: json["compulsory_subject_ids"] == null
            ? []
            : List<SubjectId>.from(json["compulsory_subject_ids"]!
                .map((x) => SubjectId.fromMap(x))),
        selectiveCompulsorySubjectIds:
            json["selective_compulsory_subject_ids"] == null
                ? []
                : List<SubjectId>.from(json["selective_compulsory_subject_ids"]!
                    .map((x) => SubjectId.fromMap(x))),
        optionalSubjectIds: json["optional_subject_ids"] == null
            ? []
            : List<SubjectId>.from(
                json["optional_subject_ids"]!.map((x) => SubjectId.fromMap(x))),
        selectiveMarkinglessSubjectIds:
            json["selective_markingless_subject_ids"] == null
                ? []
                : List<dynamic>.from(
                    json["selective_markingless_subject_ids"]!.map((x) => x)),
        guardianStudentRelationId: json["guardian_student_relation_id"],
        academicClassId: json["academic_class_id"],
        siteBatchDetailId: json["site_batch_detail_id"],
        academicSectionId: json["academic_section_id"],
        academicClassGroupId: json["academic_class_group_id"],
        studentRollNumber: json["student_roll_number"],
        profession: json["profession"],
        localGuardianUserId: json["local_guardian_user_id"],
        academicDepartmentId: json["academic_department_id"],
        academicResidenceId: json["academic_residence_id"],
        academicTransportId: json["academic_transport_id"],
        designationId: json["designation_id"],
        empCategoryId: json["emp_category_id"],
        empPositionId: json["emp_position_id"],
        academicShiftId: json["academic_shift_id"],
        deptJoinDate: json["dept_join_date"],
        phone: json["phone"],
        emergencyContact: json["emergency_contact"],
        nidNumber: json["nid_number"],
        passportNo: json["passport_no"],
        birthCertificateNo: json["birth_certificate_no"],
        nationality: json["nationality"],
        instituteJoiningDate: json["institute_joining_date"],
        ntrcRegistrationNumber: json["ntrc_registration_number"],
        status: json["status"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        siteId: json["site_id"],
        academicGroupId: json["academic_group_id"],
        deletedAt: json["deleted_at"],
        locale: json["locale"],
        lastAcademicGroupId: json["last_academic_group_id"],
        siteStudentRegistrationApplicationId:
            json["site_student_registration_application_id"],
        presentIdCardCode: json["present_id_card_code"],
        exIdCardCode: json["ex_id_card_code"],
        studentRollNumberPrefix: json["student_roll_number_prefix"],
        lastLogin: json["last_login"] == null
            ? null
            : DateTime.parse(json["last_login"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        updatedBy: json["updated_by"],
        studentEduPaymentStatus: json["student_edu_payment_status"],
        eduStudentPanelCloseDate: json["edu_student_panel_close_date"],
        smsContactField: json["sms_contact_field"],
        fullName: json["full_name"],
        studentFullRollNumber: json["student_full_roll_number"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        address: json["address"],
        spouseName: json["spouse_name"],
        motherName: json["mother_name"],
        fatherName: json["father_name"],
        permanentAddress: json["permanent_address"],
        translations: json["translations"] == null
            ? []
            : List<StudentTranslation>.from(json["translations"]!
                .map((x) => StudentTranslation.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "user_type": userType,
        "email": email,
        "can_update": canUpdate,
        "alias": alias,
        "employee_id": employeeId,
        "institute_head": instituteHead,
        "signature": signature,
        "employee_serial": employeeSerial,
        "company_branch_id": companyBranchId,
        "biometric_id": biometricId,
        "finger_taken": fingerTaken,
        "attendance_sms": attendanceSms,
        "name_native_language": nameNativeLanguage,
        "contact_number": contactNumber,
        "blood_group_id": bloodGroupId,
        "mother_occupation_id": motherOccupationId,
        "mother_yearly_income": motherYearlyIncome,
        "mother_contact_number": motherContactNumber,
        "mother_email": motherEmail,
        "mother_nid": motherNid,
        "mother_bcn": motherBcn,
        "father_occupation_id": fatherOccupationId,
        "father_yearly_income": fatherYearlyIncome,
        "father_contact_number": fatherContactNumber,
        "father_email": fatherEmail,
        "father_nid": fatherNid,
        "father_bcn": fatherBcn,
        "present_country_id": presentCountryId,
        "present_division_id": presentDivisionId,
        "present_district_id": presentDistrictId,
        "present_thana_id": presentThanaId,
        "permanent_country_id": permanentCountryId,
        "permanent_division_id": permanentDivisionId,
        "permanent_district_id": permanentDistrictId,
        "permanent_thana_id": permanentThanaId,
        "gender_id": genderId,
        "religion_id": religionId,
        "academic_version_id": academicVersionId,
        "academic_year_id": academicYearId,
        "academic_session_id": academicSessionId,
        "academic_student_category_id": academicStudentCategoryId,
        "academic_student_type_id": academicStudentTypeId,
        "academic_student_admission_type_id": academicStudentAdmissionTypeId,
        "academic_quata_id": academicQuataId,
        "student_registration_number": studentRegistrationNumber,
        "board_registration_number": boardRegistrationNumber,
        "religion_subject_id": religionSubjectId,
        "academic_subject_ids": academicSubjectIds,
        "compulsory_subject_ids": compulsorySubjectIds == null
            ? []
            : List<dynamic>.from(compulsorySubjectIds!.map((x) => x.toMap())),
        "selective_compulsory_subject_ids":
            selectiveCompulsorySubjectIds == null
                ? []
                : List<dynamic>.from(
                    selectiveCompulsorySubjectIds!.map((x) => x.toMap())),
        "optional_subject_ids": optionalSubjectIds == null
            ? []
            : List<dynamic>.from(optionalSubjectIds!.map((x) => x.toMap())),
        "selective_markingless_subject_ids": selectiveMarkinglessSubjectIds ==
                null
            ? []
            : List<dynamic>.from(selectiveMarkinglessSubjectIds!.map((x) => x)),
        "guardian_student_relation_id": guardianStudentRelationId,
        "academic_class_id": academicClassId,
        "site_batch_detail_id": siteBatchDetailId,
        "academic_section_id": academicSectionId,
        "academic_class_group_id": academicClassGroupId,
        "student_roll_number": studentRollNumber,
        "profession": profession,
        "local_guardian_user_id": localGuardianUserId,
        "academic_department_id": academicDepartmentId,
        "academic_residence_id": academicResidenceId,
        "academic_transport_id": academicTransportId,
        "designation_id": designationId,
        "emp_category_id": empCategoryId,
        "emp_position_id": empPositionId,
        "academic_shift_id": academicShiftId,
        "dept_join_date": deptJoinDate,
        "phone": phone,
        "emergency_contact": emergencyContact,
        "nid_number": nidNumber,
        "passport_no": passportNo,
        "birth_certificate_no": birthCertificateNo,
        "nationality": nationality,
        "institute_joining_date": instituteJoiningDate,
        "ntrc_registration_number": ntrcRegistrationNumber,
        "status": status,
        "date_of_birth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "site_id": siteId,
        "academic_group_id": academicGroupId,
        "deleted_at": deletedAt,
        "locale": locale,
        "last_academic_group_id": lastAcademicGroupId,
        "site_student_registration_application_id":
            siteStudentRegistrationApplicationId,
        "present_id_card_code": presentIdCardCode,
        "ex_id_card_code": exIdCardCode,
        "student_roll_number_prefix": studentRollNumberPrefix,
        "last_login": lastLogin?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "created_by": createdBy,
        "updated_at": updatedAt?.toIso8601String(),
        "updated_by": updatedBy,
        "student_edu_payment_status": studentEduPaymentStatus,
        "edu_student_panel_close_date": eduStudentPanelCloseDate,
        "sms_contact_field": smsContactField,
        "full_name": fullName,
        "student_full_roll_number": studentFullRollNumber,
        "first_name": firstName,
        "last_name": lastName,
        "address": address,
        "spouse_name": spouseName,
        "mother_name": motherName,
        "father_name": fatherName,
        "permanent_address": permanentAddress,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toMap())),
      };
}

class SubjectId {
  int? id;
  int? belongsToAcademicGroup;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? subjectName;
  List<CompulsorySubjectIdTranslation>? translations;

  SubjectId({
    this.id,
    this.belongsToAcademicGroup,
    this.createdAt,
    this.updatedAt,
    this.subjectName,
    this.translations,
  });

  SubjectId copyWith({
    int? id,
    int? belongsToAcademicGroup,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? subjectName,
    List<CompulsorySubjectIdTranslation>? translations,
  }) =>
      SubjectId(
        id: id ?? this.id,
        belongsToAcademicGroup:
            belongsToAcademicGroup ?? this.belongsToAcademicGroup,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        subjectName: subjectName ?? this.subjectName,
        translations: translations ?? this.translations,
      );

  factory SubjectId.fromJson(String str) => SubjectId.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubjectId.fromMap(Map<String, dynamic> json) => SubjectId(
        id: json["id"],
        belongsToAcademicGroup: json["belongs_to_academic_group"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        subjectName: json["subject_name"],
        translations: json["translations"] == null
            ? []
            : List<CompulsorySubjectIdTranslation>.from(json["translations"]!
                .map((x) => CompulsorySubjectIdTranslation.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "belongs_to_academic_group": belongsToAcademicGroup,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "subject_name": subjectName,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toMap())),
      };
}

class CompulsorySubjectIdTranslation {
  int? id;
  String? academicSubjectId;
  String? subjectName;
  String? locale;

  CompulsorySubjectIdTranslation({
    this.id,
    this.academicSubjectId,
    this.subjectName,
    this.locale,
  });

  CompulsorySubjectIdTranslation copyWith({
    int? id,
    String? academicSubjectId,
    String? subjectName,
    String? locale,
  }) =>
      CompulsorySubjectIdTranslation(
        id: id ?? this.id,
        academicSubjectId: academicSubjectId ?? this.academicSubjectId,
        subjectName: subjectName ?? this.subjectName,
        locale: locale ?? this.locale,
      );

  factory CompulsorySubjectIdTranslation.fromJson(String str) =>
      CompulsorySubjectIdTranslation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CompulsorySubjectIdTranslation.fromMap(Map<String, dynamic> json) =>
      CompulsorySubjectIdTranslation(
        id: json["id"],
        academicSubjectId: json["academic_subject_id"],
        subjectName: json["subject_name"],
        locale: json["locale"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "academic_subject_id": academicSubjectId,
        "subject_name": subjectName,
        "locale": locale,
      };
}

class StudentTranslation {
  int? id;
  int? userId;
  String? firstName;
  dynamic lastName;
  String? fatherName;
  String? motherName;
  dynamic spouseName;
  String? address;
  String? permanentAddress;
  String? locale;
  dynamic localGuardianName;

  StudentTranslation({
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.fatherName,
    this.motherName,
    this.spouseName,
    this.address,
    this.permanentAddress,
    this.locale,
    this.localGuardianName,
  });

  StudentTranslation copyWith({
    int? id,
    int? userId,
    String? firstName,
    dynamic lastName,
    String? fatherName,
    String? motherName,
    dynamic spouseName,
    String? address,
    String? permanentAddress,
    String? locale,
    dynamic localGuardianName,
  }) =>
      StudentTranslation(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        fatherName: fatherName ?? this.fatherName,
        motherName: motherName ?? this.motherName,
        spouseName: spouseName ?? this.spouseName,
        address: address ?? this.address,
        permanentAddress: permanentAddress ?? this.permanentAddress,
        locale: locale ?? this.locale,
        localGuardianName: localGuardianName ?? this.localGuardianName,
      );

  factory StudentTranslation.fromJson(String str) =>
      StudentTranslation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StudentTranslation.fromMap(Map<String, dynamic> json) =>
      StudentTranslation(
        id: json["id"],
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        fatherName: json["father_name"],
        motherName: json["mother_name"],
        spouseName: json["spouse_name"],
        address: json["address"],
        permanentAddress: json["permanent_address"],
        locale: json["locale"],
        localGuardianName: json["local_guardian_name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "father_name": fatherName,
        "mother_name": motherName,
        "spouse_name": spouseName,
        "address": address,
        "permanent_address": permanentAddress,
        "locale": locale,
        "local_guardian_name": localGuardianName,
      };
}
