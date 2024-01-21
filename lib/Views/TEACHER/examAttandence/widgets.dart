import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../../Config/config.dart';
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
          
            ],
          ),
        ),
      ],
    );
  }

  static _vGetResultBtn() {
    return AppButtons.vPrimaryButtonWithGradient(
      onTap: () async {
        // await _controller.mGetResultPdf();
      },
      text: "Get List",
    );
  }

  static _vUpdateBtn() {
    return AppButtons.vPrimaryButtonWithGradient(
      onTap: () async {
        // await _controller.mGetResultPdf();
      },
      text: "Update",
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
                // child: DropdownButton<StuHistoryModel>(
                child: DropdownButton<String>(
                  // value: _controller.selectedStudentHistory.value,
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
                  //   _controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* _controller.stuHistoryList.map((StuHistoryModel value) {
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
                  // value: _controller.selectedStudentHistory.value,
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
                  //   _controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* _controller.stuHistoryList.map((StuHistoryModel value) {
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
                  // value: _controller.selectedStudentHistory.value,
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
                  //   _controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* _controller.stuHistoryList.map((StuHistoryModel value) {
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
                  // value: _controller.selectedStudentHistory.value,
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
                  //   _controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* _controller.stuHistoryList.map((StuHistoryModel value) {
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
                  // value: _controller.selectedStudentHistory.value,
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
                  //   _controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* _controller.stuHistoryList.map((StuHistoryModel value) {
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
                  // value: _controller.selectedStudentHistory.value,
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
                  //   _controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* _controller.stuHistoryList.map((StuHistoryModel value) {
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

  static vExamAttendanceTable() {
    double cellVerMargin = 8;
    double cellHorMargin = 16;
    return /*  Obx(() => */ SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '#',
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
                          'Student',
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
                          'Roll',
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
                          'Written',
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
                    ),
                  ],
                ),
                // for (var item in _controller.userInfoModelList) // correct

                for (var item in [
                  "Anamika Roy",
                  "Rafi Islam",
                  "Ankit Tewari",
                  "Anamika Roy",
                  "Rafi Islam",
                  "Ankit Tewari",
                  "Anamika Roy",
                ])
                  TableRow(
                    // table decoration
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColor.withOpacity(.4),
                      /*  _feeDetailsModel!.feeAllocationDetails!
                                        .indexOf(item) %
                                    2 ==
                                0
                            ? AppColor.secondaryColor.withOpacity(.4)
                            : AppColor.secondaryColor.withOpacity(.2) */
                    ),
                    children: <Widget>[
                      /// #
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            // _controller.mGetFormatDate(item.date),
                            [
                              "Anamika Roy",
                              "Rafi Islam",
                              "Ankit Tewari",
                              "Anamika Roy",
                              "Rafi Islam",
                              "Ankit Tewari",
                              "Anamika Roy",
                            ].indexOf(item).toString(),
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
                              item,
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
                              "101",
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

                      /// Written
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
                    ],
                  ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
