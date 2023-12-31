import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/student_library.dart';
import 'package:school_management_system/Utils/custom_utils.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/Widgets/custom_container.dart';

import '../../Widgets/buttons.dart';
import '../../Widgets/custom_textfield.dart';

class StuAttendanceWidgets {
  // make this class singleton
  StuAttendanceWidgets._internal();
  static final StuAttendanceWidgets _singleton =
      StuAttendanceWidgets._internal();
  factory StuAttendanceWidgets() {
    return _singleton;
  }

  static final _controller = StuAttendanceController.to;

  static vTopbar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// tab buttons
        Obx(() => Row(
              children: [
                Expanded(
                  child: CommonContainers.vTabItemContainer(
                      text: "Daily Attendance",
                      isActive: _controller.isDailyAttendaceActive.value,
                      onTap: () {
                        _controller.mUpdateDailyAttendanceTabItem();
                      }),
                ),
                (AppSpacing.smh / 2).width,
                Expanded(
                    child: CommonContainers.vTabItemContainer(
                  text: "Periodic Attendance",
                  isActive: _controller.isPeriodicAttendaceActive.value,
                  onTap: () {
                    _controller.mUpdatePeriodicAttendanceTabItem();
                  },
                )),
              ],
            )),

        /// Date and SearchPart
        Container(
          padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.md, horizontal: AppSpacing.sm),
          decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(8),
              color: AppColor.primaryColor),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: StaggeredGrid.count(
                  crossAxisCount: 7,
                  crossAxisSpacing: AppSpacing.sm,
                  mainAxisSpacing: AppSpacing.sm + 2,
                  children: [
                    StaggeredGridTile.fit(
                      crossAxisCellCount: 1,
                      child: Container(
                        height: 28,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.smh),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Obx(() => Text(
                              _controller.numOfNoticesInRange.value.toString(),
                              // "23",
                              style: kTitle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.silverLakeBlue),
                            )),
                      ),
                    ),
                    StaggeredGridTile.fit(
                      crossAxisCellCount: 3,
                      child: Container(
                        height: 28,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.sm),
                        decoration: BoxDecoration(
                            color: AppColor.topaz,
                            borderRadius: BorderRadius.circular(5)),
                        child: GestureDetector(
                          onTap: () => _controller.mSelectDateFrom(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                size: 16,
                                color: AppColor.kGray100,
                              ),
                              (AppSpacing.smh / 2).width,
                              Obx(() => Text(
                                    _controller
                                        .mGetFormatDate(_controller.dateFrom),
                                    // "23-09-2023",
                                    style: kBody.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    StaggeredGridTile.fit(
                      crossAxisCellCount: 3,
                      child: Container(
                        height: 28,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.sm),
                        decoration: BoxDecoration(
                            color: AppColor.topaz,
                            borderRadius: BorderRadius.circular(5)),
                        child: GestureDetector(
                          onTap: () => _controller.mSelectDateTo(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                size: 16,
                                color: AppColor.kGray100,
                              ),
                              (AppSpacing.smh / 2).width,
                              Obx(() => Text(
                                    _controller
                                        .mGetFormatDate(_controller.dateTo),
                                    style: kBody.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),

                    /* StaggeredGridTile.fit(
                      crossAxisCellCount: 7,
                      child: CustomTextField(
                        style: kBody,
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.smh / 2,
                          horizontal: AppSpacing.sm,
                        ),
                        borderRadius: 2,
                        isDense: true,
                        prefixIcon: Container(
                          alignment: Alignment.centerLeft,
                          width: 64,
                          margin: const EdgeInsets.only(right: AppSpacing.sm),
                          padding:
                              const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                          decoration: const BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: AppColor.kGray500, width: .5))),
                          child: const Text(
                            "Active",
                            style: kBody,
                          ),
                        ),
                        suffixIcon: const Icon(
                          Icons.search,
                          color: AppColor.kGray500,
                        ),
                      ),
                    ) */
                  ],
                ),
              ),
              AppSpacing.xl.height,
              _vGetResultBtn(),
            ],
          ),
        ),
      ],
    );
  }

  static _vGetResultBtn() {
    return AppButtons.vPrimaryButton(
      onTap: () async {
        await _controller.mGetAttendanceInRange();
      },
      text: "Get Attendance",
    );
  }

  static vAttendanceTable() {
    List list = [
      {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"},
    ];
    return Obx(() => Expanded(
          child: _controller.stuAttendanceList.isEmpty
              ? Container()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                            // width: double.infinity,
                            width: AppScreenSize.mGetWidth(kGlobContext, 100) +
                                40,
                            child: ClipRRect(
                                // borderRadius: BorderRadius.circular(12),
                                child: Table(
                              /*  columnWidths: <int, TableColumnWidth>{
                                                    0: m.sm
                                                        ? const FlexColumnWidth()
                                                        : const IntrinsicColumnWidth(),
                                                    // 1: FlexColumnWidth(),
                                                    1: FixedColumnWidth(m.xl ? 200 : 364),
                                                    // 2: FlexColumnWidth(),
                                                    // 3: FlexColumnWidth(),
                                                    // 4: FlexColumnWidth(),
                                                  }, */
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: <TableRow>[
                                TableRow(
                                  // table decoration
                                  decoration: const BoxDecoration(
                                      color: AppColor.secondaryColor),
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Date'.toUpperCase(),
                                          style: kBody.copyWith(
                                              color: AppColor.white,
                                              fontWeight: FontWeight.bold),
                                        ).marginAll(0),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'In-Time'.toUpperCase(),
                                          style: kBody.copyWith(
                                              color: AppColor.white,
                                              fontWeight: FontWeight.bold),
                                        ).marginAll(10),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Out-Time'.toUpperCase(),
                                          style: kBody.copyWith(
                                              color: AppColor.white,
                                              fontWeight: FontWeight.bold),
                                        ).marginAll(10),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Status'.toUpperCase(),
                                          style: kBody.copyWith(
                                              color: AppColor.white,
                                              fontWeight: FontWeight.bold),
                                        ).marginAll(0),
                                      ],
                                    ),
                                  ],
                                ),
                                // for (var item in _controller.userInfoModelList) // correct

                                for (var item
                                    in _controller.stuAttendanceList) // test

                                  TableRow(
                                    // table decoration
                                    decoration: BoxDecoration(
                                        color:
                                            /* _controller.userInfoModelList.indexOf(item) */ _controller
                                                            .stuAttendanceList
                                                            .indexOf(item) %
                                                        2 ==
                                                    0
                                                ? AppColor.secondaryColor
                                                    .withOpacity(.4)
                                                : AppColor.secondaryColor
                                                    .withOpacity(.2)),
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            _controller
                                                .mGetFormatDate(item.date),
                                            style: kBody.copyWith(
                                                color: AppColor.kBlack,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ).marginSymmetric(
                                              vertical: 0, horizontal: 0),
                                        ],
                                      ),

                                      /// in Time
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              item.inTime != null
                                                  ? Utils().getTimeFromTimeStamp(
                                                      "${item.date} ${item.inTime}",
                                                      kAppTimeFormat12)
                                                  : "--",
                                              textAlign: TextAlign.center,
                                              style: kBody.copyWith(
                                                  color: AppColor.kBlack,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ).marginSymmetric(
                                                horizontal: AppSpacing.smh,
                                                vertical: AppSpacing.md),
                                          ),
                                        ],
                                      ),

                                      /// out Time
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              item.outTime != null
                                                  ? Utils().getTimeFromTimeStamp(
                                                      "${item.date} ${item.outTime}",
                                                      kAppTimeFormat12)
                                                  : "--",
                                              textAlign: TextAlign.center,
                                              style: kBody.copyWith(
                                                  color: AppColor.kBlack,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ).marginSymmetric(
                                                horizontal: AppSpacing.smh,
                                                vertical: AppSpacing.md),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: AppSpacing.sm,
                                                vertical: AppSpacing.smh),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: item.status!
                                                      .contains("Intime")
                                                  ? AppColor.green
                                                      .withOpacity(.9)
                                                  : AppColor.red
                                                      .withOpacity(.9),
                                            ),
                                            child: Text(
                                              item.status!.contains("Intime")
                                                  ? "In Time"
                                                  : "Late",
                                              style: kBody.copyWith(
                                                  color: AppColor.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ).marginAll(0),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                              ],
                            )) /* .marginOnly(left: 20, top: 10, right: 20, bottom: 50) */),
                      ),
                    ],
                  ),
                ),
        ));
  }
}
