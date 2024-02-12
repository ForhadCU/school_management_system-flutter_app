import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/Widgets/custom_container.dart';

import '../../../Controller/TEACHER/attendance/attendance_controller.dart';
import '../../Widgets/buttons.dart';

class TeachAttendanceWidgets {
  // make this class singleton
  TeachAttendanceWidgets._internal();
  static final TeachAttendanceWidgets _singleton =
      TeachAttendanceWidgets._internal();
  factory TeachAttendanceWidgets() {
    return _singleton;
  }

  static final _controller = TeachAttendanceController.to;

  static vDailyAttendanceTopbar() {
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
                                        .mGetFormatDate(_controller.startDate),
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
                                        .mGetFormatDate(_controller.endDate),
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
    return AppButtons.vPrimaryButtonWithGradient(
      onTap: () async {
        _controller.isLoading.value = true;
        _controller.mResetValues();
        await _controller.mGetAttendanceInRange();
        _controller.isLoading.value = false;
      },
      text: "Get Attendance",
    );
  }

  static vDailyAttendanceTable() {
    return Obx(() => _controller.isLoading.value
        ? Container(
            alignment: Alignment.center,
            child: const Text(
              "Please wait...",
              style: kLabel,
            ),
          )
        : _controller.teachAttendanceList.isEmpty
            ? Container(
                alignment: Alignment.center,
                child: Text(
                  "No Data!",
                  style: kLabel.copyWith(color: AppColor.red),
                ))
            : SingleChildScrollView(
                controller: _controller.attendanceListScrollCntrlr.value,
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
                              // for (var item in _controller.userInfoModelList) // correct

                              for (var item
                                  in _controller.teachAttendanceList) // test

                                TableRow(
                                  // table decoration
                                  decoration: BoxDecoration(
                                      color:
                                          /* _controller.userInfoModelList.indexOf(item) */ _controller
                                                          .teachAttendanceList
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
                                          _controller.mGetFormatDate(item.date),
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

  static vTabBar() {
    return

        /// tab buttons
        Obx(() => Row(
              children: [
                Expanded(
                  child: CommonContainers.vTabItemContainer(
                      text: "Daily Attendance",
                      isActive: _controller.isDailyAttendaceTabActive.value,
                      onTap: () {
                        _controller.mUpdateDailyAttendanceTabItem();
                      }),
                ),
                (AppSpacing.smh / 2).width,
                Expanded(
                    child: CommonContainers.vTabItemContainer(
                  text: "Periodic Attendance",
                  isActive: !_controller.isDailyAttendaceTabActive.value,
                  onTap: () {
                    _controller.mUpdateDailyAttendanceTabItem();
                  },
                )),
              ],
            ));
  }

  static vDailyAttendance() {
    return Column(
      children: [
        // StuAttendanceWidgets.vTabBar(),
        TeachAttendanceWidgets.vDailyAttendanceTopbar(),
        // AppSpacing.md.height,
        Expanded(child: TeachAttendanceWidgets.vDailyAttendanceTable()),
      ],
    );
  }

  static vPeriodicAttendance() {
    return Column(
      children: [
        vTabBar(),
        vPeriodicAttendanceTopbar(),
        // AppSpacing.md.height,
        // vPeriodicAttendanceFilter(),
        AppSpacing.xl.height,
        _vGetResultBtn(),
        AppSpacing.md.height,
        const Divider(height: 1, thickness: .3, color: Colors.black12),
        AppSpacing.md.height,
        vPeriodicAttendanceTable(),
      ],
    );
  }

  static vPeriodicAttendanceTopbar() {
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
              AppSpacing.md.height,
              vPeriodicAttendanceFilter(),
            ],
          ),
        ),
      ],
    );
  }

  static vPeriodicAttendanceFilter() {
    return Column(
      // crossAxisCount: 2,
      children: [
        ///Attandence Date Part
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Attendance Date : ",
              style: kBody.copyWith(color: AppColor.kWhite),
            ),
            (AppSpacing.sm).height,
            Container(
              height: 28,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: .5),
                  color: AppColor.frenchSkyBlue100,
                  borderRadius: BorderRadius.circular(4)),
              child: GestureDetector(
                onTap: () => _controller.mSelectDateFrom(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      size: 16,
                      color: AppColor.kGray100,
                    ),
                    (AppSpacing.sm).width,
                    Obx(() => Text(
                          _controller.mGetFormatDate(_controller.endDate),
                          style: kBody.copyWith(
                              fontWeight: FontWeight.w500, color: Colors.black),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
        (AppSpacing.md).height,

        ///Attendance Status Part
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* Text(
              "Sort by : ",
              style: kBody.copyWith(color: AppColor.kWhite),
            ), */
            // (AppSpacing.sm).height,
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: true,
                        onChanged: (value) {},
                        activeColor: AppColor.green,
                      ),
                      Text(
                        "Present",
                        style: kBody.copyWith(color: AppColor.kWhite),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                        activeColor: AppColor.green,
                      ),
                      Text(
                        "Leave",
                        style: kBody.copyWith(color: AppColor.kWhite),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                        activeColor: AppColor.green,
                      ),
                      Text(
                        "Absent",
                        style: kBody.copyWith(color: AppColor.kWhite),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  static vPeriodicAttendanceTable() {
    double cellVerMargin = 8;
    double cellHorMargin = 16;
    List dummyList = [
      "Anamika Roy",
      "Rafi Islam",
      "Ankit Tewari",
      "Anamika Roy",
      "Rafi Islam",
      "Ankit Tewari",
      "Anamika Roy",
    ];
    return /*  Obx(() => */ Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ClipRRect(
                  // borderRadius: BorderRadius.circular(12),
                  child: Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: IntrinsicColumnWidth(),
                  1: IntrinsicColumnWidth(),
                  2: IntrinsicColumnWidth(),
                  3: IntrinsicColumnWidth(),
                  4: IntrinsicColumnWidth(),
                  5: IntrinsicColumnWidth(),
                  6: IntrinsicColumnWidth(),
                  7: IntrinsicColumnWidth(),
                  8: IntrinsicColumnWidth(),
                  9: IntrinsicColumnWidth(),
                  10: IntrinsicColumnWidth(),
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
                          ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Status',
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
                            'Phone(sms)',
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
                            'SMS',
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
                            'In',
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
                            'Out',
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
                            'Time',
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
                            'Late Status',
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
                            'Updated At',
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
                  // for (var item in _controller.userInfoModelList) // correct

                  for (var item in dummyList)
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
                            Container(
                              padding: const EdgeInsets.all(12),
                              color: dummyList.indexOf(item) % 2 == 1
                                  ? AppColor.red
                                  : Colors.transparent,
                              child: Text(
                                // _controller.mGetFormatDate(item.date),
                                dummyList.indexOf(item).toString(),
                                style: kBody.copyWith(
                                    color: dummyList.indexOf(item) % 2 == 1
                                        ? AppColor.kWhite
                                        : Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),

                        /// Name
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                color: dummyList.indexOf(item) % 2 == 1
                                    ? AppColor.red
                                    : Colors.transparent,
                                child: Text(
                                  item,
                                  textAlign: TextAlign.start,
                                  style: kBody.copyWith(
                                      color: dummyList.indexOf(item) % 2 == 1
                                          ? AppColor.kWhite
                                          : Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),

                        /// Roll
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                color: dummyList.indexOf(item) % 2 == 1
                                    ? AppColor.red
                                    : Colors.transparent,
                                child: Text(
                                  "101",
                                  textAlign: TextAlign.start,
                                  style: kBody.copyWith(
                                      color: dummyList.indexOf(item) % 2 == 1
                                          ? AppColor.kWhite
                                          : Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                color: dummyList.indexOf(item) % 2 == 1
                                    ? AppColor.red
                                    : Colors.transparent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 14,
                                          width: 14,
                                          decoration: BoxDecoration(
                                              color: AppColor.white,
                                              border: Border.all(
                                                  color: Colors.black12),
                                              boxShadow: const [
                                                BoxShadow(
                                                    offset: Offset(.5, .5),
                                                    color: Colors.black12,
                                                    blurRadius: 1)
                                              ]),
                                        ),
                                        AppSpacing.sm.width,
                                        Text(
                                          dummyList.indexOf(item) % 2 == 1
                                              ? "Absent"
                                              : "Present",
                                          style: kBody.copyWith(
                                            color:
                                                dummyList.indexOf(item) % 2 == 1
                                                    ? AppColor.kWhite
                                                    : Colors.black,
                                          ),
                                        ),
                                      ],
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
                                padding: const EdgeInsets.all(12),
                                color: dummyList.indexOf(item) % 2 == 1
                                    ? AppColor.red
                                    : Colors.transparent,
                                child: Row(
                                  children: [
                                    Text(
                                      "0181972373",
                                      textAlign: TextAlign.start,
                                      style: kBody.copyWith(
                                          color:
                                              dummyList.indexOf(item) % 2 == 1
                                                  ? AppColor.kWhite
                                                  : Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "(1)",
                                      textAlign: TextAlign.start,
                                      style: kBody.copyWith(
                                          color:
                                              dummyList.indexOf(item) % 2 == 1
                                                  ? AppColor.kWhite
                                                  : Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
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
                                padding: const EdgeInsets.all(10),
                                color: dummyList.indexOf(item) % 2 == 1
                                    ? AppColor.red
                                    : Colors.transparent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: dummyList.indexOf(item) % 2 == 1
                                            ? AppColor.frenchSkyBlue100
                                            : Colors.green,
                                        /* border:
                                            Border.all(color: Colors.black12), */
                                      ),
                                      child: Text(
                                        "InSMS",
                                        style: kBody.copyWith(
                                          color:
                                              dummyList.indexOf(item) % 2 == 1
                                                  ? AppColor.kBlack
                                                  : Colors.white,
                                        ),
                                      ),
                                    ),
                                    AppSpacing.sm.width,
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: AppColor.frenchSkyBlue100,
                                        /* border:
                                            Border.all(color: Colors.black12), */
                                      ),
                                      child: Text("OutSMS"),
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
                                padding: const EdgeInsets.all(12),
                                color: dummyList.indexOf(item) % 2 == 1
                                    ? AppColor.red
                                    : Colors.transparent,
                                child: Text(
                                  "10:11 AM",
                                  textAlign: TextAlign.start,
                                  style: kBody.copyWith(
                                      color: dummyList.indexOf(item) % 2 == 1
                                          ? AppColor.kWhite
                                          : Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
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
                                padding: const EdgeInsets.all(12),
                                color: dummyList.indexOf(item) % 2 == 1
                                    ? AppColor.red
                                    : Colors.transparent,
                                child: Text(
                                  "12:12 PM",
                                  textAlign: TextAlign.start,
                                  style: kBody.copyWith(
                                      color: dummyList.indexOf(item) % 2 == 1
                                          ? AppColor.kWhite
                                          : Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
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
                                padding: const EdgeInsets.all(12),
                                color: dummyList.indexOf(item) % 2 == 1
                                    ? AppColor.red
                                    : Colors.transparent,
                                child: Text(
                                  "2 hrs 6 mins",
                                  textAlign: TextAlign.start,
                                  style: kBody.copyWith(
                                      color: dummyList.indexOf(item) % 2 == 1
                                          ? AppColor.kWhite
                                          : Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
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
                                padding: const EdgeInsets.all(12),
                                color: dummyList.indexOf(item) % 2 == 1
                                    ? AppColor.red
                                    : Colors.transparent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 14,
                                          width: 14,
                                          decoration: BoxDecoration(
                                              color:
                                                  dummyList.indexOf(item) % 2 ==
                                                          1
                                                      ? AppColor.white
                                                      : Colors.red,
                                              border: Border.all(
                                                  color: Colors.black12),
                                              boxShadow: const [
                                                BoxShadow(
                                                    offset: Offset(.5, .5),
                                                    color: Colors.black12,
                                                    blurRadius: 1)
                                              ]),
                                        ),
                                        AppSpacing.sm.width,
                                        Text(
                                          dummyList.indexOf(item) % 2 == 1
                                              ? "In Time"
                                              : "Late",
                                          style: kBody.copyWith(
                                            color:
                                                dummyList.indexOf(item) % 2 == 1
                                                    ? AppColor.kWhite
                                                    : Colors.black,
                                          ),
                                        ),
                                      ],
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
                                padding: const EdgeInsets.all(12),
                                color: dummyList.indexOf(item) % 2 == 1
                                    ? AppColor.red
                                    : Colors.transparent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 16,
                                      height: 16,
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
      ),
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
}
