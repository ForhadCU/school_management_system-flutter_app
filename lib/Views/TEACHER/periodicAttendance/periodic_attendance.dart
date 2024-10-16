import 'package:flutter/material.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../Config/config.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/TEACHER/periodicAttnd/periodic_attnd_ctrlr.dart';
import 'package:school_management_system/Model/TEACHER/period_model.dart';
import 'package:school_management_system/Utils/custom_utils.dart';

import '../../Widgets/buttons.dart';

class TeachPeriodicAttendance
    extends GetView<TeachPeriodicAttendanceController> {
  const TeachPeriodicAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Periodic Attendance",
        child: BaseWidgetChild(
            child: Column(
          children: [
            vPeriodicAttendanceTopbar(),
            // AppSpacing.md.height,
            const Divider(height: 1, thickness: .5, color: Colors.black12),
            // AppSpacing.md.height,
            vPeriodicAttendanceTable(),
            vUpdateAttendanceBtn(),
          ],
        )));
  }

  vPeriodicAttendanceTopbar() {
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
              AppSpacing.md.height,
              vPeriodicAttendanceFilter(),
            ],
          ),
        ),
      ],
    );
  }

  vPeriodicAttendanceFilter() {
    return Column(
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
                onTap: () async => {
                  controller.mSelectDateFrom(),
                },
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
                          controller.mGetFormatDate(controller.attendanceDate),
                          style: kBody.copyWith(
                              fontWeight: FontWeight.w500, color: Colors.black),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
        (AppSpacing.sm).height,

        ///Attendance Status Part
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Obx(() => Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: controller.presentStatus.value,
                            onChanged: (value) {
                              controller.mModifiedPresentStatus(value);
                            },
                            activeColor: AppColor.green,
                          )),
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
                      Obx(() => Checkbox(
                            value: controller.leaveStatus.value,
                            onChanged: (value) {
                              controller.mModifiedLeaveStatus(value);
                            },
                            activeColor: AppColor.green,
                          )),
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
                      Obx(() => Checkbox(
                            value: controller.absenttStatus.value,
                            onChanged: (value) {
                              controller.mModifiedAbsentStatus(value);
                            },
                            activeColor: AppColor.green,
                          )),
                      Text(
                        "Absent",
                        style: kBody.copyWith(color: AppColor.kWhite),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AppSpacing.sm.height,
            vGetAttendanceBtn(),
          ],
        ),
      ],
    );
  }

  vGetAttendanceBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: AppScreenSize.mGetWidth(kGlobContext, 50),
          child: AppButtons.vPrimaryButtonWithGradient(
            onTap: () async {
              // await controller.mGetAttendanceInRange();
              controller.mResetList();
              await controller.mGetPeriodicAttendanceModel();
            },
            text: "Get",
          ),
        ),
      ],
    );
  }

  vUpdateAttendanceBtn() {
    return Obx(() => Visibility(
          visible: controller.isAttendanceModified.value,
          child: Column(
            children: [
              AppSpacing.sm.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: AppButtons.vUpdateButton(
                      onTap: () async {
                        await controller.mSavePeriodicAttendance();
                      },
                      text: "Save",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  vPeriodicAttendanceTable() {
    double cellVerMargin = 10;
    double cellHorMargin = 12;
    /*  List controller.periodicAttendanceDataList = [
      "Anamika Roy",
      "Rafi Islam",
      "Ankit Tewari",
      "Anamika Roy",
      "Rafi Islam",
      "Ankit Tewari",
      "Anamika Roy",
    ]; */
    return Obx(
      () => Expanded(
          child: controller.periodicAttendanceDataList.isEmpty
              ? Container(
                  /* 
            alignment: Alignment.center,
            child: Text(
              "Not found!",
              style: kBody.copyWith(color: Colors.amber),
            ),
          */
                  )
              : SingleChildScrollView(
                  controller: controller.scrollCtrlr.value,
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
                                      // 'Phone(sms)',
                                      'Phone',
                                      style: kBody.copyWith(
                                          color: AppColor.white,
                                          fontWeight: FontWeight.w500),
                                    ).marginSymmetric(
                                        vertical: cellVerMargin,
                                        horizontal: cellHorMargin),
                                  ],
                                ),
                                /*  Row(
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
                              ), */
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
                                /*  Row(
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
                              ), */
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
                                /*  Row(
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
                                ), */
                              ],
                            ),
                            // for (var item in controller.userInfoModelList) // correct

                            for (var item
                                in controller.periodicAttendanceDataList)
                              TableRow(
                                // table decoration
                                decoration: BoxDecoration(
                                  color:
                                      AppColor.secondaryColor.withOpacity(.4),
                                  /*  _feeDetailsModel!.feeAllocationDetails!
                                          .indexOf(item) %
                                      2 ==
                                  0
                              ? AppColor.secondaryColor.withOpacity(.4)
                              : AppColor.secondaryColor.withOpacity(.2) */
                                ),
                                children: <Widget>[
                                  /// #
                                  GestureDetector(
                                    onTap: () {
                                      controller.mUpdateAttendanceList(item);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.all(12),
                                            color: item.present != 1
                                                ? AppColor.red
                                                : Colors.transparent,
                                            child: Text(
                                              // controller.mGetFormatDate(item.date),
                                              (controller.periodicAttendanceDataList
                                                          .indexOf(item) +
                                                      1)
                                                  .toString(),
                                              style: kBody.copyWith(
                                                  color: item.present != 1
                                                      ? AppColor.kWhite
                                                      : Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ).marginSymmetric(
                                                vertical: cellVerMargin,
                                                horizontal: cellHorMargin),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  /// Name
                                  GestureDetector(
                                    onTap: () {
                                      controller.mUpdateAttendanceList(item);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.all(12),
                                            color: item.present != 1
                                                ? AppColor.red
                                                : Colors.transparent,
                                            child: Text(
                                              item.fullName ?? "",
                                              textAlign: TextAlign.start,
                                              style: kBody.copyWith(
                                                  color: item.present != 1
                                                      ? AppColor.kWhite
                                                      : Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ).marginSymmetric(
                                                vertical: cellVerMargin,
                                                horizontal: cellHorMargin),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  /// Roll
                                  GestureDetector(
                                    onTap: () {
                                      controller.mUpdateAttendanceList(item);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.all(12),
                                            color: item.present != 1
                                                ? AppColor.red
                                                : Colors.transparent,
                                            child: Text(
                                              item.studentRollNumber ?? "",
                                              textAlign: TextAlign.start,
                                              style: kBody.copyWith(
                                                  color: item.present != 1
                                                      ? AppColor.kWhite
                                                      : Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ).marginSymmetric(
                                                vertical: cellVerMargin,
                                                horizontal: cellHorMargin),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  GestureDetector(
                                    onTap: () {
                                      controller.mUpdateAttendanceList(item);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.all(12),
                                            color: item.present != 1
                                                ? AppColor.red
                                                : Colors.transparent,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 14,
                                                      width: 14,
                                                      decoration: BoxDecoration(
                                                          color: item.present !=
                                                                  1
                                                              ? AppColor.white
                                                              : AppColor.green,
                                                          border: Border.all(
                                                              color: Colors
                                                                  .black12),
                                                          boxShadow: const [
                                                            BoxShadow(
                                                                offset: Offset(
                                                                    .5, .5),
                                                                color: Colors
                                                                    .black12,
                                                                blurRadius: 1)
                                                          ]),
                                                    ),
                                                    AppSpacing.sm.width,
                                                    Text(
                                                      item.present != 1
                                                          ? "Absent"
                                                          : "Present",
                                                      style: kBody.copyWith(
                                                        color: item.present != 1
                                                            ? AppColor.kWhite
                                                            : Colors.black,
                                                      ),
                                                    ).marginSymmetric(
                                                        vertical: cellVerMargin,
                                                        horizontal:
                                                            cellHorMargin),
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
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(12),
                                          color: item.present != 1
                                              ? AppColor.red
                                              : Colors.transparent,
                                          child: Row(
                                            children: [
                                              Text(
                                                item.contactNumber ?? "",
                                                textAlign: TextAlign.start,
                                                style: kBody.copyWith(
                                                    color: item.present != 1
                                                        ? AppColor.kWhite
                                                        : Colors.black,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ).marginSymmetric(
                                                  vertical: cellVerMargin,
                                                  horizontal: cellHorMargin),
                                              /*  Text(
                                              "(1)",
                                              textAlign: TextAlign.start,
                                              style: kBody.copyWith(
                                                  color:
                                                      controller.periodicAttendanceDataList.indexOf(item) %
                                                                  2 ==
                                                              1
                                                          ? AppColor.kWhite
                                                          : Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ), */
                                            ],
                                          ),
                                        ),
                                      ) /* .marginSymmetric(
                                vertical: cellVerMargin,
                                horizontal: cellHorMargin) */
                                      ,
                                    ],
                                  ),

                                  /// SMS
                                  /* Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        color: controller.periodicAttendanceDataList.indexOf(item) % 2 == 1
                                            ? AppColor.red
                                            : Colors.transparent,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4, vertical: 2),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                color: controller.periodicAttendanceDataList.indexOf(item) %
                                                            2 ==
                                                        1
                                                    ? AppColor.frenchSkyBlue100
                                                    : Colors.green,
                                                /* border:
                                            Border.all(color: Colors.black12), */
                                              ),
                                              child: Text(
                                                "InSMS",
                                                style: kBody.copyWith(
                                                  color:
                                                      controller.periodicAttendanceDataList.indexOf(item) %
                                                                  2 ==
                                                              1
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
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                color:
                                                    AppColor.frenchSkyBlue100,
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
                                ), */

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(12),
                                          color: item.present != 1
                                              ? AppColor.red
                                              : Colors.transparent,
                                          child: Text(
                                            item.inTime ?? "",
                                            textAlign: TextAlign.start,
                                            style: kBody.copyWith(
                                                color: item.present != 1
                                                    ? AppColor.kWhite
                                                    : Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ).marginSymmetric(
                                              vertical: cellVerMargin,
                                              horizontal: cellHorMargin),
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
                                          color: item.present != 1
                                              ? AppColor.red
                                              : Colors.transparent,
                                          child: Text(
                                            item.outTime ?? "",
                                            textAlign: TextAlign.start,
                                            style: kBody.copyWith(
                                                color: item.present != 1
                                                    ? AppColor.kWhite
                                                    : Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ).marginSymmetric(
                                              vertical: cellVerMargin,
                                              horizontal: cellHorMargin),
                                        ),
                                      ) /* .marginSymmetric(
                                vertical: cellVerMargin,
                                horizontal: cellHorMargin) */
                                      ,
                                    ],
                                  ),

                                  /* Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        color: item.present != 1
                                            ? AppColor.red
                                            : Colors.transparent,
                                        child: Text(
                                          "2 hrs 6 mins",
                                          textAlign: TextAlign.start,
                                          style: kBody.copyWith(
                                              color: item.present != 1
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
                                ), */

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(12),
                                          color: item.present != 1
                                              ? AppColor.red
                                              : Colors.transparent,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 14,
                                                    width: 14,
                                                    decoration: BoxDecoration(
                                                        color: item.lateStatus ==
                                                                    false ||
                                                                item.lateStatus == 0
                                                            ? AppColor.white
                                                            : const Color.fromARGB(255, 194, 29, 17),
                                                        border: Border.all(color: Colors.black12),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                              offset: Offset(
                                                                  .5, .5),
                                                              color: Colors
                                                                  .black12,
                                                              blurRadius: 1)
                                                        ]),
                                                  ),
                                                  AppSpacing.sm.width,
                                                  Text(
                                                    item.lateStatus == false ||
                                                            item.lateStatus == 0
                                                        ? "In Time"
                                                        : "Late",
                                                    style: kBody.copyWith(
                                                      color: item.present != 1
                                                          ? AppColor.kWhite
                                                          : Colors.black,
                                                    ),
                                                  ).marginSymmetric(
                                                      vertical: cellVerMargin,
                                                      horizontal:
                                                          cellHorMargin),
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

                                  /*  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(12),
                                          color: item.present != 1
                                              ? AppColor.red
                                              : Colors.transparent,
                                          child: Text(
                                            item.updatedAt != null
                                                ? Utils().getTimeFromTimeStamp(
                                                    item.updatedAt,
                                                    kAppDateFormat)
                                                : "",
                                            textAlign: TextAlign.start,
                                            style: kBody.copyWith(
                                                color: item.present != 1
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
                                  ), */
                                ],
                              ),
                          ],
                        )),
                      ),
                    ],
                  ),
                )),
    );
  }

  _vDropdowns1() {
    return Obx(() => Column(
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
                    child: DropdownButton<PeriodData>(
                      value: controller.selectedPeriodData.value,
                      hint: Text(
                        controller.periodDataList.isNotEmpty
                            ? "Select Period"
                            : "No Period",
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
                      //   controller.mUpdateSelectedStuHistory(selectedModel);
                      // },
                      onChanged: (PeriodData? selectedModel) {
                        controller.mUpdateSelectedPeriodicData(selectedModel);
                      },
                      items: controller.periodDataList.map((PeriodData value) {
                        return DropdownMenuItem<PeriodData>(
                          value: value,
                          child: Text(
                            "${value.className ?? ""} ${value.subjectName ?? ""} ${value.classTimingDetailName ?? ""}",
                            style: kBody.copyWith(
                              fontWeight: FontWeight.w400,
                              overflow: TextOverflow.ellipsis,
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
        ));
  }
}
