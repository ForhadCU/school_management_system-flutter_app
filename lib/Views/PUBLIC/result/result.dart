import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
        title: "Academic Result",
        child: BaseWidgetChild(
          child: SingleChildScrollView(
            child: Column(
              children: [
                vTopbar(),
                // AppSpacing.smh.height,
                Divider(
                  color: Colors.black26,
                  thickness: .8,
                ),
                Obx(() =>
                    controller.studentExamResult.value.subjectList != null &&
                            controller
                                .studentExamResult.value.subjectList!.isNotEmpty
                        ? vBody()
                        : Container()),
              ],
            ),
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
        await controller.mGetPubExamResultResModel();
      },
      text: "Get Result",
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
                            iconEnabledColor: Colors.black54,
                        iconDisabledColor: Colors.black54,
                        icon: const Icon(Icons.arrow_drop_down),
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
                                  iconEnabledColor: Colors.black54,
                        iconDisabledColor: Colors.black54,
                        icon: const Icon(Icons.arrow_drop_down),
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
                                iconEnabledColor: Colors.black54,
                        iconDisabledColor: Colors.black54,
                        icon: const Icon(Icons.arrow_drop_down),
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
                                iconEnabledColor: Colors.black54,
                        iconDisabledColor: Colors.black54,
                        icon: const Icon(Icons.arrow_drop_down),
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
                                iconEnabledColor: Colors.black54,
                        iconDisabledColor: Colors.black54,
                        icon: const Icon(Icons.arrow_drop_down),
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
                visible: controller.pubResultTypeList.isNotEmpty ||
                    controller.pubAcademicSectionList.isNotEmpty,
                child: AppSpacing.sm.height),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Visibility(
                      visible: controller.pubResultTypeList.isNotEmpty,
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
                                value: controller.selectedResultTypeList.value,
                                hint: Text(
                                  controller.canContinue.value
                                      ? "Select Exam"
                                      : "No Exam",
                                  style: kBody.copyWith(color: Colors.black),
                                ),
                                iconEnabledColor: Colors.black54,
                        iconDisabledColor: Colors.black54,
                        icon: const Icon(Icons.arrow_drop_down),
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
                                items: controller.pubResultTypeList
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
                                iconEnabledColor: Colors.black54,
                        iconDisabledColor: Colors.black54,
                        icon: const Icon(Icons.arrow_drop_down),
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
                visible: controller.pubResultTypeList.isNotEmpty,
                child: AppSpacing.sm.height),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(() => Visibility(
                      visible: controller.pubResultTypeList.isNotEmpty,
                      child: Expanded(
                        flex: 1,
                        child: Container(
                          color: AppColor.frenchSkyBlue100,
                          child: TextFormField(
                            controller: controller.rollEditTextCtrlr,
                            style: kBody.copyWith(color: Colors.black),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                isDense: true,
                                hintText: "Enter Roll",
                                hintStyle:
                                    kBody.copyWith(color: Colors.black54),
                                contentPadding: const EdgeInsets.symmetric(
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
    return Column(
      children: [
        
        vStudentDetails(),
        AppSpacing.smh.height,
        vResultTable(),
      ],
    );
  }

  vResultTable() {
    double cellVerMargin = 8;
    double cellHorMargin = 16;
    return Column(
      children: [
        _vPlainBox(
          boxBg: AppColor.white,
          child: const Text(
            "Grade Sheet",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColor.textColor),
          ),
        ),
        Column(
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
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.all(color: AppColor.white),
                  children: <TableRow>[
                    TableRow(
                      // table decoration
                      decoration: const BoxDecoration(
                          // color: AppColor.secondaryColor),
                          color: AppColor.inactiveTab),
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Code',
                              style: kBody.copyWith(
                                  color: AppColor.white,
                                  fontWeight: FontWeight.w500),
                            ).marginSymmetric(
                                vertical: cellVerMargin,
                                horizontal: cellHorMargin),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Subject',
                              style: kBody.copyWith(
                                  color: AppColor.white,
                                  fontWeight: FontWeight.w500),
                            ).marginSymmetric(
                                vertical: cellVerMargin,
                                horizontal: cellHorMargin),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Grade',
                              style: kBody.copyWith(
                                  color: AppColor.white,
                                  fontWeight: FontWeight.w500),
                            ).marginSymmetric(
                                vertical: cellVerMargin,
                                horizontal: cellHorMargin),
                          ],
                        ),
                      ],
                    ),
                    for (var item
                        in controller.studentExamResult.value.subjectList!)
                      TableRow(
                        // table decoration
                        decoration: BoxDecoration(
                            // color: AppColor.secondaryColor.withOpacity(.4),
                            color: controller.studentExamResult.value
                                            .subjectList!
                                            .indexOf(item) %
                                        2 ==
                                    0
                                ? AppColor.secondaryColor.withOpacity(.4)
                                : AppColor.secondaryColor.withOpacity(.2)),
                        children: <Widget>[
                          /// Code
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item.subjectCode ?? "",
                                style: kBody.copyWith(
                                    color: AppColor.kBlack,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ).marginSymmetric(
                                  vertical: cellVerMargin,
                                  horizontal: cellHorMargin),
                            ],
                          ),

                          /// Subject
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  item.examDependentAcademicSubject ?? "",
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

                          /// Grade
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  item.subjectGrade ?? "",
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
                        ],
                      ),
                  ],
                )),
              ),
            ),
            /* AppSpacing.md.height,
                    vUpdateButton(), */
          ],
        ),
      ],
    );
  }

  Container _vPlainBox({required Widget child, required Color boxBg}) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
      decoration: BoxDecoration(color: boxBg.withOpacity(.5)),
      child: child,
    );
  }

  _vDoubleColumTextPlate(
      {required String key,
      required String value,
      FontWeight? valueFontweight}) {
    return Container(
      color: AppColor.secondaryColor.withOpacity(.2),
      padding:
          const EdgeInsets.symmetric(vertical: AppSpacing.smh, horizontal: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(key,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                )),
          ),
          2.width,
          const Text(": ",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
              )),
          2.width,
          Expanded(
            flex: 2,
            child: Text(value,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: valueFontweight ?? FontWeight.w400,
                  fontSize: 13,
                )),
          )
        ],
      ),
    );
  }

  vStudentDetails() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ///heading
        _vPlainBox(
          boxBg: AppColor.green,
          child: Text(
            controller.studentExamResult.value.resultTypeName ?? "",
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColor.white),
          ),
        ),

        // AppSpacing.smh.height,

        ///body
        Column(
          children: [
            StaggeredGrid.count(
              crossAxisCount: 2,
              // crossAxisSpacing: 2,
              children: [
                /// Left part
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _vDoubleColumTextPlate(
                        key: "Roll No",
                        value: controller.studentExamResult.value
                                    .studentHistory!.studentRollNumber !=
                                null
                            ? controller.studentExamResult.value.studentHistory!
                                .studentRollNumber
                                .toString()
                            : "N/A"),
                    _vDoubleColumTextPlate(
                        key: "Father's Name",
                        value: controller.studentExamResult.value
                                    .studentHistory!.student!.fatherName !=
                                null
                            ? controller.studentExamResult.value.studentHistory!
                                .student!.fatherName!
                            : "N/A"),
                    _vDoubleColumTextPlate(
                        key: "Group",
                        value: controller.studentExamResult.value
                                    .studentHistory!.classGroup!.groupName !=
                                null
                            ? controller.studentExamResult.value.studentHistory!
                                .classGroup!.groupName!
                            : "N/A"),
                    _vDoubleColumTextPlate(
                        valueFontweight: FontWeight.bold,
                        key: "Result",
                        value: controller.studentExamResult.value.grade != "" &&
                                controller.studentExamResult.value.grade != "F"
                            ? "PASSED"
                            : "FAILED"),
                    _vDoubleColumTextPlate(
                        valueFontweight: FontWeight.bold,
                        key: "Grade",
                        value: controller.studentExamResult.value.grade != ""
                            ? controller.studentExamResult.value.grade!
                            : "N/A"),
                    /*  _vDoubleColumTextPlate(
                        key: "Institute",
                        value:
                            controller.studentExamResult.value.siteName != ""
                                ? controller.studentExamResult.value.siteName!
                                : "N/A"), */
                  ],
                ),

                /// Right part
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _vDoubleColumTextPlate(
                        key: "Name",
                        value: controller.studentExamResult.value
                                    .studentHistory!.fullName !=
                                null
                            ? controller.studentExamResult.value.studentHistory!
                                .fullName
                                .toString()
                            : "N/A"),
                    _vDoubleColumTextPlate(
                        key: "Mother's Name",
                        value: controller.studentExamResult.value
                                    .studentHistory!.student!.motherName !=
                                null
                            ? controller.studentExamResult.value.studentHistory!
                                .student!.motherName
                                .toString()
                            : "N/A"),
                    _vDoubleColumTextPlate(
                        key: "Date of Birth",
                        value: controller.studentExamResult.value
                                    .studentHistory!.student!.dateOfBirth !=
                                null
                            ? controller.studentExamResult.value.studentHistory!
                                .student!.dateOfBirth
                                .toString()
                            : "N/A"),
                    _vDoubleColumTextPlate(
                        valueFontweight: FontWeight.bold,
                        key: "GPA",
                        value: controller.studentExamResult.value.gpa != null
                            ? controller.studentExamResult.value.gpa.toString()
                            : "N/A"),
                    _vDoubleColumTextPlate(
                        valueFontweight: FontWeight.bold,
                        key: "Total Marks",
                        value: controller.studentExamResult.value
                                    .sumOfObtainPercentTotalMarks !=
                                null
                            ? controller.studentExamResult.value
                                .sumOfObtainPercentTotalMarks
                                .toString()
                            : "N/A"),
                  ],
                ),
              ],
            ),
            Container(
              color: AppColor.secondaryColor.withOpacity(.2),
              padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.smh, horizontal: 4),
              child: Row(
                children: [
                  const Expanded(
                    flex: 2,
                    child: Text("Institute",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        )),
                  ),
                  11.width,
                  const Text(": ",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      )),
                  2.width,
                  Expanded(
                    flex: 7,
                    child: Text(
                        controller.studentExamResult.value.siteName != ""
                            ? controller.studentExamResult.value.siteName!
                            : "N/A",
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        )),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
    ;
  }
}
