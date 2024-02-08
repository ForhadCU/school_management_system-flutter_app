import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/TEACHER/examAttandence/exam_attandence_controller.dart';
import 'package:school_management_system/Controller/common/common_controller.dart';
import 'package:school_management_system/Model/TEACHER/class_group_model.dart';
import 'package:school_management_system/Model/TEACHER/dept_classlist_model.dart';
import 'package:school_management_system/Model/TEACHER/examAttendance/exam_attendance_list_model.dart';
import 'package:school_management_system/Model/TEACHER/section_session_model.dart';
import 'package:school_management_system/Model/TEACHER/version_year_shift_model.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../../Config/config.dart';
import '../../../Model/TEACHER/distribution_list_model.dart';
import '../../../Model/TEACHER/exam_subject_list_model.dart';
import '../../../Model/TEACHER/examination_list_model.dart';
import '../../Widgets/buttons.dart';
import '../../Widgets/custom_container.dart';

class ExamAttendanceWidgets {
  // make this class singleton
  ExamAttendanceWidgets._internal();
  static final ExamAttendanceWidgets _singleton =
      ExamAttendanceWidgets._internal();
  factory ExamAttendanceWidgets() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static final _commonController = CommonController.to;
  static final _controller = ExamAttendanceController.to;

  static vTabBar() {
    return Row(
      children: [
        Expanded(
          child: CommonContainers.vTabItemContainer(
              text: "Exam Attendance",
              // isActive: _controller.isDailyAttendaceActive.value,
              isActive: true,
              onTap: () {
                // _controller.mUpdateDailyAttendanceTabItem();
              }),
        ),
        (AppSpacing.smh / 2).width,
        Expanded(
            child: CommonContainers.vTabItemContainer(
          text: "Online Exam Attendance",
          // isActive: _controller.isPeriodicAttendaceActive.value,
          isActive: false,

          onTap: () {
            // _controller.mUpdatePeriodicAttendanceTabItem();
          },
        )),
      ],
    );
  }

  static vExamAttendanceTopbar() {
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
              _vDropdowns1(),
              AppSpacing.xl.height,
              SizedBox(
                width: AppScreenSize.mGetWidth(kGlobContext, 50),
                child: _vGetResultBtn(),
              )
            ],
          ),
        ),
      ],
    );
  }

  static _vGetResultBtn() {
    return AppButtons.vPrimaryButtonWithGradient(
      onTap: () async {
        await _controller.mGetExamAttendanceListModel();
      },
      text: "Get",
    );
  }

  static _vDropdowns1() {
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
                  child: Obx(
                    () => DropdownButton<AcademicYear>(
                      // child: DropdownButton<String>(
                      value: _commonController.selectedAcademicYear.value,
                      hint: Text(
                        _commonController.canContinue.value
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
                        _controller.mUpdateSelectedAcademicYear(selectedModel);
                      },
                      /*  onChanged: (String? selectedModel) {
                                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                                  }, */
                      items: _commonController.academicYearList
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
                    ),
                  )),
            ),
            AppSpacing.sm.width,
            Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                  color: AppColor.frenchSkyBlue100,
                  /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                  child: Obx(
                    () => DropdownButton<AcademicShift>(
                      // child: DropdownButton<String>(
                      value: _commonController.selectedAcademicShift.value,
                      hint: Text(
                        _commonController.canContinue.value
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
                        _controller.mUpdateSelectedAcademicShift(selectedModel);
                      },
                      /*  onChanged: (String? selectedModel) {
                                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                                  }, */
                      items: _commonController.academicShiftList
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
                  child: Obx(
                    () => DropdownButton<AcademicClass>(
                      // child: DropdownButton<String>(
                      value: _commonController.selectedAcademicClass.value,
                      hint: Text(
                        _commonController.canContinue.value
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
                        _controller.mUpdateSelectedAcademicClass(selectedModel);
                      },
                      /*  onChanged: (String? selectedModel) {
                                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                                  }, */
                      items: _commonController.academicClassList
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
            AppSpacing.sm.width,
            Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                  color: AppColor.frenchSkyBlue100,
                  /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                  child: Obx(
                    () => DropdownButton<AcademicGroup>(
                      // child: DropdownButton<String>(
                      value: _commonController.selectedAcademicGroup.value,
                      hint: Text(
                        _commonController.canContinue.value
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
                      onChanged: (AcademicGroup? selectedModel) {
                        _controller.mUpdateSelectedAcademicGroup(selectedModel);
                      },
                      /*  onChanged: (String? selectedModel) {
                                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                                  }, */
                      items: _commonController.academicGroupList
                          .map((AcademicGroup value) {
                        return DropdownMenuItem<AcademicGroup>(
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
                  child: Obx(
                    () => DropdownButton<AcademicSection>(
                      // child: DropdownButton<String>(
                      value: _commonController.selectedAcademicSection.value,
                      hint: Text(
                        _commonController.canContinue.value
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
                        _controller
                            .mUpdateSelectedAcademicSection(selectedModel);
                      },
                      /*  onChanged: (String? selectedModel) {
                                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                                  }, */
                      items: _commonController.academicSectionList
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
            AppSpacing.sm.width,
            Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                  color: AppColor.frenchSkyBlue100,
                  /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                  child: Obx(
                    () => DropdownButton<AcademicSession>(
                      // child: DropdownButton<String>(
                      value: _commonController.selectedAcademicSession.value,
                      hint: Text(
                        _commonController.canContinue.value
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
                        _controller
                            .mUpdateSelectedAcademicSession(selectedModel);
                      },
                      /*  onChanged: (String? selectedModel) {
                                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                                  }, */
                      items: _commonController.academicSessionList
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
                  child: Obx(
                    () => DropdownButton<Examination>(
                      // child: DropdownButton<String>(
                      value: _commonController.selectedExamination.value,
                      hint: Text(
                        _commonController.canContinue.value
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
                        _controller.mUpdateSelectedExamination(selectedModel);
                      },
                      /*  onChanged: (String? selectedModel) {
                                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                                  }, */
                      items: _commonController.examinationList
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
            AppSpacing.sm.width,
            Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                  color: AppColor.frenchSkyBlue100,
                  /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                  child: Obx(
                    () => DropdownButton<SubjectGorupConditionSetting>(
                      // child: DropdownButton<String>(
                      value: _commonController
                          .selectedSubjectGorupConditionSetting.value,
                      hint: Text(
                        _commonController.canContinue.value
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
                      onChanged: (SubjectGorupConditionSetting? selectedModel) {
                        _controller.mUpdateSelectedSubjectGorupConditionSetting(
                            selectedModel);
                      },
                      /*  onChanged: (String? selectedModel) {
                                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                                  }, */
                      items: _commonController.subjectGorupConditionSettingList
                          .map((SubjectGorupConditionSetting value) {
                        return DropdownMenuItem<SubjectGorupConditionSetting>(
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
                  child: Obx(
                    () => DropdownButton<EmployeePaperDistribution>(
                      // child: DropdownButton<String>(
                      value: _commonController
                          .selectedEmployeePaperDistribution.value,
                      hint: Text(
                        _commonController.canContinue.value
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
                      onChanged: (EmployeePaperDistribution? selectedModel) {
                        _controller.mUpdateSelectedEmployeePaperDistribution(
                            selectedModel);
                      },
                      /*  onChanged: (String? selectedModel) {
                                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                                  }, */
                      items: _commonController.employeePaperDistributionList
                          .map((EmployeePaperDistribution value) {
                        return DropdownMenuItem<EmployeePaperDistribution>(
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
          ],
        ),
      ],
    );
  }

  static vExamAttendanceTable() {
    double cellVerMargin = 8;
    double cellHorMargin = 16;
    return Obx(() {
      return Expanded(
        child: SingleChildScrollView(
          child: _controller.examAttendanceListModel.value
                          .studentListForAttendance !=
                      null &&
                  _controller.examAttendanceListModel.value
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
                                          _controller
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
                            // for (var item in _controller.userInfoModelList) // correct

                            for (var item in _controller.examAttendanceListModel
                                .value.studentListForAttendance!)
                              TableRow(
                                // table decoration
                                decoration: BoxDecoration(
                                    // color: AppColor.secondaryColor.withOpacity(.4),
                                    color: _controller
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
                                        // _controller.mGetFormatDate(item.date),
                                        (_controller
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
                                            _controller
                                                    .examAttendanceListModel
                                                    .value
                                                    .studentListForAttendance![
                                                        _controller
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

                                            _controller.examAttendanceListModel
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

  static vUpdateButton() {
    return SizedBox(
      // width: AppScreenSize.mGetWidth(kGlobContext, 50),
      child: AppButtons.vUpdateButton(
        onTap: () async {
          await _controller.mSubmitExamAttendanceList();
        },
        text: "Update",
      ),
    );
  }

  static vExamAttendanceTab() {
    return Expanded(
        child: Column(
      children: [
        ExamAttendanceWidgets.vExamAttendanceTable(),
        AppSpacing.sm.height,
        Obx(() => _controller.examAttendanceListModel.value
                        .studentListForAttendance !=
                    null &&
                _controller.examAttendanceListModel.value
                    .studentListForAttendance!.isNotEmpty
            ? vUpdateButton()
            : Container()),
      ],
    ));
  }
}
