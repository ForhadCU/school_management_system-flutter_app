import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/student_library.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/Widgets/custom_container.dart';

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
        Row(
          children: [
            Expanded(
              child: CommonContainers.vTabItemContainer(
                  text: "Daily Attendance", isActive: true),
            ),
            (AppSpacing.smh / 2).width,
            Expanded(
                child: CommonContainers.vTabItemContainer(
                    text: "Periodic Attendance", isActive: false)),
          ],
        ),

        /// Date and SearchPart
        Container(
          padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.md / 2, horizontal: AppSpacing.sm),
          decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(8),
              color: AppColor.primaryColor),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSpacing.smh),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    // controller.numOfNoticesInRange.value.toString(),
                    "23",
                    style: kTitle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColor.silverLakeBlue),
                  ),
                ),
              ),
              StaggeredGridTile.fit(
                crossAxisCellCount: 3,
                child: Container(
                  height: 28,
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
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
                        Text(
                          // controller.mGetFormatDate(controller.dateFrom),
                          "23-09-2023",
                          style: kBody.copyWith(
                              fontWeight: FontWeight.w500, color: Colors.black),
                        ),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
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
                        Text(
                          // controller.mGetFormatDate(controller.dateTo),
                          "29-09-2023",
                          style: kBody.copyWith(
                              fontWeight: FontWeight.w500, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              StaggeredGridTile.fit(
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
              )
            ],
          ),
        )
      ],
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
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
            width: double.infinity,
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
                          'Date'.toUpperCase(),
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
                          'Time'.toUpperCase(),
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
                            "23 Sep 2023",
                            style: kBody.copyWith(
                                color: AppColor.kBlack,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ).marginSymmetric(vertical: 0, horizontal: 0),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              "08:45 AM \n-\n10:34 AM",
                              textAlign: TextAlign.center,
                              style: kBody.copyWith(
                                  color: AppColor.kBlack,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ).marginSymmetric(
                                horizontal: AppSpacing.smh,
                                vertical: AppSpacing.sm),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.sm,
                                vertical: AppSpacing.smh),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: list.indexOf(item) % 2 == 0
                                  ? AppColor.green.withOpacity(.9)
                                  : AppColor.red.withOpacity(.9),
                            ),
                            child: Text(
                              list.indexOf(item) % 2 == 0 ? "In Time" : "Late",
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
    );
  }
}
