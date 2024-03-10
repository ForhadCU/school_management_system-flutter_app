import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Api/TEACHER/exam_marks_entry_api.dart';
import 'package:school_management_system/Views/TEACHER/examMarksEntry/exam_marks_entry.dart';

import '../../../Config/config.dart';
import '../../../Model/TEACHER/class_group_model.dart';
import '../../../Model/TEACHER/dept_classlist_model.dart';
import '../../../Model/TEACHER/distribution_list_model.dart';
import '../../../Model/TEACHER/examMarksEntry/exam_marks_entry_model.dart';
import '../../../Model/TEACHER/exam_subject_list_model.dart';
import '../../../Model/TEACHER/examination_list_model.dart';
import '../../../Model/TEACHER/section_session_model.dart';
import '../../../Model/TEACHER/version_year_shift_model.dart';
import '../../../Singletones/app_data.dart';
import '../../../Utils/api structure/payloads.dart';
import '../../../Utils/utils.dart';
import '../../common/common_controller.dart';

class ExamMarksEntryController extends GetxController {
  static ExamMarksEntryController get to => Get.find();
  late final CommonController _commonController = CommonController.to;

  var academicGroupId = ''.obs;
  var token = ''.obs;
  var examMarksEntryListModel = ExamMarksEntryListModel().obs;
  var isVisibleGetButton = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await mGetToken();
    await mGetAcademicGroupModel();
    await _mGetInitialDataForDropdowns();
  }

  @override
  void onClose() async {
    // await Get.delete<ExamMarksEntryController>();
  }

  mGetExamMarksListModel() async {
    examMarksEntryListModel.value = ExamMarksEntryListModel();
    if (_commonController.selectedSubjectGorupConditionSetting.value.id !=
            null ||
        _commonController.selectedEmployeePaperDistribution.value.id != null) {
      examMarksEntryListModel.value =
          await ExamMarksEntryApis.mGetExamMarksEntryModel(
              PayLoads.examMarkEntry(
                  api_access_key: AppData.api_access_key,
                  academic_group_id: _commonController.academicGroupId.value,
                  site_subject_group_condition_setting_id: _commonController
                      .selectedSubjectGorupConditionSetting.value.id
                      .toString(),
                  answer_paper_distribution_detail_id: _commonController
                      .selectedEmployeePaperDistribution.value.id
                      .toString()),
              _commonController.token.value);
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

  mSubmitExamMraksList() async {
    await ExamMarksEntryApis.mSubmitExamMarks(
      endPoint: ApiEndpoint.student_marks_entry_submit_by_employee,
      bodyData: _mGetBody(),
      token: _commonController.token.value,
      payload: PayLoads.examMarkEntrySubmit(
          api_access_key: AppData.api_access_key,
          academic_group_id: _commonController.academicGroupId.value,
          site_subject_group_condition_setting_id: _commonController
              .selectedSubjectGorupConditionSetting.value.id
              .toString(),
          answer_paper_distribution_detail_id: _commonController
              .selectedEmployeePaperDistribution.value.id
              .toString()),
    );
  }

  _mGetBody() {
    examMarksEntryListModel.value.toMap().remove("mode");
    examMarksEntryListModel.value.toMap().remove("status");

    return examMarksEntryListModel.value.toMap();
  }

  mGetAcademicGroupModel() async {
    await AppLocalDataFactory.mGetAcademicGroupModel()
        .then((value) => academicGroupId.value = value.id.toString());
    kLog(academicGroupId.value);
  }

  mGetToken() async {
    token.value = await AppLocalDataFactory.mGetToken();
  }

  _mGetInitialDataForDropdowns() async {
    await _commonController.mGetVersionYearShiftModel();
    await _commonController.mGetDeptClasslistModel();
    await _commonController.mGetExaminationListModel();
    await _commonController.mGetExamSubjectListModel();
    await _commonController.mGetExamDistributionListModel();
    await _commonController.mGetClassGroupModel();
    await _commonController.mGetSectionSessionModel();
    isVisibleGetButton.value = true;
  }

  mUpdateSelectedAcademicYear(AcademicYear? selectedModel) async {
    await _commonController.mUpdateSelectedAcademicYear(selectedModel);
  }

  mUpdateSelectedAcademicShift(AcademicShift? selectedModel) async {
    await _commonController.mUpdateSelectedAcademicShift(selectedModel);
  }

  mUpdateSelectedAcademicClass(AcademicClass? selectedModel) async {
    await _commonController.mUpdateSelectedAcademicClass(selectedModel);
  }

  mUpdateSelectedAcademicGroup(TeachAcademicGroup? selectedModel) async {
    await _commonController.mUpdateSelectedAcademicGroup(selectedModel);
  }

  mUpdateSelectedAcademicSection(AcademicSection? selectedModel) async {
    await _commonController.mUpdateSelectedAcademicSection(selectedModel);
  }

  mUpdateSelectedAcademicSession(AcademicSession? selectedModel) async {
    await _commonController.mUpdateSelectedAcademicSession(selectedModel);
  }

  mUpdateSelectedExamination(Examination? selectedModel) async {
    await _commonController.mUpdateSelectedExamination(selectedModel);
  }

  mUpdateSelectedSubjectGorupConditionSetting(
      SubjectGorupConditionSetting? selectedModel) async {
    await _commonController
        .mUpdateSelectedSubjectGorupConditionSetting(selectedModel);
  }

  mUpdateSelectedEmployeePaperDistribution(
      EmployeePaperDistribution? selectedModel) async {
    await _commonController
        .mUpdateSelectedEmployeePaperDistribution(selectedModel);
  }
}
