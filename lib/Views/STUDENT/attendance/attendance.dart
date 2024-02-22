import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/student_library.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/STUDENT/attendance/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../Widgets/buttons.dart';

class StuAttendance extends GetView<StuAttendanceController> {
  const StuAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "My Attendance".toUpperCase(),
        child: BaseWidgetChild(
          child: Column(children: [
            /*  Obx(() => controller.isDailyAttendaceTabActive.value
                ? Expanded(child: StuAttendanceWidgets.vDailyAttendance())
                : Expanded(child: StuAttendanceWidgets.vPeriodicAttendance())), */
            Expanded(child: vDailyAttendance())
          ]),
        ));
  }

  vDailyAttendance() {
    return Column(
      children: [
        // StuAttendanceWidgets.vTabBar(),
        vDailyAttendanceTopbar(),
        // AppSpacing.md.height,
        Expanded(child: vDailyAttendanceTable()),
      ],
    );
  }

  vDailyAttendanceTable() {
    return Obx(() => controller.isLoading.value
        ? Container(
            alignment: Alignment.center,
            child: const Text(
              "Please wait...",
              style: kLabel,
            ),
          )
        : controller.stuAttendanceList.value.isEmpty
            ? Container(
                alignment: Alignment.center,
                child: Text(
                  "No Data!",
                  style: kLabel.copyWith(color: AppColor.red),
                ))
            : SingleChildScrollView(
                controller: controller.attendanceListScrollCntrlr.value,
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                          // width: double.infinity,
                          width:
                              AppScreenSize.mGetWidth(kGlobContext, 100) + 40,
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
                                        'In-Time'.toUpperCase(),
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
                                        'Out-Time'.toUpperCase(),
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
                              // for (var item in controller.userInfoModelList) // correct

                              for (var item in controller
                                  .stuAttendanceList.value!) // test

                                TableRow(
                                  // table decoration
                                  decoration: BoxDecoration(
                                      color:
                                          /* controller.userInfoModelList.indexOf(item) */ controller
                                                          .stuAttendanceList
                                                          .value!
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
                                          controller.mGetFormatDate(item.date),
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
                                                ? item
                                                    .inTime! /* Utils().getTimeFromTimeStamp(
                                                    "${item.date} ${item.inTime}",
                                                    kAppTimeFormat12) */
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
                                                ? item
                                                    .outTime! /* Utils().getTimeFromTimeStamp(
                                                    "${item.date} ${item.outTime}",
                                                    kAppTimeFormat12) */
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
                                                ? AppColor.green.withOpacity(.9)
                                                : AppColor.red.withOpacity(.9),
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
              ));
  }

  vDailyAttendanceTopbar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Date and SearchPart
        Container(
          padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.md, horizontal: AppSpacing.sm),
          decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(8),
              color: AppColor.activeTab),
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
                              controller.numOfNoticesInRange.value.toString(),
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
                          onTap: () => controller.mSelectDateFrom(),
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
                                    controller
                                        .mGetFormatDate(controller.startDate),
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
                          onTap: () => controller.mSelectDateTo(),
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
                                    controller
                                        .mGetFormatDate(controller.endDate),
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

  _vGetResultBtn() {
    return AppButtons.vPrimaryButtonWithGradient(
      onTap: () async {
        controller.isLoading.value = true;
        controller.mResetValues();
        await controller.mGetAttendanceInRange();
        controller.isLoading.value = false;
      },
      text: "Get Attendance",
    );
  }
}
