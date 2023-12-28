import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/student_library.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../../Config/config.dart';
import '../../Widgets/buttons.dart';
import '../../Widgets/custom_container.dart';

class StuExamWidgets {
  // make this class singleton
  StuExamWidgets._internal();
  static final StuExamWidgets _singleton = StuExamWidgets._internal();
  factory StuExamWidgets() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static final _controller = StuExamController.to;

  static vTopbar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// tab buttons
        Row(
          children: [
            Expanded(
              child: CommonContainers.vTabItemContainer(
                  text: "Exam Details", isActive: true),
            ),
            (AppSpacing.smh / 2).width,
            Expanded(
                child: CommonContainers.vTabItemContainer(
                    text: "Exam (Online)", isActive: false)),
          ],
        ),

        /// DropDowns and Get-Button
        Container(
          decoration: BoxDecoration(
            // color: AppColor.helpDeskTopbar,
            color: AppColor.primaryColor,
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

  static _vDropdowns() {
    return Row(
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
            child: DropdownButton<String>(
              // value: controller.academicGrpDropdownValue.value,
              // value: _controller.selectedStudentHistory.value,
              hint: Text(
                "Class",
                style: kBody.copyWith(
                  fontWeight: FontWeight.w400,
                ),
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
              // onChanged: (AcademicGroupModel? selectedModel) {
              onChanged: (String? selectedModel) {
                // _controller.mUpdateSelectedStuHistory(selectedModel);
              },
              items: <String>["Recent", "Older"]
                  /* _controller.stuHistoryList */ .map((String value) {
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
          flex: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
            color: AppColor.frenchSkyBlue100,
            /*  decoration:
                                      BoxDecoration(borderRadius: BorderRadius.circular(5)), */
            child: DropdownButton<String>(
              // value: controller.academicGrpDropdownValue.value,

              // value: _controller.selectedResultModel.value,
              // value: _controller.selectedResultModel.value,
              hint: Text(
                "Select Exam",
                style: kBody.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              icon: const Icon(Icons.keyboard_arrow_down),
              iconSize: 12,
              elevation: 10,
              // style: kBody.copyWith(fontWeight: FontWeight.w500),
              focusColor: AppColor.white,
              dropdownColor: AppColor.frenchSkyBlue100,
              isDense: true,
              isExpanded: true,
              underline: Container(
                  /*        height: 1,
                                      color: AppColor.kGray700.withOpacity(.5), */
                  ),
              // onChanged: (AcademicGroupModel? selectedModel) {
              onChanged: (String? selectedModel) {
                // _controller.mUpdateSelectedStuExam(selectedModel);
              },
              items: <String>["Recent", "Older"]
                  /*     _controller.stuResultModelList */
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: kBody.copyWith(fontWeight: FontWeight.w500),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  static _vGetResultBtn() {
    return AppButtons.vPrimaryButton(
      onTap: () async {
        // await _controller.mGetResultPdf();
      },
      text: "Get Document",
    );
  }

  static vExamDocumentsTable() {
    List list = [
      {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"},
    ];
    return Expanded(
        child: SingleChildScrollView(
      child: Container(
          width: double.infinity,
          child: ClipRRect(
            // borderRadius: BorderRadius.circular(12),
            child: Table(
              columnWidths: <int, TableColumnWidth>{
                0: FlexColumnWidth(AppScreenSize.mGetWidth(kGlobContext, 8)),
                // 1: IntrinsicColumnWidth(),
                1: FlexColumnWidth(AppScreenSize.mGetWidth(kGlobContext, 32)),
                2: FlexColumnWidth(AppScreenSize.mGetWidth(kGlobContext, 20)),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                TableRow(
                  // table decoration
                  decoration:
                      const BoxDecoration(color: AppColor.secondaryColor),
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '#',
                          style: kBody.copyWith(
                              color: AppColor.white,
                              fontWeight: FontWeight.bold),
                        ).marginAll(0),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                // for (var item in _controller.userInfoModelList) // correct

                for (var item in list) // test

                  TableRow(
                    // table decoration
                    decoration: BoxDecoration(
                        color:
                            /* _controller.userInfoModelList.indexOf(item) */ list
                                            .indexOf(item) %
                                        2 ==
                                    0
                                ? AppColor.secondaryColor.withOpacity(.4)
                                : AppColor.secondaryColor.withOpacity(.2)),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "123",
                            style: kBody.copyWith(
                                color: AppColor.kBlack,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ).marginSymmetric(vertical: 2, horizontal: 2),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Test Exam Routine 2023",
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
                          list.indexOf(item) % 5 == 0
                              ? AppButtons.vDownloadButton(
                                      onTap: () {
                                        // _controller.mDownloadPortraitResult();
                                      },
                                      horizontalPadding: AppSpacing.sm,
                                      text: "Download")
                                  .marginSymmetric(
                                      horizontal: AppSpacing.smh,
                                      vertical: AppSpacing.md)
                              : AppButtons.vViewButton(
                                      onTap: () {
                                        // _controller.mDownloadPortraitResult();
                                      },
                                      text: "View")
                                  .marginSymmetric(
                                      horizontal: AppSpacing.smh,
                                      vertical: AppSpacing.md)
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          ) /* .marginOnly(left: 20, top: 10, right: 20, bottom: 50) */),
    ));
  }
}
