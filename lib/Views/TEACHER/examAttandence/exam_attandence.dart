import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Model/TEACHER/exam_type_model.dart';
import 'package:school_management_system/Utils/int_extensions.dart';

import '../../../Config/config.dart';

import '../../../Controller/TEACHER/examAttandence/exam_attandence_controller.dart';
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

class ExamAttendance extends GetView<ExamAttendanceController> {
  ExamAttendance({super.key});
  final CommonController commonController = Get.find();

  @override
  Widget build(BuildContext context) {
    // final CommonController commonController = Get.find();

    return BaseWidget(
        title: "Exam Attendance",
        child: BaseWidgetChild(
          child: Column(
            children: [
              // ExamAttendanceWidgets.vTabBar(),
              // ExamAttendanceWidgets.vExamAttendanceTopbar(),
              vExamAttendanceTopbar(),
              AppSpacing.sm.height,
              vExamAttendanceTab(),

              /*  AppSpacing.md.height,
              ExamAttendanceWidgets.vUpdateButton(), */
            ],
          ),
        ));
  }

  vExamAttendanceTopbar() {
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

  _vGetResultBtn() {
    return AppButtons.vPrimaryButtonWithGradient(
      onTap: () async {
        await controller.mGetExamAttendanceListModel();
      },
      text: "Get List",
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
                visible: commonController.examTypeListForAttandance.isNotEmpty,
                child: AppSpacing.sm.height),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(() => Visibility(
                      visible:
                          commonController.examTypeListForAttandance.isNotEmpty,
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
                              () => DropdownButton<ExamTypeListForAttandance>(
                                // child: DropdownButton<String>(
                                value: commonController
                                    .selectedexamTypeListForAttandance.value,
                                hint: Text(
                                  commonController.canContinue.value
                                      ? "Select Exam Type"
                                      : "No Exam Type",
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
                                    (ExamTypeListForAttandance? selectedModel) {
                                  controller
                                      .mUpdateSelectedExamType(selectedModel);
                                },
                                /*  onChanged: (String? selectedModel) {
                                      // controller.mUpdateSelectedStuHistory(selectedModel);
                                    }, */
                                items: commonController
                                    .examTypeListForAttandance
                                    .map((ExamTypeListForAttandance value) {
                                  return DropdownMenuItem<
                                      ExamTypeListForAttandance>(
                                    value: value,
                                    child: Text(
                                      value.marksType ?? "",
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

  vExamAttendanceTab() {
    return Expanded(
        child: Column(
      children: [
        vExamAttendanceTable(),
        AppSpacing.sm.height,
        Obx(() =>
            controller.examAttendanceListModel.value.studentListForAttendance !=
                        null &&
                    controller.examAttendanceListModel.value
                        .studentListForAttendance!.isNotEmpty
                ? vUpdateButton()
                : Container()),
      ],
    ));
  }

  vUpdateButton() {
    return SizedBox(
      // width: AppScreenSize.mGetWidth(kGlobContext, 50),
      child: AppButtons.vUpdateButton(
        onTap: () async {
          await controller.mSubmitExamAttendanceList();
        },
        text: "Update",
      ),
    );
  }

  vExamAttendanceTable() {
    double cellVerMargin = 8;
    double cellHorMargin = 16;
    return Obx(() {
      return Expanded(
        child: SingleChildScrollView(
          child: controller.examAttendanceListModel.value
                          .studentListForAttendance !=
                      null &&
                  controller.examAttendanceListModel.value
                      .studentListForAttendance!.isNotEmpty
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
                                              .examAttendanceListModel
                                              .value
                                              .studentListForAttendance!
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

                            for (var item in controller.examAttendanceListModel
                                .value.studentListForAttendance!)
                              TableRow(
                                // table decoration
                                decoration: BoxDecoration(
                                    // color: AppColor.secondaryColor.withOpacity(.4),
                                    color: controller
                                                    .examAttendanceListModel
                                                    .value
                                                    .studentListForAttendance!
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
                                                    .examAttendanceListModel
                                                    .value
                                                    .studentListForAttendance!
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

                                  /// Written
                                  /* Obx(() {
                                    kLog("Row updated");
                                    return */
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            controller
                                                    .examAttendanceListModel
                                                    .value
                                                    .studentListForAttendance![
                                                        controller
                                                            .examAttendanceListModel
                                                            .value
                                                            .studentListForAttendance!
                                                            .indexOf(item)]
                                                    .siteExamDeclareStudentSubject!
                                                    .first
                                                    .examAttendanceStatus =
                                                !item
                                                    .siteExamDeclareStudentSubject!
                                                    .first
                                                    .examAttendanceStatus!;

                                            controller.examAttendanceListModel
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
                                  // }),

                                  /// Written
                                  /*   Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(12),
                              color: [
                                            "Anamika Roy",
                                            "Rafi Islam",
                                            "Ankit Tewari",
                                            "Anamika Roy",
                                            "Rafi Islam",
                                            "Ankit Tewari",
                                            "Anamika Roy",
                                          ].indexOf(item) %
                                          2 ==
                                      1
                                  ? AppColor.red
                                  : Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                        // color: Colors.green ,
                                        color: [
                                                      "Anamika Roy",
                                                      "Rafi Islam",
                                                      "Ankit Tewari",
                                                      "Anamika Roy",
                                                      "Rafi Islam",
                                                      "Ankit Tewari",
                                                      "Anamika Roy",
                                                    ].indexOf(item) %
                                                    2 ==
                                                1
                                            ? AppColor.kWhite
                                            : Colors.green,
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(1, 1),
                                            color: Colors.black12,
                                            blurRadius: 1,
                                          )
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ) /* .marginSymmetric(
                              vertical: cellVerMargin,
                              horizontal: cellHorMargin) */
                          ,
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(12),
                              color: [
                                            "Anamika Roy",
                                            "Rafi Islam",
                                            "Ankit Tewari",
                                            "Anamika Roy",
                                            "Rafi Islam",
                                            "Ankit Tewari",
                                            "Anamika Roy",
                                          ].indexOf(item) %
                                          2 ==
                                      1
                                  ? AppColor.red
                                  : Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                        // color: Colors.green ,
                                        color: [
                                                      "Anamika Roy",
                                                      "Rafi Islam",
                                                      "Ankit Tewari",
                                                      "Anamika Roy",
                                                      "Rafi Islam",
                                                      "Ankit Tewari",
                                                      "Anamika Roy",
                                                    ].indexOf(item) %
                                                    2 ==
                                                1
                                            ? AppColor.kWhite
                                            : Colors.green,
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(1, 1),
                                            color: Colors.black12,
                                            blurRadius: 1,
                                          )
                                        ]),
                                  ),
                                ],
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
                    /* AppSpacing.md.height,
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
}
