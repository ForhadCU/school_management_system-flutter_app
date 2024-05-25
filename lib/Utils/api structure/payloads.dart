// ignore_for_file: non_constant_identifier_names

class PayLoads {
  // make this class singleton
  PayLoads._internal();
  static final PayLoads _singleton = PayLoads._internal();
  factory PayLoads() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maStringain singleton instances
  static Map<String, dynamic> allNotice({
    required String api_access_key,
    required String page,
    required String site_id,
    required String paginate,
    // String? research_txt,
    required String date_range,
    required String status,
    /*  required String api_access_key,
    required String site_id,
    required String paginate,
    // String? research_txt,
    required Map<String, dynamic> date_range,
    required String status, */
  }) {
    return {
      "api_access_key": api_access_key,
      "page": page,
      "site_id": site_id,
      "paginate": paginate,
      // "research_txt": research_txt,
      "date_range": date_range,
      "status": status,
    };
  }

  static Map<String, dynamic> dateRange({
    required String start,
    required String end,
  }) {
    return {
      "start": start,
      "end": end,
    };
  }

  static Map<String, dynamic> aboutUs({
    required String site_id,
    required String api_access_key,
  }) {
    return {
      "site_id": site_id,
      "api_access_key": api_access_key,
    };
  }

  static Map<String, dynamic> imageGallery({
    required String api_access_key,
    required String site_id,
    required String paginate,
  }) {
    return {
      "api_access_key": api_access_key,
      "site_id": site_id,
      "paginate": paginate,
    };
  }

  static Map<String, dynamic> academicGroupList({
    required String api_access_key,
    required String site_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "site_id": site_id,
    };
  }

  static Map<String, dynamic> monthWiseCalendarList({
    required String api_access_key,
    required String site_id,
    required String academic_group_id,
    required String monthIncrement,
  }) {
    return {
      "api_access_key": api_access_key,
      "site_id": site_id,
      "academic_group_id": academic_group_id,
      "monthIncrement": monthIncrement,
    };
  }

  static Map<String, dynamic> mUserLogin({
    required String api_access_key,
    required String username,
    required String password,
  }) {
    return {
      "username": username,
      "password": password,
      "api_access_key": api_access_key,
    };
  }

  static Map<String, dynamic> mStuProfileInfo({
    required String token,
    required String api_access_key,
  }) {
    return {
      "token": token,
      "api_access_key": api_access_key,
    };
  }

  static Map<String, dynamic> mStuSubjectList({
    required String api_access_key,
  }) {
    return {
      "api_access_key": api_access_key,
    };
  }

  static Map<String, dynamic> stuAcademicGroupList({
    required String api_access_key,
    required String site_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "site_id": site_id,
    };
  }

  static Map<String, dynamic> stuCalendarList({
    required String api_access_key,
    required String monthIncrement,
  }) {
    return {
      "api_access_key": api_access_key,
      "monthIncrement": monthIncrement,
    };
  }

  static Map<String, dynamic> stuDateWiseAttendanceList({
    required String date_range,
    required String api_access_key,
    required String page,
  }) {
    return {
      "date_range": date_range,
      "api_access_key": api_access_key,
      "page": page,
    };
  }

  static Map<String, dynamic> stuPeriodType({
    required String api_access_key,
  }) {
    return {
      "api_access_key": api_access_key,
    };
  }

  static Map<String, dynamic> teachPeriodType({
    required String api_access_key,
    required String academic_group_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "academic_group_id": academic_group_id,
    };
  }

  static Map<String, dynamic> stuRoutinePdf({
    required String api_access_key,
    required String academic_period_type_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "academic_period_type_id": academic_period_type_id,
    };
  }

  static Map<String, dynamic> teachRoutinePdf({
    required String api_access_key,
    required String academic_group_id,
    required String academic_year_id,
    required String academic_period_type_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "academic_group_id": academic_group_id,
      "academic_year_id": academic_year_id,
      "academic_period_type_id": academic_period_type_id,
    };
  }

  static Map<String, dynamic> stuHistoryList({
    required String api_access_key,
  }) {
    return {
      "api_access_key": api_access_key,
    };
  }

  static Map<String, dynamic> stuExamTypeList({
    required String api_access_key,
    required String student_history_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "student_history_id": student_history_id,
    };
  }

  static Map<String, dynamic> stuExamAdmitCard({
    required String api_access_key,
    required String student_history_id,
    required String examination_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "student_history_id": student_history_id,
      "examination_id": examination_id,
    };
  }

  static Map<String, dynamic> stuExamSubjectRoutineList({
    required String api_access_key,
    required String student_history_id,
    required String examination_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "examination_id": examination_id,
      "student_history_id": student_history_id,
    };
  }

  static Map<String, dynamic> stuPrimaryResultList({
    required String api_access_key,
    required String student_history_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "student_history_id": student_history_id,
    };
  }

  static Map<String, dynamic> stuPrimaryResultDetails({
    required String api_access_key,
    required String student_history_id,
    required String academic_result_primary_type_id,
    required String page_orientaion,
  }) {
    return {
      "api_access_key": api_access_key,
      "student_history_id": student_history_id,
      "academic_result_primary_type_id": academic_result_primary_type_id,
      "page_orientaion": page_orientaion,
    };
  }

  static Map<String, dynamic> stuPrimaryResultDetailsPdf({
    required String api_access_key,
    required String student_history_id,
    required String academic_result_primary_type_id,
    required String page_orientaion,
  }) {
    return {
      "api_access_key": api_access_key,
      "student_history_id": student_history_id,
      "academic_result_primary_type_id": academic_result_primary_type_id,
      "page_orientaion": page_orientaion,
    };
  }

  static Map<String, dynamic> stuBankSlipPdf({
    required String api_access_key,
  }) {
    return {
      "api_access_key": api_access_key,
    };
  }

  static Map<String, dynamic> stuDemandSlipPdf({
    required String api_access_key,
  }) {
    return {
      "api_access_key": api_access_key,
    };
  }

  static Map<String, dynamic> stuPaymentMethodList({
    required String api_access_key,
  }) {
    return {
      "api_access_key": api_access_key,
    };
  }

  static Map<String, dynamic> stuPaymentTransactionByTransactionId({
    required String api_access_key,
    required String name_key,
  }) {
    return {
      "api_access_key": api_access_key,
      "name_key": name_key,
    };
  }

  static Map<String, dynamic> stuActiveQuizList({
    required String api_access_key,
  }) {
    return {
      "api_access_key": api_access_key,
    };
  }

  static Map<String, dynamic> stuQuizStart({
    required String api_access_key,
    required String quiz_declare_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "quiz_declare_id": quiz_declare_id,
    };
  }

  static Map<String, dynamic> stuQuizQuestionList({
    required String api_access_key,
    required String quiz_declare_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "quiz_declare_id": quiz_declare_id,
    };
  }

  static Map<String, dynamic> stuQuizAnswerSilentSave({
    required String api_access_key,
  }) {
    return {
      "api_access_key": api_access_key,
    };
  }

  static Map<String, dynamic> stuPeriodicType({
    required String api_access_key,
  }) {
    return {
      "api_access_key": api_access_key,
    };
  }

  static Map<String, dynamic> stuRoutine({
    required String api_access_key,
    required String academic_period_type_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "academic_period_type_id": academic_period_type_id,
    };
  }

  static Map<String, dynamic> stuQuizAnswerEndSave({
    required String api_access_key,
  }) {
    return {
      "api_access_key": api_access_key,
    };
  }

  static Map<String, dynamic> stuPreviewsQuizReportList({
    required String api_access_key,
    required String paginate,
    required String page,
  }) {
    return {
      "api_access_key": api_access_key,
      "paginate": paginate,
      "page": page,
    };
  }

  static Map<String, dynamic> stuActiveQuizRoutineList({
    required String api_access_key,
    required String paginate,
    required String page,
  }) {
    return {
      "api_access_key": api_access_key,
      "paginate": paginate,
      "page": page,
    };
  }

  static Map<String, dynamic> stuPaymentDemandSlip({
    required String api_access_key,
  }) {
    return {
      "api_access_key": api_access_key,
    };
  }

  static Map<String, dynamic> stuMessage(
      {required String api_access_key,
      required String paginate,
      required String page}) {
    return {
      "api_access_key": api_access_key,
      "paginate": paginate,
      "page": page,
    };
  }

  static Map<String, dynamic> teachMessage(
      {required String api_access_key,
      required String paginate,
      required String academic_group_id,
      required String page}) {
    return {
      "api_access_key": api_access_key,
      "paginate": paginate,
      "page": page,
      "academic_group_id": academic_group_id,
    };
  }

  static Map<String, dynamic> employAcademicGroupList({
    required String api_access_key,
  }) {
    return {
      "api_access_key": api_access_key,
    };
  }

  static Map<String, dynamic> site_class_base_section({
    required String api_access_key,
    required String academic_group_id,
    required String academic_version_id,
    required String academic_year_id,
    required String academic_shift_id,
    required String academic_class_id,
    required String? academic_department_id,
    required String academic_class_group_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "academic_group_id": academic_group_id,
      "academic_version_id": academic_version_id,
      "academic_year_id": academic_year_id,
      "academic_shift_id": academic_shift_id,
      "academic_class_id": academic_class_id,
      "academic_department_id": academic_department_id,
      "academic_class_group_id": academic_class_group_id,
    };
  }

  static Map<String, dynamic> exanList({
    required String api_access_key,
    required String academic_group_id,
    required String academic_version_id,
    required String academic_year_id,
    required String academic_shift_id,
    required String academic_class_id,
    required String? academic_department_id,
    required String academic_class_group_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "academic_group_id": academic_group_id,
      "academic_version_id": academic_version_id,
      "academic_year_id": academic_year_id,
      "academic_shift_id": academic_shift_id,
      "academic_class_id": academic_class_id,
      "academic_department_id": academic_department_id,
      "academic_class_group_id": academic_class_group_id,
    };
  }

  static Map<String, dynamic> examSubjectList({
    required String api_access_key,
    required String academic_group_id,
    required String academic_version_id,
    required String academic_year_id,
    required String academic_shift_id,
    required String academic_class_id,
    required String? academic_department_id,
    required String academic_class_group_id,
    required String examination_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "academic_group_id": academic_group_id,
      "academic_version_id": academic_version_id,
      "academic_year_id": academic_year_id,
      "academic_shift_id": academic_shift_id,
      "academic_class_id": academic_class_id,
      "academic_department_id": academic_department_id,
      "academic_class_group_id": academic_class_group_id,
      "examination_id": examination_id,
    };
  }

  static Map<String, dynamic> examDistributionList({
    required String api_access_key,
    required String academic_group_id,
    required String academic_version_id,
    required String academic_year_id,
    required String academic_shift_id,
    required String academic_class_id,
    required String? academic_department_id,
    required String academic_class_group_id,
    required String examination_id,
    required String site_subject_group_condition_setting_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "academic_group_id": academic_group_id,
      "academic_version_id": academic_version_id,
      "academic_year_id": academic_year_id,
      "academic_shift_id": academic_shift_id,
      "academic_class_id": academic_class_id,
      "academic_department_id": academic_department_id,
      "academic_class_group_id": academic_class_group_id,
      "examination_id": examination_id,
      "site_subject_group_condition_setting_id":
          site_subject_group_condition_setting_id,
    };
  }

  static Map<String, dynamic> examTypeList({
    required String api_access_key,
    required String academic_group_id,
    required String academic_version_id,
    required String academic_year_id,
    required String academic_shift_id,
    required String academic_class_id,
    required String? academic_department_id,
    required String academic_class_group_id,
    required String examination_id,
    required String site_subject_group_condition_setting_id,
    required String? academic_section_id,
    required String? academic_session_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "academic_group_id": academic_group_id,
      "academic_version_id": academic_version_id,
      "academic_year_id": academic_year_id,
      "academic_shift_id": academic_shift_id,
      "academic_class_id": academic_class_id,
      "academic_department_id": academic_department_id,
      "academic_class_group_id": academic_class_group_id,
      "examination_id": examination_id,
      "site_subject_group_condition_setting_id":
          site_subject_group_condition_setting_id,
      "academic_section_id": academic_section_id,
      "academic_session_id": academic_session_id,
    };
  }

  static Map<String, dynamic> site_class_base_group({
    required String api_access_key,
    required String academic_group_id,
    required String academic_version_id,
    required String academic_year_id,
    required String academic_shift_id,
    required String academic_class_id,
    required String? academic_department_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "academic_group_id": academic_group_id,
      "academic_version_id": academic_version_id,
      "academic_year_id": academic_year_id,
      "academic_shift_id": academic_shift_id,
      "academic_class_id": academic_class_id,
      "academic_department_id": academic_department_id,
    };
  }

  static Map<String, dynamic>
      version_year_shift_based_section_or_class_group_session_by_class({
    required String api_access_key,
    required String academic_group_id,
    required String academic_version_id,
    required String academic_year_id,
    required String academic_shift_id,
    required String academic_class_id,
    required String? academic_department_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "academic_group_id": academic_group_id,
      "academic_version_id": academic_version_id,
      "academic_year_id": academic_year_id,
      "academic_shift_id": academic_shift_id,
      "academic_class_id": academic_class_id,
      "academic_department_id": academic_department_id,
    };
  }

  static Map<String, dynamic> version_year_shift_based_department_class({
    required String api_access_key,
    required String academic_group_id,
    required String academic_version_id,
    required String academic_year_id,
    required String academic_shift_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "academic_group_id": academic_group_id,
      "academic_version_id": academic_version_id,
      "academic_year_id": academic_year_id,
      "academic_shift_id": academic_shift_id,
    };
  }

  static Map<String, dynamic> academic_version_year_shift_list({
    required String api_access_key,
    required String academic_group_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "academic_group_id": academic_group_id,
    };
  }

  static Map<String, dynamic> examAttendanceList({
    required String api_access_key,
    required String academic_group_id,
    required String site_subject_group_condition_setting_id,
    required String answer_paper_distribution_detail_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "academic_group_id": academic_group_id,
      "site_subject_group_condition_setting_id":
          site_subject_group_condition_setting_id,
      "answer_paper_distribution_detail_id":
          answer_paper_distribution_detail_id,
    };
  }

  static Map<String, dynamic> examAttendanceListSubmit({
    required String api_access_key,
    required String academic_group_id,
    required String site_subject_group_condition_setting_id,
    required String answer_paper_distribution_detail_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "academic_group_id": academic_group_id,
      "site_subject_group_condition_setting_id":
          site_subject_group_condition_setting_id,
      "answer_paper_distribution_detail_id":
          answer_paper_distribution_detail_id,
    };
  }

  static Map<String, dynamic> examMarkEntry({
    required String api_access_key,
    required String academic_group_id,
    required String site_subject_group_condition_setting_id,
    required String answer_paper_distribution_detail_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "academic_group_id": academic_group_id,
      "site_subject_group_condition_setting_id":
          site_subject_group_condition_setting_id,
      "answer_paper_distribution_detail_id":
          answer_paper_distribution_detail_id,
    };
  }

  static Map<String, dynamic> examMarkEntrySubmit({
    required String api_access_key,
    required String academic_group_id,
    required String site_subject_group_condition_setting_id,
    required String answer_paper_distribution_detail_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "academic_group_id": academic_group_id,
      "site_subject_group_condition_setting_id":
          site_subject_group_condition_setting_id,
      "answer_paper_distribution_detail_id":
          answer_paper_distribution_detail_id,
    };
  }

  static Map<String, dynamic> teachProfileInfo({
    required String api_access_key,
    required String academic_group_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "academic_group_id": academic_group_id,
    };
  }

  static Map<String, dynamic> teachHelpDesk({
    required String api_access_key,
    required String academic_group_id,
  }) {
    return {
      "api_access_key": api_access_key,
      "academic_group_id": academic_group_id,
    };
  }

  static Map<String, dynamic> teachPeriodList({
    required String api_access_key,
    required String academic_group_id,
    required String att_date,
  }) {
    return {
      "api_access_key": api_access_key,
      "academic_group_id": academic_group_id,
      "att_date": att_date,
    };
  }

  static Map<String, dynamic> teachPeriodicAttend({
    required String api_access_key,
    required String academic_group_id,
    required String routine_allocation_id,
    required String att_date,
    required String present,
    required String leave,
    required String absent,
    required String paginate,
    required String page,
  }) {
    return {
      "api_access_key": api_access_key,
      "academic_group_id": academic_group_id,
      "routine_allocation_id": routine_allocation_id,
      "att_date": att_date,
      "present": present,
      "leave": leave,
      "absent": absent,
      "paginate": paginate,
      "page": page,
    };
  }

  static Map<String, dynamic> teachSavePeriodicAttend({
    required String api_access_key,
    required String academic_group_id,
    required String routine_allocation_id,
    required String att_date,
  }) {
    return {
      "api_access_key": api_access_key,
      "academic_group_id": academic_group_id,
      "routine_allocation_id": routine_allocation_id,
      "att_date": att_date,
    };
  }

  static Map<String, dynamic> teachAttendance({
    required String api_access_key,
    required String academic_group_id,
    required String date_range,
    required String page,
  }) {
    return {
      "api_access_key": api_access_key,
      "academic_group_id": academic_group_id,
      "date_range": date_range,
      "page": page,
    };
  }
}
