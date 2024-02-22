import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Api/TEACHER/exam_attendance_api.dart';
import 'package:school_management_system/Controller/common/common_controller.dart';
import 'package:school_management_system/Singletones/app_data.dart';
import 'package:school_management_system/Utils/api%20structure/payloads.dart';

import '../../../Config/config.dart';
import '../../../Model/TEACHER/class_group_model.dart';
import '../../../Model/TEACHER/dept_classlist_model.dart';
import '../../../Model/TEACHER/distribution_list_model.dart';
import '../../../Model/TEACHER/examAttendance/exam_attendance_list_model.dart';
import '../../../Model/TEACHER/exam_subject_list_model.dart';
import '../../../Model/TEACHER/examination_list_model.dart';
import '../../../Model/TEACHER/section_session_model.dart';
import '../../../Model/TEACHER/version_year_shift_model.dart';
import '../../../Utils/utils.dart';

class ExamAttendanceController extends GetxController {
  static ExamAttendanceController get to => Get.find();
  late final CommonController commonController;
/*   var selected_site_subject_group_condition_setting_id = ''.obs;
  var selected_answer_paper_distribution_detail_id = ''.obs; */
  var examAttendanceListModel = ExamAttendanceListModel().obs;
  var academicGroupId = ''.obs;
  var academicYearList = <AcademicYear>[].obs;

  var token = ''.obs;
  // var isRowUpdate = false.obs;

  @override
  void onInit() {
    super.onInit();
    commonController = CommonController.to;
    mGetToken();
    mGetAcademicGroupModel();
    _mGetInitialDataForDropdowns();
  }

  @override
  void onClose() async {
    // examAttendanceListModel.value = ExamAttendanceListModel();
  }

  @override
  dispose() {
    super.dispose();
  }

  mGetAcademicGroupModel() async {
    await AppLocalDataFactory.mGetAcademicGroupModel()
        .then((value) => academicGroupId.value = value.id.toString());
    kLog(academicGroupId.value);
  }

  mGetToken() async {
    token.value = await AppLocalDataFactory.mGetToken();
  }

  mGetExamAttendanceListModel() async {
    examAttendanceListModel.value = ExamAttendanceListModel();
    if (commonController.selectedSubjectGorupConditionSetting.value.id !=
        null) {
      examAttendanceListModel.value =
          await ExamAttendanceApis.mGetExamAttendanceListModel(
              PayLoads.examAttendanceList(
                  api_access_key: AppData.api_access_key,
                  academic_group_id: commonController.academicGroupId.value,
                  site_subject_group_condition_setting_id: commonController
                      .selectedSubjectGorupConditionSetting.value.id
                      .toString(),
                  answer_paper_distribution_detail_id: commonController
                      .selectedEmployeePaperDistribution.value.id
                      .toString()),
              commonController.token.value);
    } else {
      kLog("Empty");
      ScaffoldMessenger.of(kGlobContext).showSnackBar(SnackBar(
        content: Text(
          "Please select exam and subject.",
          style: kBody.copyWith(color: Colors.black),
        ),
        backgroundColor: Colors.amber,
        duration: Duration(milliseconds: 1000),
      ));
    }
  }

  mSubmitExamAttendanceList() async {
    await ExamAttendanceApis.mSubmitExamAttendanceList(
      endPoint: ApiEndpoint.student_exam_attendance_submit_by_employee,
      bodyData: _mGetBody(),
      token: commonController.token.value,
      payload: PayLoads.examAttendanceList(
          api_access_key: AppData.api_access_key,
          academic_group_id: commonController.academicGroupId.value,
          site_subject_group_condition_setting_id: commonController
              .selectedSubjectGorupConditionSetting.value.id
              .toString(),
          answer_paper_distribution_detail_id: commonController
              .selectedEmployeePaperDistribution.value.id
              .toString()),
    );
  }

  _mGetBody() {
    examAttendanceListModel.value.toMap().remove("mode");
    examAttendanceListModel.value.toMap().remove("status");

    return examAttendanceListModel.value.toMap();
  }

  _mGetInitialDataForDropdowns() async {
    await commonController.mGetVersionYearShiftModel();
    await commonController.mGetDeptClasslistModel();
    await commonController.mGetClassGroupModel();
    await commonController.mGetSectionSessionModel();
    await commonController.mGetExaminationListModel();
    await commonController.mGetExamSubjectListModel();
    await commonController.mGetExamDistributionListModel();
  }

  mUpdateSelectedAcademicYear(AcademicYear? selectedModel) async {
    await commonController.mUpdateSelectedAcademicYear(selectedModel);
  }

  mUpdateSelectedAcademicShift(AcademicShift? selectedModel) async {
    await commonController.mUpdateSelectedAcademicShift(selectedModel);
  }

  mUpdateSelectedAcademicClass(AcademicClass? selectedModel) async {
    await commonController.mUpdateSelectedAcademicClass(selectedModel);
  }

  mUpdateSelectedAcademicGroup(TeachAcademicGroup? selectedModel) async {
    await commonController.mUpdateSelectedAcademicGroup(selectedModel);
  }

  mUpdateSelectedAcademicSection(AcademicSection? selectedModel) async {
    await commonController.mUpdateSelectedAcademicSection(selectedModel);
  }

  mUpdateSelectedAcademicSession(AcademicSession? selectedModel) async {
    await commonController.mUpdateSelectedAcademicSession(selectedModel);
  }

  mUpdateSelectedExamination(Examination? selectedModel) async {
    await commonController.mUpdateSelectedExamination(selectedModel);
  }

  mUpdateSelectedSubjectGorupConditionSetting(
      SubjectGorupConditionSetting? selectedModel) async {
    await commonController
        .mUpdateSelectedSubjectGorupConditionSetting(selectedModel);
  }

  mUpdateSelectedEmployeePaperDistribution(
      EmployeePaperDistribution? selectedModel) async {
    await commonController
        .mUpdateSelectedEmployeePaperDistribution(selectedModel);
  }
}
