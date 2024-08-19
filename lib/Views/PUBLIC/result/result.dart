import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/PUBLIC/result_controller.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../Config/config.dart';
import '../../../Model/PUBLIC/result/academic_class_group_res_model.dart';
import '../../../Model/PUBLIC/result/academic_class_res_model.dart';
import '../../../Model/PUBLIC/result/academic_group_res_model.dart';
import '../../../Model/PUBLIC/result/academic_section_res_model.dart';
import '../../../Model/PUBLIC/result/academic_year_res_model.dart';
import '../../Widgets/buttons.dart';

class PublicResult extends GetView<PublicResultController> {
  PublicResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Public Result",
        child: BaseWidgetChild(
          child: Column(
            children: [
              // ExamAttendanceWidgets.vTabBar(),
              // ExamAttendanceWidgets.vExamAttendanceTopbar(),
              vTopbar(),
              AppSpacing.sm.height,
              vBody(),

              /*  AppSpacing.md.height,
              ExamAttendanceWidgets.vUpdateButton(), */
            ],
          ),
        ));
  }

  vTopbar() {
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
              Obx(
                () => Visibility(
                  visible: controller.isVisibleGetButton.value,
                  child: Column(
                    children: [
                      AppSpacing.md.height,
                      SizedBox(
                        width: AppScreenSize.mGetWidth(kGlobContext, 50),
                        child: _vGetResultBtn(),
                      ),
                      AppSpacing.smh.height,
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  _vGetResultBtn() {
    return AppButtons.vPrimaryButtonWithGradient(
      onTap: () async {
        // await controller.mGetExamAttendanceListModel();
      },
      text: "Get List",
    );
  }

  _vDropdowns1() {
    // kLog(
    //     "Called vDropdonws1: ${controller.academicYearList.length}  ${controller.selectedAcademicYear.value.yearName}  ");

    return Obx(() => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                      color: AppColor.frenchSkyBlue100,
                      child: Obx(
                        () {
                          return DropdownButton<AcademicGroupList>(
                            value: controller.selectedAcademicGroupList.value,
                            hint: Text(
                              controller.canContinue.value
                                  ? "Select School"
                                  : "No School",
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
                            onChanged: (AcademicGroupList? selectedModel) {
                              controller
                                  .mUpdateAcademicGroupList(selectedModel);
                            },

                            items: controller.pubAcademicGroupList
                                .map((AcademicGroupList value) {
                              return DropdownMenuItem<AcademicGroupList>(
                                value: value,
                                child: Text(
                                  value.academicGroupName ?? "",
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
              ],
            ),
            Visibility(
                visible: controller.pubAcademicYearList.isNotEmpty ||
                    controller.pubAcademicShiftList.isNotEmpty,
                child: AppSpacing.sm.height),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Visibility(
                      visible: controller.pubAcademicYearList.isNotEmpty,
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
                              () {
                                // kLog(
                                //     "Called Obx: ${controller.academicYearList.length}  ${controller.selectedAcademicYear.value.yearName}  ");
                                return DropdownButton<AcademicYearList>(
                                  // child: DropdownButton<String>(
                                  value:
                                      controller.selectedAcademicYearList.value,
                                  hint: Text(
                                    controller.canContinue.value
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
                                  onChanged: (AcademicYearList? selectedModel) {
                                    controller.mUpdateSelectedAcademicYearList(
                                        selectedModel);
                                  },
                                  /*  onChanged: (String? selectedModel) {
                                      // controller.mUpdateSelectedStuHistory(selectedModel);
                                    }, */
                                  items: controller.pubAcademicYearList
                                      .map((AcademicYearList value) {
                                    return DropdownMenuItem<AcademicYearList>(
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
                    ),
                    Visibility(
                        visible: controller.pubAcademicShiftList.isNotEmpty,
                        child: AppSpacing.sm.width),
                    Visibility(
                      visible: controller.pubAcademicShiftList.isNotEmpty,
                      child: Expanded(
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.sm,
                                vertical: AppSpacing.smh),
                            color: AppColor.frenchSkyBlue100,
                            /*  decoration:
                                        BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                            child: Obx(
                              () => DropdownButton<AcademicShiftList>(
                                // child: DropdownButton<String>(
                                value:
                                    controller.selectedAcademicShiftList.value,
                                hint: Text(
                                  controller.canContinue.value
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
                                onChanged: (AcademicShiftList? selectedModel) {
                                  controller.mUpdateSelectedAcademicShiftList(
                                      selectedModel);
                                },
                                /*  onChanged: (String? selectedModel) {
                                                  // controller.mUpdateSelectedStuHistory(selectedModel);
                                                }, */
                                items: controller.pubAcademicShiftList
                                    .map((AcademicShiftList value) {
                                  return DropdownMenuItem<AcademicShiftList>(
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
                visible: controller.pubAcademicClassList.isNotEmpty ||
                    controller.pubAcademicClassGroupList.isNotEmpty,
                child: AppSpacing.sm.height),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Visibility(
                      visible: controller.pubAcademicClassList.isNotEmpty,
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
                              () => DropdownButton<AcademicClassList>(
                                // child: DropdownButton<String>(
                                value:
                                    controller.selectedAcademicClassList.value,
                                hint: Text(
                                  controller.canContinue.value
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
                                onChanged: (AcademicClassList? selectedModel) {
                                  controller.mUpdateSelectedAcademicClassList(
                                      selectedModel);
                                },
                                /*  onChanged: (String? selectedModel) {
                                      // controller.mUpdateSelectedStuHistory(selectedModel);
                                    }, */
                                items: controller.pubAcademicClassList
                                    .map((AcademicClassList value) {
                                  return DropdownMenuItem<AcademicClassList>(
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
                        visible:
                            controller.pubAcademicClassGroupList.isNotEmpty,
                        child: AppSpacing.sm.width),
                    Visibility(
                      visible: controller.pubAcademicClassGroupList.isNotEmpty,
                      child: Expanded(
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.sm,
                                vertical: AppSpacing.smh),
                            color: AppColor.frenchSkyBlue100,
                            /*  decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                            child: Obx(
                              () => DropdownButton<AcademicClassGroupList>(
                                // child: DropdownButton<String>(
                                value: controller
                                    .selectedAcademicClassGroupList.value,
                                hint: Text(
                                  controller.canContinue.value
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
                                onChanged:
                                    (AcademicClassGroupList? selectedModel) {
                                  controller
                                      .mUpdateSelectedAcademicClassGroupList(
                                          selectedModel);
                                },
                                /*  onChanged: (String? selectedModel) {
                                      // controller.mUpdateSelectedStuHistory(selectedModel);
                                    }, */
                                items: controller.pubAcademicClassGroupList
                                    .map((AcademicClassGroupList value) {
                                  return DropdownMenuItem<
                                      AcademicClassGroupList>(
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
                visible: controller.pubResultList.isNotEmpty ||
                    controller.pubAcademicSectionList.isNotEmpty,
                child: AppSpacing.sm.height),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Visibility(
                      visible: controller.pubResultList.isNotEmpty,
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
                              () => DropdownButton<ResultList>(
                                // child: DropdownButton<String>(
                                value: controller.selectedResultList.value,
                                hint: Text(
                                  controller.canContinue.value
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
                                onChanged: (ResultList? selectedModel) {
                                  controller
                                      .mUpdateSelectedResultList(selectedModel);
                                },
                                /*  onChanged: (String? selectedModel) {
                                      // controller.mUpdateSelectedStuHistory(selectedModel);
                                    }, */
                                items: controller.pubResultList
                                    .map((ResultList value) {
                                  return DropdownMenuItem<ResultList>(
                                    value: value,
                                    child: Text(
                                      value.name ?? "",
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
                visible: controller.pubAcademicSectionList.isNotEmpty,
                child: AppSpacing.sm.height),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(() => Visibility(
                      visible: controller.pubAcademicSectionList.isNotEmpty,
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
                              () => DropdownButton<AcademicSectionList>(
                                // child: DropdownButton<String>(
                                value: controller
                                    .selectedAcademicSectionList.value,
                                hint: Text(
                                  controller.canContinue.value
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
                                onChanged:
                                    (AcademicSectionList? selectedModel) {
                                  controller.mUpdateSelectedAcademicSectionList(
                                      selectedModel);
                                },
                                /*  onChanged: (String? selectedModel) {
                                      // controller.mUpdateSelectedStuHistory(selectedModel);
                                    }, */
                                items: controller.pubAcademicSectionList
                                    .map((AcademicSectionList value) {
                                  return DropdownMenuItem<AcademicSectionList>(
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
                    )),
              ],
            ),
            Visibility(
                visible: controller.pubResultList.isNotEmpty,
                child: AppSpacing.sm.height),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(() => Visibility(
                      visible: controller.pubResultList.isNotEmpty,
                      child: Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.white,
                          child: TextFormField(
                            style: kBody.copyWith(color: Colors.black),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                isDense: true,
                                hintText: "Enter Roll",
                                hintStyle:
                                    kBody.copyWith(color: Colors.black54),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 10)),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ));
  }

  vBody() {
    return Expanded(
        child: Column(
      children: [
        // vResultTable(),
      ],
    ));
  }
/* 
  vResultTable() {
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
 */
}
