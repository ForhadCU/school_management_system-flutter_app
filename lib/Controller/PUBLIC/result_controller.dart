import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:school_management_system/Api/PUBLIC/result_api.dart';
import 'package:school_management_system/Model/PUBLIC/result/academic_class_group_res_model.dart';
import 'package:school_management_system/Model/PUBLIC/result/academic_class_res_model.dart';
import 'package:school_management_system/Model/PUBLIC/result/academic_group_res_model.dart';
import 'package:school_management_system/Model/PUBLIC/result/academic_section_res_model.dart';
import 'package:school_management_system/Model/PUBLIC/result/academic_year_res_model.dart';
import 'package:school_management_system/Model/TEACHER/version_year_shift_model.dart';

import '../../Api/TEACHER/exam_attendance_api.dart';
import '../../Api/common/common_api.dart';
import '../../Config/config.dart';
import '../../Model/PUBLIC/searchSchool/site_list_model.dart';
/* import '../../Model/TEACHER/class_group_model.dart';
import '../../Model/TEACHER/dept_classlist_model.dart';
import '../../Model/TEACHER/distribution_list_model.dart';
import '../../Model/TEACHER/examAttendance/exam_attendance_list_model.dart';
import '../../Model/TEACHER/exam_subject_list_model.dart';
import '../../Model/TEACHER/exam_type_model.dart';
import '../../Model/TEACHER/examination_list_model.dart';
import '../../Model/TEACHER/section_session_model.dart';
import '../../Model/TEACHER/version_year_shift_model.dart'; */
import '../../Singletones/app_data.dart';
import '../../Utils/api structure/payloads.dart';
import '../../Utils/utils.dart';
import '../common/common_controller.dart';
import '../../Model/PUBLIC/result/academic_class_group_res_model.dart';
import '../../Model/PUBLIC/result/academic_class_res_model.dart';
import '../../Model/PUBLIC/result/academic_group_res_model.dart';
import '../../Model/PUBLIC/result/academic_section_res_model.dart';
import '../../Model/PUBLIC/result/academic_year_res_model.dart';

class PublicResultController extends GetxController {
  static PublicResultController get to => Get.find();
  late final CommonController _commonController;
/*   var selected_site_subject_group_condition_setting_id = ''.obs;
  var selected_answer_paper_distribution_detail_id = ''.obs; */
  // var examAttendanceListModel = ExamAttendanceListModel().obs;
  var academicGroupId = ''.obs;
  var token = ''.obs;
  var siteId = 0.obs;
  var isVisibleGetButton = false.obs;
  // var isRowUpdate = false.obs;

  final academic_group_id = '';
  final site_subject_group_condition_setting_id = '';
  final answer_paper_distribution_detail_id = '';
  // var academicVersionYearShiftModel = VersionYearShiftModel().obs;

  var selectedAcademicGroupList = AcademicGroupList().obs;
  var pubAcademicGroupList = <AcademicGroupList>[].obs;
  var selectedAcademicYearList = AcademicYearList().obs;
  var pubAcademicYearList = <AcademicYearList>[].obs;

  var selectedAcademicShiftList = AcademicShiftList().obs;
  var pubAcademicShiftList = <AcademicShiftList>[].obs;

  var selectedAcademicClassList = AcademicClassList().obs;
  var pubAcademicClassList = <AcademicClassList>[].obs;

  var selectedAcademicClassGroupList = AcademicClassGroupList().obs;
  var pubAcademicClassGroupList = <AcademicClassGroupList>[].obs;

  var selectedAcademicSectionList = AcademicSectionList().obs;
  var pubAcademicSectionList = <AcademicSectionList>[].obs;

  var selectedAcademicVersionList = AcademicList().obs;

  var selectedResultList = ResultList().obs;
  var pubResultList = <ResultList>[].obs;

  var siteListModel = SitelistModel().obs;

  var canContinue = true.obs;

  @override
  void onInit() async {
    super.onInit();
    _commonController = CommonController.to;
    // mGetToken();
    // mGetAcademicGroupModel();
    await mGetSiteData();
    await _mGetInitialDataForDropdowns();
  }

  @override
  void onClose() async {
    // examAttendanceListModel.value = ExamAttendanceListModel();
  }

  @override
  dispose() {
    super.dispose();
  }

/*   mGetAcademicGroupModel() async {
    await AppLocalDataFactory.mGetAcademicGroupModel()
        .then((value) => academicGroupId.value = value.id.toString());

    kLog(academicGroupId.value);
  } */

  mGetToken() async {
    token.value = await AppLocalDataFactory.mGetToken();
    kLog("Token: ${token.value}");
  }

  //******* Get Result ***********//
  mGetResult() async {
    /////////Continue....
  }

  /* mGetExamAttendanceListModel() async {
    examAttendanceListModel.value = ExamAttendanceListModel();
    if (_commonController.selectedSubjectGorupConditionSetting.value.id !=
            null ||
        _commonController.selectedEmployeePaperDistribution.value.id != null) {
      examAttendanceListModel.value =
          await ExamAttendanceApis.mGetExamAttendanceListModel(
              PayLoads.examAttendanceList(
                api_access_key: AppData.api_access_key,
                academic_group_id: academicGroupId.value,
                academic_version_id: _commonController
                    .selectedAcademicVersion.value.id
                    .toString(),
                academic_year_id:
                    _commonController.selectedAcademicYear.value.id.toString(),
                academic_shift_id:
                    _commonController.selectedAcademicShift.value.id.toString(),
                academic_class_id:
                    _commonController.selectedAcademicClass.value.id.toString(),
                academic_department_id: null,
                academic_class_group_id:
                    _commonController.selectedAcademicGroup.value.id.toString(),
                examination_id:
                    _commonController.selectedExamination.value.id.toString(),
                site_subject_group_condition_setting_id: _commonController
                    .selectedSubjectGorupConditionSetting.value.id
                    .toString(),
                academic_section_id: null,
                academic_session_id: null,
                academic_exam_type_id: _commonController
                    .selectedexamTypeListForAttandance.value.id
                    .toString(),
              ),
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
  } */

  _mGetInitialDataForDropdowns() async {
    await mGetAcademicGroupList();
    await mGetVersionYearShiftModel();
    await mGetDeptClasslistModel();
    await mGetClassGroupResModel();
    await mGetSectionResModel();

    // await _commonController.mGetExaminationListModel();
    // await _commonController.mGetExamSubjectListModel();
    // await _commonController.mGetExamTypeListModel();
    // await _commonController.mGetClassGroupModel();
    // await _commonController.mGetSectionSessionModel();
    isVisibleGetButton.value = true;
  }

  mGetClassGroupResModel() async {
    pubAcademicClassGroupList.clear();
    selectedAcademicClassGroupList.value = AcademicClassGroupList();
    canContinue.value
        ? await PublicResultApis.mGetClassGroupResModel(
            PayLoads.academicClassGroup(
            api_access_key: AppData.api_access_key,
            academic_group_id: selectedAcademicGroupList.value.id.toString(),
            site_id: siteId.value.toString(),
            academic_version_id:
                selectedAcademicVersionList.value.id.toString(),
            academic_year_id: selectedAcademicYearList.value.id.toString(),
            academic_shift_id: selectedAcademicShiftList.value.id.toString(),
            academic_class_id: selectedAcademicClassList.value.id.toString(),
          )).then((PubAcademicClassGroupResModel value) {
            if (value.academicClassGroupList == null &&
                value.resultList == null &&
                value.academicClassGroupList!.isEmpty &&
                value.resultList!.isEmpty) {
              Logger().d("True");
              canContinue.value = false;
            } else {
              Logger().d("False");
              kLog("Result List length " + value.resultList!.length.toString());

              if (value.academicClassGroupList != null &&
                  value.academicClassGroupList!.isNotEmpty) {
                pubAcademicClassGroupList.value = value.academicClassGroupList!;

                selectedAcademicClassGroupList.value =
                    value.academicClassGroupList!.first;
              }
              if (value.resultList != null && value.resultList!.isNotEmpty) {
                // academicYearList.addAll(value.academicYearList!);
                pubResultList.value = value.resultList!;

                selectedResultList.value = value.resultList!.first;
              }
            }
          })
        : null;
  }

  mGetSectionResModel() async {
    pubAcademicSectionList.clear();
    selectedAcademicSectionList.value = AcademicSectionList();
    canContinue.value
        ? await PublicResultApis.mGetSectionResModel(PayLoads.academicSection(
            api_access_key: AppData.api_access_key,
            academic_group_id: selectedAcademicGroupList.value.id.toString(),
            site_id: siteId.value.toString(),
            academic_version_id:
                selectedAcademicVersionList.value.id.toString(),
            academic_year_id: selectedAcademicYearList.value.id.toString(),
            academic_shift_id: selectedAcademicShiftList.value.id.toString(),
            academic_class_id: selectedAcademicClassList.value.id.toString(),
            academic_class_group_id:
                selectedAcademicClassGroupList.value.id.toString(),
          )).then((value) {
            if (value.academicSectionList != null &&
                value.academicSectionList!.isNotEmpty) {
              pubAcademicSectionList.value = value.academicSectionList!;
              selectedAcademicSectionList.value =
                  value.academicSectionList!.first;
            } else {
              canContinue.value = false;
            }
          })
        : null;
  }

  mGetDeptClasslistModel() async {
    pubAcademicClassList.clear();
    canContinue.value
        ? await PublicResultApis.mGetDeptClasslistModel(PayLoads.academicClass(
                api_access_key: AppData.api_access_key,
                academic_group_id:
                    selectedAcademicGroupList.value.id.toString(),
                site_id: siteId.value.toString(),
                academic_version_id:
                    selectedAcademicVersionList.value.id.toString(),
                academic_year_id: selectedAcademicYearList.value.id.toString(),
                academic_shift_id:
                    selectedAcademicShiftList.value.id.toString()))
            .then((PubAcademicClassResponseModel value) {
            value.academicClassList != null &&
                    value.academicClassList!.isNotEmpty
                ? {
                    pubAcademicClassList.value = value.academicClassList!,
                    selectedAcademicClassList.value =
                        value.academicClassList!.first,
                  }
                : canContinue.value = false;
          })
        : null;
  }

  mGetVersionYearShiftModel() async {
    pubAcademicYearList.clear();
    await PublicResultApis.mGetVersionYearShiftModel(
            PayLoads.academicVersionYear(
                api_access_key: AppData.api_access_key,
                academic_group_id:
                    selectedAcademicGroupList.value.id.toString(),
                site_id: siteId.value.toString()))
        .then((value) {
      if (value.academicYearList != null &&
          value.academicShiftList != null &&
          value.academicYearList!.isNotEmpty &&
          value.academicShiftList!.isNotEmpty) {
        pubAcademicYearList.value = value.academicYearList!;
        // academicYearList.addAll(value.academicYearList!);
        pubAcademicShiftList.value = value.academicShiftList!;
        selectedAcademicYearList.value = value.academicYearList!.first;
        selectedAcademicShiftList.value = value.academicShiftList!.first;
        selectedAcademicVersionList.value = value.academicVersionList!.first;
      } else {
        canContinue.value = false;
      }
    });
    // return academicYearList;

    kLog("AcademicYearList: ${pubAcademicYearList.length}");
  }

  mGetAcademicGroupList() async {
    // await mGetToken();
    // await mGetAcademicGroupModel();
    // kLog("Goupt id from common ctrlr: ${academicGroupId.value}");
    pubAcademicGroupList.clear();
    await PublicResultApis.mGetPubAcademicGroupResponseModel(
            PayLoads.academicGroupList(
                api_access_key: AppData.api_access_key,
                site_id: siteId.value.toString()))
        .then((value) {
      if (value.academicGroupList != null &&
          value.academicGroupList!.isNotEmpty) {
        pubAcademicGroupList.value = value.academicGroupList!;
        selectedAcademicGroupList.value = value.academicGroupList!.first;
      } else {
        canContinue.value = false;
      }
    });
    // return academicYearList;

    kLog("pubAcademicGroupList: ${pubAcademicGroupList.length}");
  }

  /*  mUpdateSelectedAcademicYear(AcademicYear? selectedModel) async {
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

  mUpdateSelectedExamType(ExamTypeListForAttandance? selectedModel) async {
    await _commonController.mUpdateSelectedExamType(selectedModel);
  } */

  void mUpdateAcademicGroupList(AcademicGroupList? selectedModel) async {
    if (selectedAcademicGroupList.value != selectedModel) {
      selectedAcademicGroupList.value = selectedModel!;
      canContinue.value = true;
      await mGetVersionYearShiftModel();
      await mGetDeptClasslistModel();
      await mGetClassGroupResModel();
      await mGetSectionResModel();
    }
  }

  void mUpdateSelectedAcademicShiftList(
      AcademicShiftList? selectedModel) async {
    if (selectedAcademicShiftList.value != selectedModel) {
      selectedAcademicShiftList.value = selectedModel!;
      canContinue.value = true;
      await mGetDeptClasslistModel();
      await mGetClassGroupResModel();
      await mGetSectionResModel();
    }
  }

  void mUpdateSelectedAcademicYearList(AcademicYearList? selectedModel) async {
    if (selectedAcademicYearList.value != selectedModel) {
      selectedAcademicYearList.value = selectedModel!;
      canContinue.value = true;
      await mGetDeptClasslistModel();
      await mGetClassGroupResModel();
      await mGetSectionResModel();
    }
  }

  void mUpdateSelectedAcademicClassList(
      AcademicClassList? selectedModel) async {
    if (selectedAcademicClassList.value != selectedModel) {
      selectedAcademicClassList.value = selectedModel!;
      canContinue.value = true;
      await mGetClassGroupResModel();
      await mGetSectionResModel();
    }
  }

  void mUpdateSelectedAcademicClassGroupList(
      AcademicClassGroupList? selectedModel) async {
    if (selectedAcademicClassGroupList.value != selectedModel) {
      selectedAcademicClassGroupList.value = selectedModel!;
      canContinue.value = true;
      await mGetSectionResModel();
    }
  }

  void mUpdateSelectedAcademicSectionList(AcademicSectionList? selectedModel) {
    if (selectedAcademicSectionList.value != selectedModel) {
      selectedAcademicSectionList.value = selectedModel!;
      canContinue.value = true;
    }
  }

  void mUpdateSelectedResultList(ResultList? selectedModel) async {
    if (selectedResultList.value != selectedModel) {
      selectedResultList.value = selectedModel!;
      canContinue.value = true;
      await mGetSectionResModel();
    }
  }

  mGetSiteData() async {
    siteListModel.value = await AppLocalDataFactory.mGetSiteListModel();
    siteId.value = siteListModel.value.id ?? 0;
    kLog("Site id: ${siteId.value}");
  }
}
