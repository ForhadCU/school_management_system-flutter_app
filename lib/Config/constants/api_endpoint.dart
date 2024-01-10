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
static const String stuExamSubjectRoutineList = "/api/student/get-exam-subject-routine-list";
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
       static const String stuDemandSlip =
      "/api/student/get-student-demand-slip";

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
  
  static const String stuQuizAnswerEndSave = "/api/student/quiz-answer-end-save-for-student";

  static const String stuPreviewsQuizReportList = "/api/student/get-previews-quiz-report-list";

  static const String stuActiveQuizRoutineList = "/api/student/get-active-quiz-routine-list";


  
}
