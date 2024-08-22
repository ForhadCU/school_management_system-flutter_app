class ApiEndpoint {
  ApiEndpoint._internal();
  static final ApiEndpoint _singletone = ApiEndpoint._internal();
  factory ApiEndpoint() {
    return _singletone;
  }

  /// base url
  static String baseUrl = 'https://';

  static const String allNotice = "/api/web-app/get-all-notice";
  static const String aboutUs = "/api/web-app/get-about-us";
  static const String imageGallery = "/api/web-app/event-list-with-pagination";
  static const String academic_group_list = "/api/web-app/academic-group-list";
  static const String monthwise_calendar_list =
      "/api/web-app/monthwise-calendar-list";
  static const String userLogin = "/api/api-login";
  static const String userLogout = "/api/api-logout";

  static const String stuSubjectList = "/api/student/get-student-subject-list";
  static const String stuProfileInfo = "/api/student/get-student-profile";
  static const String stuHelpDesk = "/api/student/get-student-helpdesk-list";
  static const String stuAcademicCalendar = "/api/student/get-student-calendar";

  static const String stuDateWiseAttendanceList =
      "/api/student/get-student-date-wise-attendance-list";

  static const String stuPeriodType = "/api/student/get-period-type-for-api";

  static const String stuRoutinePdf = "/api/student/get-student-routine-pdf";

  static const String stuHistoryList = "/api/student/get-student-history-list";

  static const String stuExamTypeList = "/api/student/get-exam-type-list";
  static const String stuExamSubjectRoutineList =
      "/api/student/get-exam-subject-routine-list";
  static const String stuExamAdmitCard = "/api/student/get-exam-admit-card";

  static const String stuPrimaryResultList =
      "/api/student/get-student-api-primary-result-list";
  static const String stuPrimaryResultDetails =
      "/api/student/get-student-api-primary-result-details";

  static const String stuPrimaryResultDetailsPdf =
      "/api/student/get-student-api-primary-result-details-pdf";

  static const String stuBankSlipPdf =
      "/api/student/get-student-demand-slip-pdf";

  static const String stuDemandSlipPdf =
      "/api/student/get-student-demand-slip-pdf";
  static const String stuBackSlipPdf = "/api/student/get-student-bank-slip-pdf";
  static const String stuDemandSlip = "/api/student/get-student-demand-slip";

  static const String stuPaymentMethodList =
      "/api/student/get-payment-method-list";

  static const String stuPaymentTransactionByTransactionId =
      "/api/student/payment-transaction-by-transaction-id";
  static const String stuActiveQuizInfo =
      "/api/student/get-active-quiz-list-for-student";

  static const String stuQuizStart = "/api/student/student-quiz-start";

  static const String stuQuizQuestionList =
      "/api/student/get-quiz-question-list-for-student";

  static const String stuQuizAnswerSilentSave =
      "/api/student/quiz-answer-silent-save-for-student";

  static const String stuQuizAnswerEndSave =
      "/api/student/quiz-answer-end-save-for-student";

  static const String stuPreviewsQuizReportList =
      "/api/student/get-previews-quiz-report-list";

  static const String stuActiveQuizRoutineList =
      "/api/student/get-active-quiz-routine-list";

  static const String stuMessage = "/api/student/get-student-message-list";

  static const String academic_group_list_employee =
      "/api/employee/get-academic-group-list";
  static const String academic_version_year_shift_list =
      "/api/employee/get-academic-version-year-shift-list";
  static const String version_year_shift_based_department_class =
      "/api/employee/get-version-year-shift-based-department-class";
  static const String
      version_year_shift_based_section_or_class_group_session_by_class =
      "/api/employee/get-version-year-shift-based-section-or-class-group-session-by-class";
  static const String site_class_base_section =
      "/api/employee/get-site-class-base-section";
  static const String site_class_base_group =
      "/api/employee/get-site-class-base-section";

  static const String department_class_base_examination_list_by_employee =
      "/api/employee/get-site-department-class-base-examination-list-by-employee";
  static const String examination_base_subject_list_by_employee =
      "/api/employee/get-site-examination-base-subject-list-by-employee";
  static const String attendance_paper_list_by_employee =
      "/api/employee/get-site-base-attendance-paper-list-by-employee";
  static const String exam_type_for_attendance =
      "/api/employee/get-site-exam-type-list";
  static const String student_list_for_attendance_by_employ =
      "/api/employee/get-site-student-list-for-attendance-by-employee";
  static const String student_exam_attendance_submit_by_employee =
      "/api/employee/site-student-exam-attendance-submit-by-employee";
  static const String employee_base_student_marks_entry_list =
      "/api/employee/get-site-employee-base-student-marks-entry-list";
  static const String student_marks_entry_submit_by_employee =
      "/api/employee/site-student-marks-entry-submit-by-employee";
  static const String teach_period_type_list =
      "/api/employee/get-period-type-list";
  static const String employee_routine_report_pdf =
      "/api/employee/get-employee-routine-report-pdf";
  static const String employee_profile = "/api/employee/get-employee-profile";
  static const String employee_helpdesk_list =
      "/api/employee/get-employee-helpdesk-list";
  static const String teachMessage = "/api/employee/get-employee-message-list";

  static const String teachPeriodList = "/api/employee/get-site-periodic-list";
  static const String teachPeriodicAttend =
      "/api/employee/get-student-list-by-periodic-allocation";
  static const String teachSavePeriodicAttend =
      "/api/employee/save-student-periodic-attendance";
  static const String teachAttendance =
      "/api/employee/get-my-attendance-list-for-employee";

  // Academic Result
  static const String academicGroupList = "/api/web-app/academic-group-list";
  static const String academicgroupWiseVersionYearShift =
      "/api/web-app/get-academic-group-wise-version-year-shift";

  static const String academic_year_version_shift_based_department_class =
      "/api/web-app/get-site-year-version-shift-based-department-class";
  static const String
      academic_year_shift_class_based_class_groups_and_exam_list =
      "/api/web-app/get-version-year-shift-class-based-class-groups-and-exam-list";
  static const String academic_year_shift_class_or_class_group_based_section =
      "/api/web-app/get-version-year-shift-class-or-class-group-based-section";
  static const String academic_exam_result =
      "/api/web-app/get-student-exam-result";
  static const String academic_exam_result_pdf =
      "/api/web-app/get-student-exam-result-pdf";
  static const String leave_type_and_category_list = "/api/employee/get-leave-type-and-leave-category-list";
  static const String leave_aplication_submit = "/api/employee/create-employee-leave-aplication";
  static const String leave_history_list = "/api/employee/employee-leave-history-list";
  static const String leave_balance_list = "/api/employee/employee-leave-balance-list";
}
