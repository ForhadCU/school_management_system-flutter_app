import 'package:get/get.dart';
import 'package:school_management_system/Api/common/common_api.dart';
import 'package:school_management_system/Config/constants/constants.dart';
import 'package:school_management_system/Model/PUBLIC/searchSchool/site_list_model.dart';
import 'package:school_management_system/Model/TEACHER/version_year_shift_model.dart';
import 'package:school_management_system/Singletones/app_data.dart';
import 'package:school_management_system/Utils/api%20structure/payloads.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../Model/PUBLIC/result/academic_class_group_res_model.dart';
import '../../Model/PUBLIC/result/academic_class_res_model.dart';
import '../../Model/PUBLIC/result/academic_group_res_model.dart';
import '../../Model/PUBLIC/result/academic_section_res_model.dart';
import '../../Model/PUBLIC/result/academic_year_res_model.dart';
import '../../Model/TEACHER/class_group_model.dart';
import '../../Model/TEACHER/dept_classlist_model.dart';
import '../../Model/TEACHER/distribution_list_model.dart';
import '../../Model/TEACHER/exam_subject_list_model.dart';
import '../../Model/TEACHER/exam_type_model.dart';
import '../../Model/TEACHER/examination_list_model.dart';
import '../../Model/TEACHER/section_session_model.dart';

class CommonController extends GetxController {
  var currentSitelistModel = SitelistModel().obs;

  static CommonController get to => Get.find();

  var academicGroupId = ''.obs;
  var token = ''.obs;
  final academic_group_id = '';
  final site_subject_group_condition_setting_id = '';
  final answer_paper_distribution_detail_id = '';
  // var academicVersionYearShiftModel = VersionYearShiftModel().obs;

  var selectedAcademicGroupList = AcademicGroupList().obs;
  var pubAcademicGroupList = <AcademicGroupList>[].obs;
  var selectedAcademicYearList = AcademicYearList().obs;
  var pubAcademicYearList = <AcademicYearList>[].obs;
  var selectedAcademicYear = AcademicYear().obs;
  var academicYearList = <AcademicYear>[].obs;
  var selectedAcademicShiftList = AcademicShiftList().obs;
  var pubAcademicShiftList = <AcademicShiftList>[].obs;
  var selectedAcademicShift = AcademicShift().obs;
  var academicShiftList = <AcademicShift>[].obs;
  var selectedAcademicVersion = AcademicVersion().obs;
  var selectedAcademicClass = AcademicClass().obs;
  var academicClassList = <AcademicClass>[].obs;
  var selectedAcademicClassList = AcademicClassList().obs;
  var pubAcademicClassList = <AcademicClassList>[].obs;
  var selectedAcademicGroup = TeachAcademicGroup().obs;
  var academicGroupList = <TeachAcademicGroup>[].obs;
  var selectedAcademicClassGroupList = AcademicClassGroupList().obs;
  var pubAcademicClassGroupList = <AcademicClassGroupList>[].obs;
  var selectedAcademicSection = AcademicSection().obs;
  var academicSectionList = <AcademicSection>[].obs;
  var selectedAcademicSectionList = AcademicSectionList().obs;
  var pubAcademicSectionList = <AcademicSectionList>[].obs;
  var selectedAcademicSession = AcademicSession().obs;
  var academicSessionList = <AcademicSession>[].obs;
  var selectedExamination = Examination().obs;
  var examinationList = <Examination>[].obs;
  var selectedResultList = ResultList().obs;
  var pubResultList = <ResultList>[].obs;
  var selectedSubjectGorupConditionSetting = SubjectGorupConditionSetting().obs;
  var subjectGorupConditionSettingList = <SubjectGorupConditionSetting>[].obs;
  var selectedEmployeePaperDistribution = EmployeePaperDistribution().obs;
  var selectedexamTypeListForAttandance = ExamTypeListForAttandance().obs;
  var examTypeListbution = EmployeePaperDistribution().obs;
  var employeePaperDistributionList = <EmployeePaperDistribution>[].obs;
  var examTypeListForAttandance = <ExamTypeListForAttandance>[].obs;

  var canContinue = true.obs;

  @override
  void onInit() {
    super.onInit();
    kLog("<<Common Ctrlr>>");
    // academicYearList = <AcademicYear>[].obs;

    ///from local

    ///from server
    // await mGetVersionYearShiftModel();
  }

  /*  @override
  void onClose() {
    kLog("Onclose Common ctrlr");

    academicYearList.close();
    // selectedAcademicYear.close();
    academicYearList = <AcademicYear>[].obs;
    academicYearList.refresh();
    // selectedAcademicYear = AcademicYear().obs;
    // kLog("Test: ${academicYearList.length}");
    // academicYearList = <AcademicYear>[].obs;
  } */
/* 
  @override
  void onReady() async {
    super.onReady();
    kLog("On ready called from Common ctrlr");
    await Future.delayed(Duration(seconds: 3));
    kLog("refresh");
    academicYearList.refresh();
  } */

  mGetAcademicGroupModel() async {
    await AppLocalDataFactory.mGetAcademicGroupModel()
        .then((value) => academicGroupId.value = value.id.toString());
    kLog(academicGroupId.value);
  }

  mGetToken() async {
    token.value = await AppLocalDataFactory.mGetToken();
  }

  mGetVersionYearShiftModel() async {
    await mGetToken();
    await mGetAcademicGroupModel();
    kLog("Goupt id from common ctrlr: ${academicGroupId.value}");
    academicYearList.clear();
    await CommonApis.mGetVersionYearShiftModel(
            PayLoads.academic_version_year_shift_list(
                api_access_key: AppData.api_access_key,
                academic_group_id: academicGroupId.value),
            token.value)
        .then((value) {
      if (value.academicYearList != null &&
          value.academicShiftList != null &&
          value.academicYearList!.isNotEmpty &&
          value.academicShiftList!.isNotEmpty) {
        academicYearList.value = value.academicYearList!;
        // academicYearList.addAll(value.academicYearList!);
        academicShiftList.value = value.academicShiftList!;
        selectedAcademicYear.value = value.academicYearList!.first;
        selectedAcademicShift.value = value.academicShiftList!.first;
        selectedAcademicVersion.value = value.academicVersionlist!.first;
      } else {
        canContinue.value = false;
      }
    });
    // return academicYearList;

    kLog("AcademicYearList: ${academicYearList.length}");
  }

  mGetDeptClasslistModel(

      /* {
    required String academic_version_id,
    required String academic_year_id,
    required String academic_shift_id,
  } */
      ) async {
    ///Reset Data
    academicClassList.value = [];
    selectedAcademicClass.value = AcademicClass();
    canContinue.value
        ? await CommonApis.mGetDeptClasslistModel(
                PayLoads.version_year_shift_based_department_class(
                    api_access_key: AppData.api_access_key,
                    academic_group_id: academicGroupId.value,
                    academic_version_id:
                        selectedAcademicVersion.value.id.toString(),
                    academic_year_id: selectedAcademicYear.value.id.toString(),
                    academic_shift_id:
                        selectedAcademicShift.value.id.toString()),
                token.value)
            .then((value) {
            value.academicClassList != null &&
                    value.academicClassList!.isNotEmpty
                ? {
                    academicClassList.value = value.academicClassList!,
                    selectedAcademicClass.value =
                        value.academicClassList!.first,
                  }
                : canContinue.value = false;
          })
        : null;
  }

  mGetClassGroupModel(
      /* {
    required String academic_version_id,
    required String academic_year_id,
    required String academic_shift_id,
    required String academic_class_id,
    required String? academic_department_id,
  } */
      ) async {
    academicGroupList.value = [];
    selectedAcademicGroup.value = TeachAcademicGroup();
    canContinue.value
        ? await CommonApis.mGetClassGroupModel(
                PayLoads
                    .version_year_shift_based_section_or_class_group_session_by_class(
                        api_access_key: AppData.api_access_key,
                        academic_group_id: academicGroupId.value,
                        academic_version_id:
                            selectedAcademicVersion.value.id.toString(),
                        academic_year_id:
                            selectedAcademicYear.value.id.toString(),
                        academic_shift_id:
                            selectedAcademicShift.value.id.toString(),
                        academic_class_id:
                            selectedAcademicClass.value.id.toString(),
                        academic_department_id: null),
                token.value)
            .then((value) {
            value.academicGroupList != null &&
                    value.academicGroupList!.isNotEmpty
                ? {
                    academicGroupList
                        .add(TeachAcademicGroup(groupName: "Select Group")),
                    academicGroupList.addAll(value.academicGroupList!),
                    selectedAcademicGroup.value = academicGroupList.first
                  }
                : canContinue.value = false;
          })
        : null;
  }

  mGetSectionSessionModel(
      /* {
    required String academic_version_id,
    required String academic_year_id,
    required String academic_shift_id,
    required String academic_class_id,
    required String? academic_department_id,
    required String academic_class_group_id,
  } */
      ) async {
    academicSectionList.value = [];
    selectedAcademicSection.value = AcademicSection();
    academicSessionList.value = [];
    selectedAcademicSession.value = AcademicSession();
    canContinue.value
        ? await CommonApis.mGetSectionSessionModel(
                PayLoads.site_class_base_section(
                  api_access_key: AppData.api_access_key,
                  academic_group_id: academicGroupId.value,
                  academic_version_id:
                      selectedAcademicVersion.value.id.toString(),
                  academic_year_id: selectedAcademicYear.value.id.toString(),
                  academic_shift_id: selectedAcademicShift.value.id.toString(),
                  academic_class_id: selectedAcademicClass.value.id.toString(),
                  academic_department_id: null,
                  academic_class_group_id:
                      selectedAcademicGroup.value.id.toString(),
                ),
                token.value)
            .then((value) {
            value.academicSectionList != null &&
                    value.academicSectionList!.isNotEmpty &&
                    value.academicSessionList != null &&
                    value.academicSessionList!.isNotEmpty
                ? {
                    ///section list
                    academicSectionList
                        .add(AcademicSection(sectionName: "Select Section")),
                    academicSectionList.addAll(value.academicSectionList!),
                    selectedAcademicSection.value = academicSectionList.first,

                    ///session list
                    academicSessionList
                        .add(AcademicSession(sessionName: "Select Session")),
                    academicSessionList.addAll(value.academicSessionList!),
                    selectedAcademicSession.value = academicSessionList.first,
                  }
                : canContinue.value = false;
          })
        : null;
  }

  mGetExaminationListModel(
      /* {
    required String academic_version_id,
    required String academic_year_id,
    required String academic_shift_id,
    required String academic_class_id,
    required String? academic_department_id,
    required String academic_class_group_id,
  } */
      ) async {
    examinationList.value = [];
    selectedExamination.value = Examination();
    canContinue.value
        ? await CommonApis.mGetExaminationListModel(
                PayLoads.exanList(
                    api_access_key: AppData.api_access_key,
                    academic_group_id: academicGroupId.value,
                    academic_version_id:
                        selectedAcademicVersion.value.id.toString(),
                    academic_year_id: selectedAcademicYear.value.id.toString(),
                    academic_shift_id:
                        selectedAcademicShift.value.id.toString(),
                    academic_class_id:
                        selectedAcademicClass.value.id.toString(),
                    // academic_department_id: null,
                    academic_department_id: "",
                    academic_class_group_id:
                        (selectedAcademicGroup.value.id ?? "").toString()),
                token.value)
            .then((value) {
            value.examinationList != null && value.examinationList!.isNotEmpty
                ? {
                    ///examination list
                    /* examinationList
                        .add(Examination(examinationName: "Select Exam")), */
                    examinationList.addAll(value.examinationList!),
                    selectedExamination.value = examinationList.first,
                  }
                : canContinue.value = false;
          })
        : null;
  }

  mGetExamSubjectListModel(
      /* {
    required String academic_version_id,
    required String academic_year_id,
    required String academic_shift_id,
    required String academic_class_id,
    required String? academic_department_id,
    required String academic_class_group_id,
    required String examination_id,
  } */
      ) async {
    subjectGorupConditionSettingList.value = [];
    selectedSubjectGorupConditionSetting.value = SubjectGorupConditionSetting();
    canContinue.value
        ? await CommonApis.mGetExamSubjectListModel(
                PayLoads.examSubjectList(
                    api_access_key: AppData.api_access_key,
                    academic_group_id: academicGroupId.value,
                    academic_version_id:
                        (selectedAcademicVersion.value.id).toString(),
                    academic_year_id: selectedAcademicYear.value.id.toString(),
                    academic_shift_id:
                        selectedAcademicShift.value.id.toString(),
                    academic_class_id:
                        selectedAcademicClass.value.id.toString(),
                    academic_department_id: "",
                    academic_class_group_id:
                        (selectedAcademicGroup.value.id ?? "").toString(),
                    examination_id: selectedExamination.value.id.toString()),
                token.value)
            .then((value) {
            value.subjectGorupConditionSettingList != null &&
                    value.subjectGorupConditionSettingList!.isNotEmpty
                ? {
                    ///Subject list
                    /* subjectGorupConditionSettingList.add(
                        SubjectGorupConditionSetting(
                            subjectName: "Select Subject")), */
                    subjectGorupConditionSettingList
                        .addAll(value.subjectGorupConditionSettingList!),
                    selectedSubjectGorupConditionSetting.value =
                        subjectGorupConditionSettingList.first,
                  }
                : canContinue.value = false;
          })
        : null;
  }

  mGetExamDistributionListModel(
      /* {
    required String academic_version_id,
    required String academic_year_id,
    required String academic_shift_id,
    required String academic_class_id,
    required String? academic_department_id,
    required String academic_class_group_id,
    required String examination_id,
    required String site_subject_group_condition_setting_id,
  } */
      ) async {
    employeePaperDistributionList.value = [];
    selectedEmployeePaperDistribution.value = EmployeePaperDistribution();
    canContinue.value
        ? await CommonApis.mGetExamDistributionListModel(
                PayLoads.examDistributionList(
                    api_access_key: AppData.api_access_key,
                    academic_group_id: academicGroupId.value,
                    academic_version_id:
                        selectedAcademicVersion.value.id.toString(),
                    academic_year_id: selectedAcademicYear.value.id.toString(),
                    academic_shift_id:
                        selectedAcademicShift.value.id.toString(),
                    academic_class_id:
                        selectedAcademicClass.value.id.toString(),
                    academic_department_id: null,
                    academic_class_group_id:
                        selectedAcademicGroup.value.id.toString(),
                    examination_id: selectedExamination.value.id.toString(),
                    site_subject_group_condition_setting_id:
                        selectedSubjectGorupConditionSetting.value.id
                            .toString()),
                token.value)
            .then((value) {
            value.employeePaperDistributionList != null &&
                    value.employeePaperDistributionList!.isNotEmpty
                ? {
                    ///Distribution list
                    /* employeePaperDistributionList.add(EmployeePaperDistribution(
                        academicExamType: DistributedAcademicExamType(
                            marksType: "Select Mark Type"))), */
                    employeePaperDistributionList
                        .addAll(value.employeePaperDistributionList!),
                    selectedEmployeePaperDistribution.value =
                        employeePaperDistributionList.first,
                  }
                : canContinue.value = false;
          })
        : null;
  }

  mGetExamTypeListModel(
      /* {
    required String academic_version_id,
    required String academic_year_id,
    required String academic_shift_id,
    required String academic_class_id,
    required String? academic_department_id,
    required String academic_class_group_id,
    required String examination_id,
    required String site_subject_group_condition_setting_id,
  } */
      ) async {
    examTypeListForAttandance.value = [];
    selectedexamTypeListForAttandance.value = ExamTypeListForAttandance();
    canContinue.value
        ? await CommonApis.mGetExamTypeListModel(
                PayLoads.examTypeList(
                    api_access_key: AppData.api_access_key,
                    academic_group_id: academicGroupId.value,
                    academic_version_id:
                        selectedAcademicVersion.value.id.toString(),
                    academic_year_id: selectedAcademicYear.value.id.toString(),
                    academic_shift_id:
                        selectedAcademicShift.value.id.toString(),
                    academic_class_id:
                        selectedAcademicClass.value.id.toString(),
                    academic_department_id: null,
                    academic_class_group_id:
                        null /* selectedAcademicGroup.value.id.toString() */,
                    examination_id: selectedExamination.value.id.toString(),
                    site_subject_group_condition_setting_id:
                        selectedSubjectGorupConditionSetting.value.id
                            .toString(),
                    academic_section_id: null,
                    academic_session_id: null),
                token.value)
            .then((value) {
            value.examTypeList != null && value.examTypeList!.isNotEmpty
                ? {
                    ///Distribution list
                    /* employeePaperDistributionList.add(EmployeePaperDistribution(
                        academicExamType: DistributedAcademicExamType(
                            marksType: "Select Mark Type"))), */
                    examTypeListForAttandance.addAll(value.examTypeList!),
                    selectedexamTypeListForAttandance.value =
                        examTypeListForAttandance.first,
                  }
                : canContinue.value = false;
          })
        : null;
  }

  ////////********After Selecting Dropdown item*****//////////////// */
  ///
  mUpdateSelectedAcademicYear(AcademicYear? selectedModel) async {
    if (selectedAcademicYear.value != selectedModel) {
      selectedAcademicYear.value = selectedModel!;
      canContinue.value = true;
      await mGetDeptClasslistModel();
      await mGetExaminationListModel();
      await mGetExamSubjectListModel();
      await mGetExamTypeListModel();
      await mGetExamDistributionListModel();
      await mGetClassGroupModel();
      await mGetSectionSessionModel();
    }
  }

  mUpdateSelectedAcademicShift(AcademicShift? selectedModel) async {
    if (selectedAcademicShift.value != selectedModel) {
      selectedAcademicShift.value = selectedModel!;
      canContinue.value = true;
      await mGetDeptClasslistModel();
      await mGetExaminationListModel();
      await mGetExamSubjectListModel();
      await mGetExamTypeListModel();
      await mGetExamDistributionListModel();
      await mGetClassGroupModel();
      await mGetSectionSessionModel();
    }
  }

  mUpdateSelectedAcademicClass(AcademicClass? selectedModel) async {
    if (selectedAcademicClass.value != selectedModel) {
      selectedAcademicClass.value = selectedModel!;
      canContinue.value = true;
      // await mGetDeptClasslistModel();
      // await mGetDeptClasslistModel();
      await mGetExaminationListModel();
      await mGetExamSubjectListModel();
      await mGetExamTypeListModel();
      await mGetExamDistributionListModel();
      await mGetClassGroupModel();
      await mGetSectionSessionModel();
    }
  }

  mUpdateSelectedAcademicGroup(TeachAcademicGroup? selectedModel) async {
    if (selectedAcademicGroup.value != selectedModel) {
      selectedAcademicGroup.value = selectedModel!;
      canContinue.value = true;
      // await mGetDeptClasslistModel();
      // await mGetDeptClasslistModel();
      // await mGetClassGroupModel();
      await mGetExaminationListModel();
      await mGetExamSubjectListModel();
      await mGetExamTypeListModel();
      await mGetExamDistributionListModel();
      await mGetExamTypeListModel();
      await mGetSectionSessionModel();
    }
  }

  mUpdateSelectedAcademicSection(AcademicSection? selectedModel) async {
    if (selectedAcademicSection.value != selectedModel) {
      selectedAcademicSection.value = selectedModel!;
      canContinue.value = true;
      // await mGetDeptClasslistModel();
      // await mGetDeptClasslistModel();
      // await mGetClassGroupModel();
      // await mGetSectionSessionModel();
      await mGetExaminationListModel();
      await mGetExamSubjectListModel();
      await mGetExamTypeListModel();
      await mGetExamDistributionListModel();
    }
  }

  mUpdateSelectedAcademicSession(AcademicSession? selectedModel) async {
    if (selectedAcademicSession.value != selectedModel) {
      selectedAcademicSession.value = selectedModel!;
      canContinue.value = true;
      // await mGetDeptClasslistModel();
      // await mGetDeptClasslistModel();
      // await mGetClassGroupModel();
      // await mGetSectionSessionModel();
      await mGetExaminationListModel();
      await mGetExamSubjectListModel();
      await mGetExamTypeListModel();
      await mGetExamDistributionListModel();
    }
  }

  mUpdateSelectedExamination(Examination? selectedModel) async {
    if (selectedExamination.value != selectedModel) {
      selectedExamination.value = selectedModel!;
      canContinue.value = true;
      // await mGetDeptClasslistModel();
      // await mGetDeptClasslistModel();
      // await mGetClassGroupModel();
      // await mGetSectionSessionModel();
      // await mGetExaminationListModel();
      await mGetExamSubjectListModel();
      await mGetExamTypeListModel();
      await mGetExamDistributionListModel();
    }
  }

  mUpdateSelectedSubjectGorupConditionSetting(
      SubjectGorupConditionSetting? selectedModel) async {
    if (selectedSubjectGorupConditionSetting.value != selectedModel) {
      selectedSubjectGorupConditionSetting.value = selectedModel!;
      canContinue.value = true;
      // await mGetDeptClasslistModel();
      // await mGetDeptClasslistModel();
      // await mGetClassGroupModel();
      // await mGetSectionSessionModel();
      // await mGetExaminationListModel();
      // await mGetExamSubjectListModel();
      await mGetExamTypeListModel();
      await mGetExamDistributionListModel();
    }
  }

  mUpdateSelectedEmployeePaperDistribution(
      EmployeePaperDistribution? selectedModel) async {
    if (selectedEmployeePaperDistribution.value != selectedModel) {
      selectedEmployeePaperDistribution.value = selectedModel!;
      // canContinue.value = true;
      // await mGetDeptClasslistModel();
      // await mGetDeptClasslistModel();
      // await mGetClassGroupModel();
      // await mGetSectionSessionModel();
      // await mGetExaminationListModel();
      // await mGetExamSubjectListModel();
      // await mGetExamDistributionListModel();
    }
  }

  mUpdateSelectedExamType(ExamTypeListForAttandance? selectedModel) async {
    if (selectedexamTypeListForAttandance.value != selectedModel) {
      selectedexamTypeListForAttandance.value = selectedModel!;
      // canContinue.value = true;
      // await mGetDeptClasslistModel();
      // await mGetDeptClasslistModel();
      // await mGetClassGroupModel();
      // await mGetSectionSessionModel();
      // await mGetExaminationListModel();
      // await mGetExamSubjectListModel();
      // await mGetExamDistributionListModel();
    }
  }
}
