import 'package:get/get.dart';
import 'package:school_management_system/Api/common/common_api.dart';
import 'package:school_management_system/Config/constants/constants.dart';
import 'package:school_management_system/Model/PUBLIC/searchSchool/site_list_model.dart';
import 'package:school_management_system/Model/TEACHER/version_year_shift_model.dart';
import 'package:school_management_system/Singletones/app_data.dart';
import 'package:school_management_system/Utils/api%20structure/payloads.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../Model/TEACHER/class_group_model.dart';
import '../../Model/TEACHER/dept_classlist_model.dart';
import '../../Model/TEACHER/distribution_list_model.dart';
import '../../Model/TEACHER/examAttendance/exam_attendance_list_model.dart';
import '../../Model/TEACHER/exam_subject_list_model.dart';
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

  var selectedAcademicYear = AcademicYear().obs;
  var academicYearList = <AcademicYear>[].obs;
  var selectedAcademicShift = AcademicShift().obs;
  var academicShiftList = <AcademicShift>[].obs;
  var selectedAcademicVersion = AcademicVersion().obs;
  var selectedAcademicClass = AcademicClass().obs;
  var academicClassList = <AcademicClass>[].obs;
  var selectedAcademicGroup = TeachAcademicGroup().obs;
  var academicGroupList = <TeachAcademicGroup>[].obs;
  var selectedAcademicSection = AcademicSection().obs;
  var academicSectionList = <AcademicSection>[].obs;
  var selectedAcademicSession = AcademicSession().obs;
  var academicSessionList = <AcademicSession>[].obs;
  var selectedExamination = Examination().obs;
  var examinationList = <Examination>[].obs;
  var selectedSubjectGorupConditionSetting = SubjectGorupConditionSetting().obs;
  var subjectGorupConditionSettingList = <SubjectGorupConditionSetting>[].obs;
  var selectedEmployeePaperDistribution = EmployeePaperDistribution().obs;
  var employeePaperDistributionList = <EmployeePaperDistribution>[].obs;

  var canContinue = true.obs;

  @override
  void onInit() async {
    super.onInit();
    kLog("<<Common Ctrlr>>");

    ///from local

    ///from server
    // await mGetVersionYearShiftModel();
  }

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
    await CommonApis.mGetVersionYearShiftModel(
            PayLoads.academic_version_year_shift_list(
                api_access_key: AppData.api_access_key,
                academic_group_id: academicGroupId.value),
            token.value)
        .then((value) {
      value.academicYearList != null &&
              value.academicShiftList != null &&
              value.academicYearList!.isNotEmpty &&
              value.academicShiftList!.isNotEmpty
          ? {
              academicYearList.value = value.academicYearList!,
              academicShiftList.value = value.academicShiftList!,
              selectedAcademicYear.value = value.academicYearList!.first,
              selectedAcademicShift.value = value.academicShiftList!.first,
              selectedAcademicVersion.value = value.academicVersionlist!.first,
            }
          : canContinue.value = false;
    });
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
                    academicGroupList.value = value.academicGroupList!,
                    selectedAcademicGroup.value = value.academicGroupList!.first
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
                    academicSectionList.value = value.academicSectionList!,
                    academicSessionList.value = value.academicSessionList!,
                    selectedAcademicSection.value =
                        value.academicSectionList!.first,
                    selectedAcademicSession.value =
                        value.academicSessionList!.first
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
                        selectedAcademicGroup.value.id.toString()),
                token.value)
            .then((value) {
            value.examinationList != null && value.examinationList!.isNotEmpty
                ? {
                    examinationList.value = value.examinationList!,
                    selectedExamination.value = value.examinationList!.first
                  }
                : canContinue.value = false;
          })
        : null;

    kLog("Exm fn: ${canContinue.value}");
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
                        selectedAcademicVersion.value.id.toString(),
                    academic_year_id: selectedAcademicYear.value.id.toString(),
                    academic_shift_id:
                        selectedAcademicShift.value.id.toString(),
                    academic_class_id:
                        selectedAcademicClass.value.id.toString(),
                    academic_department_id: null,
                    academic_class_group_id:
                        selectedAcademicGroup.value.id.toString(),
                    examination_id: selectedExamination.value.id.toString()),
                token.value)
            .then((value) {
            value.subjectGorupConditionSettingList != null &&
                    value.subjectGorupConditionSettingList!.isNotEmpty
                ? {
                    subjectGorupConditionSettingList.value =
                        value.subjectGorupConditionSettingList!,
                    selectedSubjectGorupConditionSetting.value =
                        value.subjectGorupConditionSettingList!.first,
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
                    employeePaperDistributionList.value =
                        value.employeePaperDistributionList!,
                    selectedEmployeePaperDistribution.value =
                        value.employeePaperDistributionList!.first,
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
      await mGetClassGroupModel();
      await mGetSectionSessionModel();
      await mGetExaminationListModel();
      await mGetExamSubjectListModel();
      await mGetExamDistributionListModel();
    }
  }

  mUpdateSelectedAcademicShift(AcademicShift? selectedModel) async {
    if (selectedAcademicShift.value != selectedModel) {
      selectedAcademicShift.value = selectedModel!;
      canContinue.value = true;
      await mGetDeptClasslistModel();
      await mGetClassGroupModel();
      await mGetSectionSessionModel();
      await mGetExaminationListModel();
      await mGetExamSubjectListModel();
      await mGetExamDistributionListModel();
    }
  }

  mUpdateSelectedAcademicClass(AcademicClass? selectedModel) async {
    if (selectedAcademicClass.value != selectedModel) {
      selectedAcademicClass.value = selectedModel!;
      canContinue.value = true;
      // await mGetDeptClasslistModel();
      // await mGetDeptClasslistModel();
      await mGetClassGroupModel();
      await mGetSectionSessionModel();
      await mGetExaminationListModel();
      await mGetExamSubjectListModel();
      await mGetExamDistributionListModel();
    }
  }

  mUpdateSelectedAcademicGroup(TeachAcademicGroup? selectedModel) async {
    if (selectedAcademicGroup.value != selectedModel) {
      selectedAcademicGroup.value = selectedModel!;
      canContinue.value = true;
      // await mGetDeptClasslistModel();
      // await mGetDeptClasslistModel();
      // await mGetClassGroupModel();
      await mGetSectionSessionModel();
      await mGetExaminationListModel();
      await mGetExamSubjectListModel();
      await mGetExamDistributionListModel();
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
}
