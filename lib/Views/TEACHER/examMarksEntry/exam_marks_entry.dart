import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/TEACHER/examMarksEntry/exam_marks_entry_controller.dart';
import 'package:school_management_system/Views/TEACHER/examMarksEntry/widgets.dart';

import '../../../Config/config.dart';
import '../../../Controller/common/common_controller.dart';
import '../../../Model/TEACHER/class_group_model.dart';
import '../../../Model/TEACHER/dept_classlist_model.dart';
import '../../../Model/TEACHER/distribution_list_model.dart';
import '../../../Model/TEACHER/exam_subject_list_model.dart';
import '../../../Model/TEACHER/examination_list_model.dart';
import '../../../Model/TEACHER/section_session_model.dart';
import '../../../Model/TEACHER/version_year_shift_model.dart';
import '../../../Utils/utils.dart';
import '../../Widgets/base_widget.dart';
import '../../Widgets/buttons.dart';
import '../../Widgets/custom_container.dart';

class ExamMarksEntry extends GetView<ExamMarksEntryController> {
  ExamMarksEntry({super.key});
  final CommonController commonController = Get.find();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        M m = M(constraints);
        return BaseWidget(
            title: "Exam Marks Entry",
            // endDrawer: TeachHomeWidgets.vEndDrawer(),
            child: BaseWidgetChild(
              child: Column(
                children: [
                  // ExamMarksEntryWidgets.vTabBar(),
                  vSubjectBasedMarkEntry(),
                  /*   ExamMarksEntryWidgets.vSubjectBasedMarksEntryTopbar(),
        AppSpacing.md.height,
        ExamMarksEntryWidgets.vSubjectBasedMarksEntryTable(),
        AppSpacing.sm.height,
         ExamMarksEntryWidgets.vUpdateBtn(), */
                  // ExamMarksEntryWidgets.vStudentBasedMarkEntry(),
                ],
              ),
            ));
      },
    );
  }

  vTabBar() {
    return Row(
      children: [
        Expanded(
          child: CommonContainers.vTabItemContainer(
              text: "Subject Base Marks",
              // isActive: controller.isDailyAttendaceActive.value,
              isActive: true,
              onTap: () {
                // controller.mUpdateDailyAttendanceTabItem();
              }),
        ),
        (AppSpacing.smh / 2).width,
        Expanded(
            child: CommonContainers.vTabItemContainer(
          text: "Students Base Marks",
          // isActive: controller.isPeriodicAttendaceActive.value,
          isActive: false,

          onTap: () {
            // controller.mUpdatePeriodicAttendanceTabItem();
          },
        )),
      ],
    );
  }

  vSubjectBasedMarksEntryTopbar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.sm, horizontal: AppSpacing.sm),
          decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(8),
              color: AppColor.activeTab),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _vDropdowns1(),
              Obx(() => Visibility(
                    visible: controller.isVisibleGetButton.value,
                    child: Column(
                      children: [
                        AppSpacing.md.height,
                        SizedBox(
                          width: AppScreenSize.mGetWidth(kGlobContext, 50),
                          child: _vGetResultBtn(),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ],
    );
  }

  _vDropdowns1() {
    // kLog(
    //     "Called vDropdonws1: ${commonController.academicYearList.length}  ${commonController.selectedAcademicYear.value.yearName}  ");

    return Obx(() => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.sm,
                              vertical: AppSpacing.smh),
                          color: AppColor.frenchSkyBlue100,
                          /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                          child: Obx(
                            () {
                              // kLog(
                              //     "Called Obx: ${commonController.academicYearList.length}  ${commonController.selectedAcademicYear.value.yearName}  ");
                              return DropdownButton<AcademicYear>(
                                // child: DropdownButton<String>(
                                value:
                                    commonController.selectedAcademicYear.value,
                                hint: Text(
                                  commonController.canContinue.value
                                      ? "Select Year"
                                      : "No Year",
                                  style: kBody.copyWith(color: Colors.black),
                                ),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                iconSize: 12,
                                elevation: 10,
                                // style: kBody.copyWith(fontWeight: FontWeight.w500),
                                focusColor: AppColor.white,
                                dropdownColor: AppColor.frenchSkyBlue100,
                                isDense: true,
                                isExpanded: true,
                                underline: Container(),
                                onChanged: (AcademicYear? selectedModel) {
                                  controller.mUpdateSelectedAcademicYear(
                                      selectedModel);
                                },
                                /*  onChanged: (String? selectedModel) {
                                    // controller.mUpdateSelectedStuHistory(selectedModel);
                                  }, */
                                items: commonController.academicYearList
                                    .map((AcademicYear value) {
                                  return DropdownMenuItem<AcademicYear>(
                                    value: value,
                                    child: Text(
                                      value.yearName ?? "",
                                      style: kBody.copyWith(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                            },
                          )),
                    ),
                    Visibility(
                        visible: commonController.academicShiftList.isNotEmpty,
                        child: AppSpacing.sm.width),
                    Visibility(
                      visible: commonController.academicShiftList.isNotEmpty,
                      child: Expanded(
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.sm,
                                vertical: AppSpacing.smh),
                            color: AppColor.frenchSkyBlue100,
                            /*  decoration:
                                        BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                            child: Obx(
                              () => DropdownButton<AcademicShift>(
                                // child: DropdownButton<String>(
                                value: commonController
                                    .selectedAcademicShift.value,
                                hint: Text(
                                  commonController.canContinue.value
                                      ? "Select Shift"
                                      : "No Shift",
                                  style: kBody.copyWith(color: Colors.black),
                                ),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                iconSize: 12,
                                elevation: 10,
                                // style: kBody.copyWith(fontWeight: FontWeight.w500),
                                focusColor: AppColor.white,
                                dropdownColor: AppColor.frenchSkyBlue100,
                                isDense: true,
                                isExpanded: true,
                                underline: Container(),
                                onChanged: (AcademicShift? selectedModel) {
                                  controller.mUpdateSelectedAcademicShift(
                                      selectedModel);
                                },
                                /*  onChanged: (String? selectedModel) {
                                                  // controller.mUpdateSelectedStuHistory(selectedModel);
                                                }, */
                                items: commonController.academicShiftList
                                    .map((AcademicShift value) {
                                  return DropdownMenuItem<AcademicShift>(
                                    value: value,
                                    child: Text(
                                      value.shiftName ?? "",
                                      style: kBody.copyWith(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            )),
                      ),
                    ),
                  ],
                )),
            Visibility(
                visible: commonController.academicClassList.isNotEmpty ||
                    commonController.academicGroupList.isNotEmpty,
                child: AppSpacing.sm.height),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Visibility(
                      visible: commonController.academicClassList.isNotEmpty,
                      child: Expanded(
                        flex: 1,
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.sm,
                                vertical: AppSpacing.smh),
                            color: AppColor.frenchSkyBlue100,
                            /*  decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                            child: Obx(
                              () => DropdownButton<AcademicClass>(
                                // child: DropdownButton<String>(
                                value: commonController
                                    .selectedAcademicClass.value,
                                hint: Text(
                                  commonController.canContinue.value
                                      ? "Select Class"
                                      : "No Class",
                                  style: kBody.copyWith(color: Colors.black),
                                ),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                iconSize: 12,
                                elevation: 10,
                                // style: kBody.copyWith(fontWeight: FontWeight.w500),
                                focusColor: AppColor.white,
                                dropdownColor: AppColor.frenchSkyBlue100,
                                isDense: true,
                                isExpanded: true,
                                underline: Container(),
                                onChanged: (AcademicClass? selectedModel) {
                                  controller.mUpdateSelectedAcademicClass(
                                      selectedModel);
                                },
                                /*  onChanged: (String? selectedModel) {
                                      // controller.mUpdateSelectedStuHistory(selectedModel);
                                    }, */
                                items: commonController.academicClassList
                                    .map((AcademicClass value) {
                                  return DropdownMenuItem<AcademicClass>(
                                    value: value,
                                    child: Text(
                                      value.className ?? "",
                                      style: kBody.copyWith(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            )),
                      ),
                    ),
                    Visibility(
                        visible: commonController.academicGroupList.isNotEmpty,
                        child: AppSpacing.sm.width),
                    Visibility(
                      visible: commonController.academicGroupList.isNotEmpty,
                      child: Expanded(
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.sm,
                                vertical: AppSpacing.smh),
                            color: AppColor.frenchSkyBlue100,
                            /*  decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                            child: Obx(
                              () => DropdownButton<TeachAcademicGroup>(
                                // child: DropdownButton<String>(
                                value: commonController
                                    .selectedAcademicGroup.value,
                                hint: Text(
                                  commonController.canContinue.value
                                      ? "Select Group"
                                      : "No Group",
                                  style: kBody.copyWith(color: Colors.black),
                                ),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                iconSize: 12,
                                elevation: 10,
                                // style: kBody.copyWith(fontWeight: FontWeight.w500),
                                focusColor: AppColor.white,
                                dropdownColor: AppColor.frenchSkyBlue100,
                                isDense: true,
                                isExpanded: true,
                                underline: Container(),
                                onChanged: (TeachAcademicGroup? selectedModel) {
                                  controller.mUpdateSelectedAcademicGroup(
                                      selectedModel);
                                },
                                /*  onChanged: (String? selectedModel) {
                                      // controller.mUpdateSelectedStuHistory(selectedModel);
                                    }, */
                                items: commonController.academicGroupList
                                    .map((TeachAcademicGroup value) {
                                  return DropdownMenuItem<TeachAcademicGroup>(
                                    value: value,
                                    child: Text(
                                      value.groupName ?? "",
                                      style: kBody.copyWith(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            )),
                      ),
                    ),
                  ],
                )),
            Visibility(
                visible: commonController.academicSectionList.isNotEmpty ||
                    commonController.academicSessionList.isNotEmpty,
                child: AppSpacing.sm.height),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Visibility(
                      visible: commonController.academicSectionList.isNotEmpty,
                      child: Expanded(
                        flex: 1,
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.sm,
                                vertical: AppSpacing.smh),
                            color: AppColor.frenchSkyBlue100,
                            /*  decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                            child: Obx(
                              () => DropdownButton<AcademicSection>(
                                // child: DropdownButton<String>(
                                value: commonController
                                    .selectedAcademicSection.value,
                                hint: Text(
                                  commonController.canContinue.value
                                      ? "Select Section"
                                      : "No Section",
                                  style: kBody.copyWith(color: Colors.black),
                                ),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                iconSize: 12,
                                elevation: 10,
                                // style: kBody.copyWith(fontWeight: FontWeight.w500),
                                focusColor: AppColor.white,
                                dropdownColor: AppColor.frenchSkyBlue100,
                                isDense: true,
                                isExpanded: true,
                                underline: Container(),
                                onChanged: (AcademicSection? selectedModel) {
                                  controller.mUpdateSelectedAcademicSection(
                                      selectedModel);
                                },
                                /*  onChanged: (String? selectedModel) {
                                      // controller.mUpdateSelectedStuHistory(selectedModel);
                                    }, */
                                items: commonController.academicSectionList
                                    .map((AcademicSection value) {
                                  return DropdownMenuItem<AcademicSection>(
                                    value: value,
                                    child: Text(
                                      value.sectionName ?? "",
                                      style: kBody.copyWith(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            )),
                      ),
                    ),
                    Visibility(
                        visible:
                            commonController.academicSessionList.isNotEmpty,
                        child: AppSpacing.sm.width),
                    Visibility(
                      visible: commonController.academicSessionList.isNotEmpty,
                      child: Expanded(
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.sm,
                                vertical: AppSpacing.smh),
                            color: AppColor.frenchSkyBlue100,
                            /*  decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                            child: Obx(
                              () => DropdownButton<AcademicSession>(
                                // child: DropdownButton<String>(
                                value: commonController
                                    .selectedAcademicSession.value,
                                hint: Text(
                                  commonController.canContinue.value
                                      ? "Select Session"
                                      : "No Session",
                                  style: kBody.copyWith(color: Colors.black),
                                ),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                iconSize: 12,
                                elevation: 10,
                                // style: kBody.copyWith(fontWeight: FontWeight.w500),
                                focusColor: AppColor.white,
                                dropdownColor: AppColor.frenchSkyBlue100,
                                isDense: true,
                                isExpanded: true,
                                underline: Container(),
                                onChanged: (AcademicSession? selectedModel) {
                                  controller.mUpdateSelectedAcademicSession(
                                      selectedModel);
                                },
                                /*  onChanged: (String? selectedModel) {
                                      // controller.mUpdateSelectedStuHistory(selectedModel);
                                    }, */
                                items: commonController.academicSessionList
                                    .map((AcademicSession value) {
                                  return DropdownMenuItem<AcademicSession>(
                                    value: value,
                                    child: Text(
                                      value.sessionName ?? "",
                                      style: kBody.copyWith(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            )),
                      ),
                    ),
                  ],
                )),
            Visibility(
                visible: commonController.examinationList.isNotEmpty ||
                    commonController
                        .subjectGorupConditionSettingList.isNotEmpty,
                child: AppSpacing.sm.height),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(() => Visibility(
                      visible: commonController.examinationList.isNotEmpty,
                      child: Expanded(
                        flex: 1,
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.sm,
                                vertical: AppSpacing.smh),
                            color: AppColor.frenchSkyBlue100,
                            /*  decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                            child: Obx(
                              () => DropdownButton<Examination>(
                                // child: DropdownButton<String>(
                                value:
                                    commonController.selectedExamination.value,
                                hint: Text(
                                  commonController.canContinue.value
                                      ? "Select Exam"
                                      : "No Exam",
                                  style: kBody.copyWith(color: Colors.black),
                                ),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                iconSize: 12,
                                elevation: 10,
                                // style: kBody.copyWith(fontWeight: FontWeight.w500),
                                focusColor: AppColor.white,
                                dropdownColor: AppColor.frenchSkyBlue100,
                                isDense: true,
                                isExpanded: true,
                                underline: Container(),
                                onChanged: (Examination? selectedModel) {
                                  controller.mUpdateSelectedExamination(
                                      selectedModel);
                                },
                                /*  onChanged: (String? selectedModel) {
                                      // controller.mUpdateSelectedStuHistory(selectedModel);
                                    }, */
                                items: commonController.examinationList
                                    .map((Examination value) {
                                  return DropdownMenuItem<Examination>(
                                    value: value,
                                    child: Text(
                                      value.examinationName ?? "",
                                      style: kBody.copyWith(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            )),
                      ),
                    )),
                Obx(() => Visibility(
                    visible: commonController
                        .subjectGorupConditionSettingList.isNotEmpty,
                    child: AppSpacing.sm.width)),
                Obx(() => Visibility(
                      visible: commonController
                          .subjectGorupConditionSettingList.isNotEmpty,
                      child: Expanded(
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.sm,
                                vertical: AppSpacing.smh),
                            color: AppColor.frenchSkyBlue100,
                            /*  decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                            child: Obx(
                              () =>
                                  DropdownButton<SubjectGorupConditionSetting>(
                                // child: DropdownButton<String>(
                                value: commonController
                                    .selectedSubjectGorupConditionSetting.value,
                                hint: Text(
                                  commonController.canContinue.value
                                      ? "Select Subject"
                                      : "No Subject",
                                  style: kBody.copyWith(color: Colors.black),
                                ),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                iconSize: 12,
                                elevation: 10,
                                // style: kBody.copyWith(fontWeight: FontWeight.w500),
                                focusColor: AppColor.white,
                                dropdownColor: AppColor.frenchSkyBlue100,
                                isDense: true,
                                isExpanded: true,
                                underline: Container(),
                                onChanged: (SubjectGorupConditionSetting?
                                    selectedModel) {
                                  controller
                                      .mUpdateSelectedSubjectGorupConditionSetting(
                                          selectedModel);
                                },
                                /*  onChanged: (String? selectedModel) {
                                      // controller.mUpdateSelectedStuHistory(selectedModel);
                                    }, */
                                items: commonController
                                    .subjectGorupConditionSettingList
                                    .map((SubjectGorupConditionSetting value) {
                                  return DropdownMenuItem<
                                      SubjectGorupConditionSetting>(
                                    value: value,
                                    child: Text(
                                      value.subjectName ?? "",
                                      style: kBody.copyWith(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            )),
                      ),
                    )),
              ],
            ),
            Visibility(
                visible:
                    commonController.employeePaperDistributionList.isNotEmpty,
                child: AppSpacing.sm.height),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(() => Visibility(
                      visible: commonController
                          .employeePaperDistributionList.isNotEmpty,
                      child: Expanded(
                        flex: 1,
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.sm,
                                vertical: AppSpacing.smh),
                            color: AppColor.frenchSkyBlue100,
                            /*  decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                            child: Obx(
                              () => DropdownButton<EmployeePaperDistribution>(
                                // child: DropdownButton<String>(
                                value: commonController
                                    .selectedEmployeePaperDistribution.value,
                                hint: Text(
                                  commonController.canContinue.value
                                      ? "Select Paper Distribution"
                                      : "No Paper Distribution",
                                  style: kBody.copyWith(color: Colors.black),
                                ),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                iconSize: 12,
                                elevation: 10,
                                // style: kBody.copyWith(fontWeight: FontWeight.w500),
                                focusColor: AppColor.white,
                                dropdownColor: AppColor.frenchSkyBlue100,
                                isDense: true,
                                isExpanded: true,
                                underline: Container(),
                                onChanged:
                                    (EmployeePaperDistribution? selectedModel) {
                                  controller
                                      .mUpdateSelectedEmployeePaperDistribution(
                                          selectedModel);
                                },
                                /*  onChanged: (String? selectedModel) {
                                      // controller.mUpdateSelectedStuHistory(selectedModel);
                                    }, */
                                items: commonController
                                    .employeePaperDistributionList
                                    .map((EmployeePaperDistribution value) {
                                  return DropdownMenuItem<
                                      EmployeePaperDistribution>(
                                    value: value,
                                    child: Text(
                                      value.academicExamType!.marksType ?? "",
                                      style: kBody.copyWith(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            )),
                      ),
                    )),
              ],
            ),
          ],
        ));
  }

  _vDropdowns2() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                color: AppColor.frenchSkyBlue100,
                /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                // child: DropdownButton<StuHistoryModel>(
                child: DropdownButton<String>(
                  // value: controller.selectedStudentHistory.value,
                  hint: Text(
                    "Select Year",
                    style: kBody.copyWith(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  // style: kBody.copyWith(fontWeight: FontWeight.w500),
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  // onChanged: (StuHistoryModel? selectedModel) {
                  //   controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* controller.stuHistoryList.map((StuHistoryModel value) {
                        return DropdownMenuItem<StuHistoryModel>(
                          value: value,
                          child: Text(
                            value.stClass!.className!,
                            style: kBody.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      } */
                      <String>["Option1", "Option2"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            AppSpacing.sm.width,
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                color: AppColor.frenchSkyBlue100,
                /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                // child: DropdownButton<StuHistoryModel>(
                child: DropdownButton<String>(
                  // value: controller.academicGrpDropdownValue.value,
                  // value: controller.selectedStudentHistory.value,
                  hint: Text(
                    "Select Shift",
                    style: kBody.copyWith(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  // style: kBody.copyWith(fontWeight: FontWeight.w500),
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  // onChanged: (StuHistoryModel? selectedModel) {
                  //   controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* controller.stuHistoryList.map((StuHistoryModel value) {
                        return DropdownMenuItem<StuHistoryModel>(
                          value: value,
                          child: Text(
                            value.stClass!.className!,
                            style: kBody.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      } */
                      <String>["Option1", "Option2"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        AppSpacing.sm.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                color: AppColor.frenchSkyBlue100,
                /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                // child: DropdownButton<StuHistoryModel>(
                child: DropdownButton<String>(
                  // value: controller.selectedStudentHistory.value,
                  hint: Text(
                    "Select Class",
                    style: kBody.copyWith(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  // style: kBody.copyWith(fontWeight: FontWeight.w500),
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  // onChanged: (StuHistoryModel? selectedModel) {
                  //   controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* controller.stuHistoryList.map((StuHistoryModel value) {
                        return DropdownMenuItem<StuHistoryModel>(
                          value: value,
                          child: Text(
                            value.stClass!.className!,
                            style: kBody.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      } */
                      <String>["Option1", "Option2"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            AppSpacing.sm.width,
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                color: AppColor.frenchSkyBlue100,
                /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                // child: DropdownButton<StuHistoryModel>(
                child: DropdownButton<String>(
                  // value: controller.academicGrpDropdownValue.value,
                  // value: controller.selectedStudentHistory.value,
                  hint: Text(
                    "Select Group",
                    style: kBody.copyWith(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  // style: kBody.copyWith(fontWeight: FontWeight.w500),
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  // onChanged: (StuHistoryModel? selectedModel) {
                  //   controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* controller.stuHistoryList.map((StuHistoryModel value) {
                        return DropdownMenuItem<StuHistoryModel>(
                          value: value,
                          child: Text(
                            value.stClass!.className!,
                            style: kBody.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      } */
                      <String>["Option1", "Option2"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        AppSpacing.sm.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                color: AppColor.frenchSkyBlue100,
                /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                // child: DropdownButton<StuHistoryModel>(
                child: DropdownButton<String>(
                  // value: controller.selectedStudentHistory.value,
                  hint: Text(
                    "Select Section",
                    style: kBody.copyWith(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  // style: kBody.copyWith(fontWeight: FontWeight.w500),
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  // onChanged: (StuHistoryModel? selectedModel) {
                  //   controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* controller.stuHistoryList.map((StuHistoryModel value) {
                        return DropdownMenuItem<StuHistoryModel>(
                          value: value,
                          child: Text(
                            value.stClass!.className!,
                            style: kBody.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      } */
                      <String>["Option1", "Option2"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            AppSpacing.sm.width,
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                color: AppColor.frenchSkyBlue100,
                /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                // child: DropdownButton<StuHistoryModel>(
                child: DropdownButton<String>(
                  // value: controller.academicGrpDropdownValue.value,
                  // value: controller.selectedStudentHistory.value,
                  hint: Text(
                    "Select Session",
                    style: kBody.copyWith(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  // style: kBody.copyWith(fontWeight: FontWeight.w500),
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  // onChanged: (StuHistoryModel? selectedModel) {
                  //   controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* controller.stuHistoryList.map((StuHistoryModel value) {
                        return DropdownMenuItem<StuHistoryModel>(
                          value: value,
                          child: Text(
                            value.stClass!.className!,
                            style: kBody.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      } */
                      <String>["Option1", "Option2"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        AppSpacing.sm.height,
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                color: AppColor.frenchSkyBlue100,
                /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                // child: DropdownButton<StuHistoryModel>(
                child: DropdownButton<String>(
                  // value: controller.selectedStudentHistory.value,
                  hint: Text(
                    "Select Exam",
                    style: kBody.copyWith(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  // style: kBody.copyWith(fontWeight: FontWeight.w500),
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  // onChanged: (StuHistoryModel? selectedModel) {
                  //   controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* controller.stuHistoryList.map((StuHistoryModel value) {
                        return DropdownMenuItem<StuHistoryModel>(
                          value: value,
                          child: Text(
                            value.stClass!.className!,
                            style: kBody.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      } */
                      <String>["Option1", "Option2"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _vGetResultBtn() {
    return AppButtons.vPrimaryButtonWithGradient(
      onTap: () async {
        await controller.mGetExamMarksListModel();
      },
      text: "Get List",
    );
  }

  vUpdateBtn() {
    return AppButtons.vPrimaryButtonWithGradient(
      onTap: () async {
        await controller.mSubmitExamMraksList();
      },
      text: "Update",
    );
  }

  vSubjectBasedMarksEntryTable() {
    double cellVerMargin = 8;
    double cellHorMargin = 16;
    return Obx(() {
      return Expanded(
        child: SingleChildScrollView(
          child: controller.examMarksEntryListModel.value
                          .studentListForMarksEntry !=
                      null &&
                  controller.examMarksEntryListModel.value
                      .studentListForMarksEntry!.isNotEmpty
              ? Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: AppScreenSize.mGetWidth(kGlobContext, 100),
                        child: ClipRRect(
                            // borderRadius: BorderRadius.circular(12),
                            child: Table(
                          columnWidths: const <int, TableColumnWidth>{
                            /*  0: m.sm
                                      ? const FlexColumnWidth()
                                      : const IntrinsicColumnWidth(), */
                            // 1: FlexColumnWidth(),
                            /*  1: FixedColumnWidth(AppScreenSize.mGetWidth(
                      kGlobContext, 30)), */
                            0: IntrinsicColumnWidth(),
                            1: IntrinsicColumnWidth(),
                            2: IntrinsicColumnWidth(),
                            3: IntrinsicColumnWidth(),
                            4: IntrinsicColumnWidth(),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          border: TableBorder.all(color: AppColor.white),
                          children: <TableRow>[
                            TableRow(
                              // table decoration
                              decoration: const BoxDecoration(
                                  // color: AppColor.secondaryColor),
                                  color: AppColor.inactiveTab),
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '#',
                                      style: kBody.copyWith(
                                          color: AppColor.white,
                                          fontWeight: FontWeight.w500),
                                    ).marginSymmetric(
                                        vertical: cellVerMargin,
                                        horizontal: cellHorMargin),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Student',
                                      style: kBody.copyWith(
                                          color: AppColor.white,
                                          fontWeight: FontWeight.w500),
                                    ).marginSymmetric(
                                        vertical: cellVerMargin,
                                        horizontal: cellHorMargin),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Roll',
                                      style: kBody.copyWith(
                                          color: AppColor.white,
                                          fontWeight: FontWeight.w500),
                                    ).marginSymmetric(
                                        vertical: cellVerMargin,
                                        horizontal: cellHorMargin),
                                  ],
                                ),
                                Obx(() => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller
                                              .examMarksEntryListModel
                                              .value
                                              .studentListForMarksEntry!
                                              .first
                                              .siteExamDeclareStudentSubject!
                                              .first
                                              .academicExamType!
                                              .marksType!
                                              .toString(),
                                          style: kBody.copyWith(
                                              color: AppColor.white,
                                              fontWeight: FontWeight.w500),
                                        ).marginSymmetric(
                                            vertical: cellVerMargin,
                                            horizontal: 48),
                                      ],
                                    )),
                              ],
                            ),
                            // for (var item in controller.userInfoModelList) // correct

                            for (var item in controller.examMarksEntryListModel
                                .value.studentListForMarksEntry!)
                              TableRow(
                                // table decoration
                                decoration: BoxDecoration(
                                    // color: AppColor.secondaryColor.withOpacity(.4),
                                    color: controller
                                                    .examMarksEntryListModel
                                                    .value
                                                    .studentListForMarksEntry!
                                                    .indexOf(item) %
                                                2 ==
                                            0
                                        ? AppColor.secondaryColor
                                            .withOpacity(.4)
                                        : AppColor.secondaryColor
                                            .withOpacity(.2)),
                                children: <Widget>[
                                  /// #
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        // controller.mGetFormatDate(item.date),
                                        (controller
                                                    .examMarksEntryListModel
                                                    .value
                                                    .studentListForMarksEntry!
                                                    .indexOf(item) +
                                                1)
                                            .toString(),
                                        style: kBody.copyWith(
                                            color: AppColor.kBlack,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ).marginSymmetric(
                                          vertical: cellVerMargin,
                                          horizontal: cellHorMargin),
                                    ],
                                  ),

                                  /// Name
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          item.studentHistory!.fullName!,
                                          textAlign: TextAlign.start,
                                          style: kBody.copyWith(
                                              color: AppColor.kBlack,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ).marginSymmetric(
                                            vertical: cellVerMargin,
                                            horizontal: cellHorMargin),
                                      ),
                                    ],
                                  ),

                                  /// Roll
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          item.studentHistory!.studentRollNumber
                                              .toString(),
                                          textAlign: TextAlign.start,
                                          style: kBody.copyWith(
                                              color: AppColor.kBlack,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ).marginSymmetric(
                                            vertical: cellVerMargin,
                                            horizontal: cellHorMargin),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: item
                                                .siteExamDeclareStudentSubject!
                                                .first
                                                .examAttendanceStatus!
                                            ? TextFormField(
                                                onChanged: (value) {
                                                  if (value.isNotEmpty) {
                                                    controller
                                                        .examMarksEntryListModel
                                                        .value
                                                        .studentListForMarksEntry![
                                                            controller
                                                                .examMarksEntryListModel
                                                                .value
                                                                .studentListForMarksEntry!
                                                                .indexOf(item)]
                                                        .siteExamDeclareStudentSubject!
                                                        .first
                                                        .obtaineMarks = int.parse(value);
                                                  }
                                                },
                                                controller: TextEditingController(
                                                    text: item
                                                        .siteExamDeclareStudentSubject!
                                                        .first
                                                        .obtaineMarks
                                                        .toString()),
                                                keyboardType:
                                                    TextInputType.number,
                                                style: kBody,
                                                textAlign: TextAlign.center,
                                                decoration: const InputDecoration(
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    isDense: true,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical:
                                                                AppSpacing.sm,
                                                            horizontal:
                                                                AppSpacing.sm),
                                                    border: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .black26))),
                                              ).marginSymmetric(
                                                vertical: cellVerMargin,
                                                horizontal: cellHorMargin)
                                            : Container(),
                                      ),
                                    ],
                                  ),

                                  /// Mark Entry Field
                                  /*  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            controller
                                                    .examMarksEntryListModel
                                                    .value
                                                    .studentListForMarksEntry![
                                                        controller
                                                            .examMarksEntryListModel
                                                            .value
                                                            .studentListForMarksEntry!
                                                            .indexOf(item)]
                                                    .siteExamDeclareStudentSubject!
                                                    .first
                                                    .examAttendanceStatus =
                                                !item
                                                    .siteExamDeclareStudentSubject!
                                                    .first
                                                    .examAttendanceStatus!;

                                            controller.examMarksEntryListModel
                                                .refresh();
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(12),
                                            color: !item
                                                    .siteExamDeclareStudentSubject!
                                                    .first
                                                    .examAttendanceStatus!
                                                ? AppColor.red
                                                : Colors.transparent,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 16,
                                                  height: 16,
                                                  decoration: BoxDecoration(
                                                      // color: Colors.green ,
                                                      color: !item
                                                              .siteExamDeclareStudentSubject!
                                                              .first
                                                              .examAttendanceStatus!
                                                          ? AppColor.kWhite
                                                          : Colors.green,
                                                      boxShadow: [
                                                        const BoxShadow(
                                                          offset: Offset(1, 1),
                                                          color: Colors.black12,
                                                          blurRadius: 1,
                                                        )
                                                      ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ) /* .marginSymmetric(
                                                                vertical: cellVerMargin,
                                                                horizontal: cellHorMargin) */
                                      ,
                                    ],
                                  ), */
                                ],
                              ),
                          ],
                        )),
                      ),
                    ),
                   /*  AppSpacing.md.height,
                    vUpdateButton(), */
                  ],
                )
              : Container(
                  alignment: Alignment.center,
                  /* child: Text(
                  // "No data.",
                  
                  style: kBody.copyWith(color: Colors.black26),
                ), */
                ),
        ),
      );
    });
  }

  vSubjectBasedMarkEntry(
      /*  {required ExamMarksEntryController controller,
      required CommonController commonController} */
      ) {
    return Expanded(
      child: Column(
        children: [
          vSubjectBasedMarksEntryTopbar(),
          AppSpacing.md.height,
          vSubjectBasedMarksEntryTable(),
          AppSpacing.sm.height,
          Obx(() => controller.examMarksEntryListModel.value
                          .studentListForMarksEntry !=
                      null &&
                  controller.examMarksEntryListModel.value
                      .studentListForMarksEntry!.isNotEmpty
              ? vUpdateButton()
              : Container()),
        ],
      ),
    );
  }

  vStudentBasedMarkEntry() {
    /* 
    return Column(
      children: [
        ExamMarksEntryWidgets.vStudentBasedMarksEntryTopbar(),
        AppSpacing.sm.height,
        ExamMarksEntryWidgets.vStudentList(),
        AppSpacing.sm.height,
        _vGetResultBtn(),
        AppSpacing.md.height,
        Divider(
          height: .5,
          thickness: .5,
          color: Colors.black12,
        ),
        AppSpacing.md.height,
        ExamMarksEntryWidgets.vStudentMarksEntryTable(),
        AppSpacing.sm.height,
        vUpdateBtn(),
      ],
    );
   */
  }

  vStudentMarksEntryTable() {
    double cellVerMargin = 8;
    double cellHorMargin = 16;
    return Obx(() {
      return Expanded(
        child: SingleChildScrollView(
          child: controller.examMarksEntryListModel.value
                          .studentListForMarksEntry !=
                      null &&
                  controller.examMarksEntryListModel.value
                      .studentListForMarksEntry!.isNotEmpty
              ? Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: AppScreenSize.mGetWidth(kGlobContext, 100),
                        child: ClipRRect(
                            // borderRadius: BorderRadius.circular(12),
                            child: Table(
                          columnWidths: const <int, TableColumnWidth>{
                            /*  0: m.sm
                                      ? const FlexColumnWidth()
                                      : const IntrinsicColumnWidth(), */
                            // 1: FlexColumnWidth(),
                            /*  1: FixedColumnWidth(AppScreenSize.mGetWidth(
                      kGlobContext, 30)), */
                            0: IntrinsicColumnWidth(),
                            1: IntrinsicColumnWidth(),
                            2: IntrinsicColumnWidth(),
                            3: IntrinsicColumnWidth(),
                            4: IntrinsicColumnWidth(),
                            5: IntrinsicColumnWidth(),
                            6: IntrinsicColumnWidth(),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          border: TableBorder.all(color: AppColor.white),
                          children: <TableRow>[
                            TableRow(
                              // table decoration
                              decoration: const BoxDecoration(
                                  // color: AppColor.secondaryColor),
                                  color: AppColor.inactiveTab),
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '#',
                                      style: kBody.copyWith(
                                          color: AppColor.white,
                                          fontWeight: FontWeight.w500),
                                    ).marginSymmetric(
                                        vertical: cellVerMargin,
                                        horizontal: cellHorMargin),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Student',
                                      style: kBody.copyWith(
                                          color: AppColor.white,
                                          fontWeight: FontWeight.w500),
                                    ).marginSymmetric(
                                        vertical: cellVerMargin,
                                        horizontal: cellHorMargin),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Roll',
                                      style: kBody.copyWith(
                                          color: AppColor.white,
                                          fontWeight: FontWeight.w500),
                                    ).marginSymmetric(
                                        vertical: cellVerMargin,
                                        horizontal: cellHorMargin),
                                  ],
                                ),
                                Obx(() => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller
                                              .examMarksEntryListModel
                                              .value
                                              .studentListForMarksEntry!
                                              .first
                                              .siteExamDeclareStudentSubject!
                                              .first
                                              .academicExamType!
                                              .marksType!
                                              .toString(),
                                          style: kBody.copyWith(
                                              color: AppColor.white,
                                              fontWeight: FontWeight.w500),
                                        ).marginSymmetric(
                                            vertical: cellVerMargin,
                                            horizontal: 48),
                                      ],
                                    )),
                                /*  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'MCQ',
                          style: kBody.copyWith(
                              color: AppColor.white,
                              fontWeight: FontWeight.w500),
                        ).marginSymmetric(
                            vertical: cellVerMargin, horizontal: cellHorMargin),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Practical',
                          style: kBody.copyWith(
                              color: AppColor.white,
                              fontWeight: FontWeight.w500),
                        ).marginSymmetric(
                            vertical: cellVerMargin, horizontal: cellHorMargin),
                      ],
                    ), */
                              ],
                            ),
                            // for (var item in controller.userInfoModelList) // correct

                            for (var item in controller.examMarksEntryListModel
                                .value.studentListForMarksEntry!)
                              TableRow(
                                // table decoration
                                decoration: BoxDecoration(
                                    // color: AppColor.secondaryColor.withOpacity(.4),
                                    color: controller
                                                    .examMarksEntryListModel
                                                    .value
                                                    .studentListForMarksEntry!
                                                    .indexOf(item) %
                                                2 ==
                                            0
                                        ? AppColor.secondaryColor
                                            .withOpacity(.4)
                                        : AppColor.secondaryColor
                                            .withOpacity(.2)),
                                children: <Widget>[
                                  /// #
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        // controller.mGetFormatDate(item.date),
                                        (controller
                                                    .examMarksEntryListModel
                                                    .value
                                                    .studentListForMarksEntry!
                                                    .indexOf(item) +
                                                1)
                                            .toString(),
                                        style: kBody.copyWith(
                                            color: AppColor.kBlack,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ).marginSymmetric(
                                          vertical: cellVerMargin,
                                          horizontal: cellHorMargin),
                                    ],
                                  ),

                                  /// Name
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          item.studentHistory!.fullName!,
                                          textAlign: TextAlign.start,
                                          style: kBody.copyWith(
                                              color: AppColor.kBlack,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ).marginSymmetric(
                                            vertical: cellVerMargin,
                                            horizontal: cellHorMargin),
                                      ),
                                    ],
                                  ),

                                  /// Roll
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          item.studentHistory!.studentRollNumber
                                              .toString(),
                                          textAlign: TextAlign.start,
                                          style: kBody.copyWith(
                                              color: AppColor.kBlack,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ).marginSymmetric(
                                            vertical: cellVerMargin,
                                            horizontal: cellHorMargin),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: TextFormField(
                                          style: kBody,
                                          decoration: const InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              isDense: true,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: AppSpacing.sm,
                                                      horizontal:
                                                          AppSpacing.sm),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black26))),
                                        ).marginSymmetric(
                                            vertical: cellVerMargin,
                                            horizontal: cellHorMargin),
                                      ),
                                    ],
                                  ),

                                  /// Mark Entry Field
                                  /*   Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            controller
                                                    .examMarksEntryListModel
                                                    .value
                                                    .studentListForMarksEntry![
                                                        controller
                                                            .examMarksEntryListModel
                                                            .value
                                                            .studentListForMarksEntry!
                                                            .indexOf(item)]
                                                    .siteExamDeclareStudentSubject!
                                                    .first
                                                    .examAttendanceStatus =
                                                !item
                                                    .siteExamDeclareStudentSubject!
                                                    .first
                                                    .examAttendanceStatus!;

                                            controller.examMarksEntryListModel
                                                .refresh();
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(12),
                                            color: !item
                                                    .siteExamDeclareStudentSubject!
                                                    .first
                                                    .examAttendanceStatus!
                                                ? AppColor.red
                                                : Colors.transparent,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 16,
                                                  height: 16,
                                                  decoration: BoxDecoration(
                                                      // color: Colors.green ,
                                                      color: !item
                                                              .siteExamDeclareStudentSubject!
                                                              .first
                                                              .examAttendanceStatus!
                                                          ? AppColor.kWhite
                                                          : Colors.green,
                                                      boxShadow: [
                                                        const BoxShadow(
                                                          offset: Offset(1, 1),
                                                          color: Colors.black12,
                                                          blurRadius: 1,
                                                        )
                                                      ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ) /* .marginSymmetric(
                                                                vertical: cellVerMargin,
                                                                horizontal: cellHorMargin) */
                                      ,
                                    ],
                                  ),
                                 */
                                ],
                              ),
                          ],
                        )),
                      ),
                    ),
                    AppSpacing.md.height,
                    vUpdateButton(),
                  ],
                )
              : Container(
                  alignment: Alignment.center,
                  /* child: Text(
                  // "No data.",
                  
                  style: kBody.copyWith(color: Colors.black26),
                ), */
                ),
        ),
      );
    });
  }

  vUpdateButton() {
    return SizedBox(
      // width: AppScreenSize.mGetWidth(kGlobContext, 50),
      child: AppButtons.vUpdateButton(
        onTap: () async {
          await controller.mSubmitExamMraksList();
        },
        text: "Update",
      ),
    );
  }

  vStudentList() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Heading
        Container(
          color: AppColor.inactiveTab,
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Student Name",
                style: kBody.copyWith(color: Colors.white),
              ),
              Row(
                children: [
                  Text(
                    "Sellect All",
                    style: kBody.copyWith(color: Colors.white),
                  ),
                  Checkbox(
                    // value: controller.answerIdList[index]["selected"]
                    value: false,

                    onChanged: (value) {},
                    activeColor: AppColor.activeTab,
                    fillColor: MaterialStatePropertyAll(Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          color: AppColor.secondaryColor.withOpacity(.4),
          padding:
              EdgeInsets.symmetric(horizontal: 0, vertical: AppSpacing.smh),
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Checkbox(
                      // value: controller.answerIdList[index]["selected"]
                      value: false,

                      onChanged: (value) {},
                      activeColor: AppColor.activeTab,
                      fillColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    Text(
                      "Ankit Tewari",
                      style: kBody.copyWith(color: Colors.black87),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: .5,
                  color: Colors.white,
                  thickness: .5,
                );
              },
              itemCount: 5),
        ),
      ],
    );
  }

  vStudentBasedMarksEntryTopbar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.md, horizontal: AppSpacing.sm),
          decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(8),
              color: AppColor.activeTab),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _vDropdowns2(),
            ],
          ),
        ),
      ],
    );
  }
}
