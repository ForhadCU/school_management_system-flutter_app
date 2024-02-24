import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/STUDENT/exam/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../Config/config.dart';
import '../../../Controller/student_library.dart';
import 'package:school_management_system/Model/STUDENT/exam/exam_model.dart';
import 'package:school_management_system/Model/STUDENT/result/history_model.dart';

import '../../Widgets/buttons.dart';
import '../../Widgets/custom_container.dart';

class Exam extends GetView<StuExamController> {
  const Exam({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Exam Document",
        child: BaseWidgetChild(
          child: Column(children: [
            vTopbar(),
            // AppSpacing.md.height,
            vExamDocumentsTable(),
          ]),
        ));
  }

  vTopbar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// tab buttons

        Obx(() => Row(
              children: [
                Expanded(
                  child: CommonContainers.vTabItemContainer(
                      text: "Exam Details",
                      isActive: controller.isExamDetailsActive.value,
                      onTap: () {
                        controller.mUpdateExamDetailsTabItem();
                      }),
                ),
                (AppSpacing.smh / 2).width,
                Expanded(
                    child: CommonContainers.vTabItemContainer(
                  text: "Exam (Online)",
                  isActive: controller.isExamOnlineActive.value,
                  onTap: () {
                    controller.mUpdateExamOnlineTabItem();
                  },
                )),
              ],
            )),

        /// DropDowns and Get-Button
        Container(
          decoration: BoxDecoration(
            // color: AppColor.helpDeskTopbar,
            color: AppColor.activeTab,
            // borderRadius: BorderRadius.circular(5.0),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 8.0, vertical: AppSpacing.md),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _vDropdowns(),
              AppSpacing.xl.height,
              _vGetResultBtn(),
            ],
          ),
        ),
        /* Container(
          padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.md / 2, horizontal: AppSpacing.sm),
          decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(8),
              color: AppColor.primaryColor),
          alignment: Alignment.centerLeft,
        ) */
      ],
    );
  }

  _vDropdowns() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        /// Classname Dropdown
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
            color: AppColor.frenchSkyBlue100,
            child: Obx(() => DropdownButton<StuHistoryModel>(
                  // value: controller.academicGrpDropdownValue.value,
                  value: controller.selectedStudentHistory.value,
                  hint: Text(
                    "Class",
                    style: kBody.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  onChanged: (StuHistoryModel? selectedModel) {
                    // onChanged: (String? selectedModel) {
                    controller.mChangeClassDropdownValue(selectedModel!);
                  },
                  items: /* <String>["Recent", "Older"] */
                      controller.stuHistoryList.map((StuHistoryModel value) {
                    return DropdownMenuItem<StuHistoryModel>(
                      value: value,
                      child: Text(
                        value.stClass!.className!,
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                )),
          ),
        ),
        AppSpacing.sm.width,

        /// Exam name Dropdown
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
            color: AppColor.frenchSkyBlue100,
            child: Obx(() => DropdownButton<StuExamTypeModel>(
                  value: controller.selectedExamTypeModel.value,
                  hint: Text(
                    "Select Exam",
                    style: kBody.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  onChanged: (StuExamTypeModel? selectedModel) {
                    controller.mChangeExamTypeDropdownValue(selectedModel!);
                  },
                  items:
                      controller.stuExamTypeList.map((StuExamTypeModel value) {
                    return DropdownMenuItem<StuExamTypeModel>(
                      value: value,
                      child: Text(
                        value.examinationName!,
                        style: kBody.copyWith(fontWeight: FontWeight.w500),
                      ),
                    );
                  }).toList(),
                )),
          ),
        ),
      ],
    );
  }

  _vGetResultBtn() {
    return AppButtons.vPrimaryButtonWithGradient(
      onTap: () async {
        controller.mResetPreviousDocs();
        await controller.mGetExamRoutinePdf();
        await controller.mGetExamAdmitCardPdf();
      },
      text: "Get Document",
    );
  }

  vExamDocumentsTable() {
    return Obx(() => Visibility(
          visible: controller.isFoundRoutinePdf.value ||
              controller.isFoundAdmitCardPdf.value,
          child: Expanded(
              child: SingleChildScrollView(
            child: Container(
                width: double.infinity,
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(12),
                  child: Table(
                    columnWidths: <int, TableColumnWidth>{
                      0: FlexColumnWidth(
                          AppScreenSize.mGetWidth(kGlobContext, 60)),
                      // 1: IntrinsicColumnWidth(),
                      1: FlexColumnWidth(
                          AppScreenSize.mGetWidth(kGlobContext, 40)),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: <TableRow>[
                      TableRow(
                        // table decoration
                        decoration:
                            const BoxDecoration(color: AppColor.secondaryColor),
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Document'.toUpperCase(),
                                style: kBody.copyWith(
                                    color: AppColor.white,
                                    fontWeight: FontWeight.bold),
                              ).marginAll(10),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Download'.toUpperCase(),
                                style: kBody.copyWith(
                                    color: AppColor.white,
                                    fontWeight: FontWeight.bold),
                              ).marginAll(0),
                            ],
                          ),
                        ],
                      ),
                      // for (var item in controller.userInfoModelList) // correct

                      for (var item in controller.documentList) // test

                        /*  list.indexOf(item) == 0
                            ? */
                        TableRow(
                          // table decoration
                          decoration: BoxDecoration(
                              color:
                                  /* controller.userInfoModelList.indexOf(item) */ controller
                                                  .documentList
                                                  .indexOf(item) %
                                              2 ==
                                          0
                                      ? AppColor.secondaryColor.withOpacity(.4)
                                      : AppColor.secondaryColor
                                          .withOpacity(.2)),
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    item,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: kBody.copyWith(
                                        color: AppColor.kBlack,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ).marginAll(8),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppButtons.vDownloadButton(
                                        onTap: () {
                                          // controller.mDownloadPortraitResult();
                                          item == "Examination Routine Pdf"
                                              ? controller.mDownloadRoutinePdf()
                                              : item == "Your Admit Card Pdf"
                                                  ? controller
                                                      .mDownloadAdmitCardPdf()
                                                  : null;
                                        },
                                        horizontalPadding: AppSpacing.sm,
                                        text: "Download")
                                    .marginSymmetric(
                                        horizontal: AppSpacing.smh,
                                        vertical: AppSpacing.md),
                              ],
                            ),
                          ],
                        )
                      /* : TableRow(
                                // table decoration
                                decoration: BoxDecoration(
                                    color:
                                        /* controller.userInfoModelList.indexOf(item) */ list
                                                        .indexOf(item) %
                                                    2 ==
                                                0
                                            ? AppColor.secondaryColor.withOpacity(.4)
                                            : AppColor.secondaryColor
                                                .withOpacity(.2)),
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          item['name'],
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.clip,
                                          style: kBody.copyWith(
                                              color: AppColor.kBlack,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ).marginAll(8),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppButtons.vDownloadButton(
                                              onTap: () {
                                                // controller.mDownloadPortraitResult();
                                              },
                                              horizontalPadding: AppSpacing.sm,
                                              text: "Download")
                                          .marginSymmetric(
                                              horizontal: AppSpacing.smh,
                                              vertical: AppSpacing.md),
                            )        ],
                              ),
                            ],
                          ), */
                    ],
                  ),
                ) /* .marginOnly(left: 20, top: 10, right: 20, bottom: 50) */),
          )),
        ));
  }
}
