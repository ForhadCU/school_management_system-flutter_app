import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/TEACHER/leave/leave_controller.dart';
import 'package:school_management_system/Model/TEACHER/leave/leave_balance_list_model.dart';
import 'package:school_management_system/Model/TEACHER/leave/leave_type_and_category_model.dart';
import 'package:school_management_system/Singletones/app_data.dart';
import 'package:school_management_system/Utils/custom_utils.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';
import 'package:school_management_system/Views/test/dummy_model.dart';
import '../../../Config/config.dart';
import '../../Widgets/buttons.dart';
import '../../Widgets/custom_container.dart';

class TeachLeave extends GetView<TeachLeaveController> {
  const TeachLeave({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Leave",
        child: BaseWidgetChild(
          child: SingleChildScrollView(
            child: Column(
              children: [
                vTabBar(),
                /*  Divider(
                  color: Colors.black26,
                  thickness: .8,
                ), */
                Obx(() => controller.isLeaveApplicationActive.value
                    ? vLeaveApplicationBody()
                    : vLeaveBalanceBody()),
              ],
            ),
          ),
        ));
  }

  vTabBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// tab buttons
        Obx(() => Row(
              children: [
                Expanded(
                  child: CommonContainers.vTabItemContainer(
                      text: "Leave Application",
                      isActive: controller.isLeaveApplicationActive.value,
                      onTap: () {
                        controller.mUpdateLeaveApplicationTabItem();
                      }),
                ),
                (AppSpacing.smh / 2).width,
                Expanded(
                    child: CommonContainers.vTabItemContainer(
                  text: "Leave Balance",
                  isActive: controller.isLeaveBalanceActive.value,
                  onTap: () {
                    controller.mUpdateLeaveBalanceTabItem();
                  },
                )),
              ],
            )),
/* 
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
              /*  _vDropdowns(),
              AppSpacing.xl.height,
              _vGetResultBtn(), */
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
        ) */ */
      ],
    );
  }

  vLeaveApplicationBody() {
    return Column(
      children: [
        vLeaveApplicationForm(),
        const Divider(
          color: Colors.black38,
          thickness: .8,
        ),
        vLeaveApplicationSearch(),
        AppSpacing.sm.height,
        Obx(() => controller.leaveAppSearchResultList.isNotEmpty
            ? vLeaveApplicatinTable()
            : Container())
      ],
    );
  }

  vLeaveBalanceSearch() {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
        padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.sm, horizontal: AppSpacing.sm),
        decoration: const BoxDecoration(
            // borderRadius: BorderRadius.circular(8),
            color: AppColor.activeTab),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _vLeaveBalanceSearchFilteringFields(),
            Obx(
              () => Visibility(
                visible: controller.isApplyApplicationBtn.value,
                child: Column(
                  children: [
                    AppSpacing.md.height,
                    SizedBox(
                      width: AppScreenSize.mGetWidth(kGlobContext, 50),
                      child: _vLeaveBalanceSearchBtn(),
                    ),
                    AppSpacing.smh.height,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ]);
  }

  vLeaveBalanceBody() {
    return Column(
      children: [
        vLeaveBalanceSearch(),
        AppSpacing.sm.height,
        Obx(() => controller.leaveBalanceSearchResultList.isNotEmpty
            ? vLeaveBalanceTable()
            : Container())
      ],
    );
  }

  vLeaveApplicationForm() {
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
              _vFormFields(),
              Obx(
                () => Visibility(
                  visible: controller.isApplyApplicationBtn.value,
                  child: Column(
                    children: [
                      AppSpacing.md.height,
                      SizedBox(
                        width: AppScreenSize.mGetWidth(kGlobContext, 50),
                        child: _vApplyApplicationBtn(),
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

  vLeaveApplicationSearch() {
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
              _vLeaveAppSearchFilteringFields(),
              Obx(
                () => Visibility(
                  visible: controller.isApplyApplicationBtn.value,
                  child: Column(
                    children: [
                      AppSpacing.md.height,
                      SizedBox(
                        width: AppScreenSize.mGetWidth(kGlobContext, 50),
                        child: _vLeaveAppSearchBtn(),
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

  vLeaveApplicatinTable() {
    double cellVerMargin = 8;
    double cellHorMargin = 16;
    return Column(
      children: [
        _vPlainBox(
          boxBg: AppColor.white,
          child: const Text(
            "Search results",
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
                // width: AppScreenSize.mGetWidth(kGlobContext, 100),
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
                              'SL',
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
                              'Type',
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
                              'Category',
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
                              'From Date',
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
                              'To Date',
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
                              'Status',
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
                    for (var item in controller.leaveAppSearchResultList)
                      TableRow(
                        // table decoration
                        decoration: BoxDecoration(
                            // color: AppColor.secondaryColor.withOpacity(.4),
                            color: controller.leaveAppSearchResultList
                                            .indexOf(item) %
                                        2 ==
                                    0
                                ? AppColor.secondaryColor.withOpacity(.4)
                                : AppColor.secondaryColor.withOpacity(.2)),
                        children: <Widget>[
                          /// SL
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                (controller.leaveAppSearchResultList
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

                          /// Leave Type
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  item
                                      .siteEmployeeLeaveGenerate!
                                      .siteLeavePolicy!
                                      .academicLeaveType!
                                      .name!,
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

                          /// Leave Category
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  item
                                      .siteEmployeeLeaveGenerate!
                                      .siteLeavePolicy!
                                      .academicLeaveCategory!
                                      .name
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

                          /// From Date
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  Utils().getFormatedDateTime(
                                      item.fromDate.toString(), kAppDateFormat),
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

                          /// To Date
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  Utils().getFormatedDateTime(
                                      item.toDate.toString(), kAppDateFormat),
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

                          /// Status
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  item.leaveStatus ?? "",
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

  vLeaveBalanceTable() {
    double cellVerMargin = 8;
    double cellHorMargin = 16;
    return Column(
      children: [
        _vPlainBox(
          boxBg: AppColor.white,
          child: const Text(
            "Search results",
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
                // width: AppScreenSize.mGetWidth(kGlobContext, 100),
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
                              'SL',
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
                              'Leave Type',
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
                              'Leave Category',
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
                              'Total Days',
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
                              'Spend Days',
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
                              'Remaining Days',
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
                    for (var item in controller.leaveBalanceSearchResultList)
                      TableRow(
                        // table decoration
                        decoration: BoxDecoration(
                            // color: AppColor.secondaryColor.withOpacity(.4),
                            color: controller.leaveBalanceSearchResultList
                                            .indexOf(item) %
                                        2 ==
                                    0
                                ? AppColor.secondaryColor.withOpacity(.4)
                                : AppColor.secondaryColor.withOpacity(.2)),
                        children: <Widget>[
                          /// SL
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                (controller.leaveBalanceSearchResultList
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

                          /// Leave Type
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  item.leaveType ?? "",
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

                          /// Leave Category
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  item.leaveCategory ?? "",
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

                          /// Total Days
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  item.totalDays.toString(),
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

                          /// Spend Days
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  item.spendDays.toString(),
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

                          /// Remaining Days
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  item.remainingDays.toString(),
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

  _vApplyApplicationBtn() {
    return AppButtons.vPrimaryButtonWithGradient(
      bg: AppColor.green,
      bgGradient: AppColor.kDonwloadBtnGradiantColor,
      onTap: () async {
        await controller.mSubmitLeaveApplication();
      },
      text: "Apply",
    );
  }

  _vLeaveAppSearchBtn() {
    return AppButtons.vPrimaryButtonWithGradient(
      /*   bg: AppColor.green,
      bgGradient: AppColor.kDonwloadBtnGradiantColor, */
      onTap: () async {
        await controller.mGetLeaveHistory();
      },
      text: "Search",
    );
  }

  _vFormFields() {
    // kLog(
    //     "Called vDropdonws1: ${controller.academicYearList.length}  ${controller.selectedAcademicYear.value.yearName}  ");

    return Column(
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
                      return DropdownButton<LeaveTypeAndCategoryModel>(
                        value:
                            controller.selectedLeaveApplyLeaveTypeModel.value,
                        hint: Text(
                          "Select Leave Type*",
                          style: kBody.copyWith(color: Colors.black),
                          /* 
                              controller.canContinue.value
                                  ? "Select School"
                                  : "No School",
                              style: kBody.copyWith(color: Colors.black),
                            */
                        ),
                        iconEnabledColor: Colors.black54,
                        iconDisabledColor: Colors.black54,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 12,
                        elevation: 10,
                        // style: kBody.copyWith(fontWeight: FontWeight.w500),
                        // focusColor: AppColor.white,
                        dropdownColor: AppColor.frenchSkyBlue100,
                        isDense: true,
                        isExpanded: true,
                        underline: Container(),
                        onChanged: (LeaveTypeAndCategoryModel? selectedModel) {
                          controller
                              .mUpdateLeaveApplyLeaveTyperopDown(selectedModel);
                        },

                        items: controller.leaveApplyLeaveTypeModelList
                            .map((LeaveTypeAndCategoryModel value) {
                          return DropdownMenuItem<LeaveTypeAndCategoryModel>(
                            value: value,
                            child: Text(
                              value.name ?? "",
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
        AppSpacing.sm.height,
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
                      return DropdownButton<LeaveTypeAndCategoryModel>(
                        value: controller
                            .selectedLeaveApplyLeaveCategoryModel.value,
                        hint: Text(
                          "Select Leave Category*",
                          style: kBody.copyWith(color: Colors.black),

                          /* 
                              controller.canContinue.value
                                  ? "Select School"
                                  : "No School",
                              style: kBody.copyWith(color: Colors.black),
                            */
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
                        onChanged: (LeaveTypeAndCategoryModel? selectedModel) {
                          controller
                              .mUpdateLeaveApplyLeaveCategoryDropdownDropDown(
                                  selectedModel);
                        },

                        items: controller.leaveApplyLeaveCategoryModelList
                            .map((LeaveTypeAndCategoryModel value) {
                          return DropdownMenuItem<LeaveTypeAndCategoryModel>(
                            value: value,
                            child: Text(
                              value.name ?? "",
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
        AppSpacing.sm.height,
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                color: AppColor.frenchSkyBlue100,
                child: InkWell(
                  onTap: () async {
                    DateTimeRange? dateTimeRange = await showDateRangePicker(
                        context: kGlobContext,
                        firstDate: DateTime.now(),
                        lastDate:
                            DateTime.now().add(const Duration(days: 365)));
                    controller.UpdateLeaveApplyDateRange(dateTimeRange);
                  },
                  child: Text(
                    controller.leaveApplyFormatedDateRange.value,
                    style: kBody.copyWith(color: Colors.black),
                  ),
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
                color: AppColor.frenchSkyBlue100,
                child: TextFormField(
                  controller: controller.leaveApplyReasonEditTextCtrlr,
                  style: kBody.copyWith(color: Colors.black),
                  maxLines: 5,
                  decoration: InputDecoration(
                      isDense: true,
                      hintText: "Write reason in short",
                      hintStyle: kBody.copyWith(color: Colors.black54),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _vLeaveAppSearchFilteringFields() {
    return Column(
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
                      return DropdownButton<DummyValueModel>(
                        value: controller.selectedDummyValueModel.value,
                        hint: Text(
                          "1S",
                          style: kBody.copyWith(color: Colors.black),
                          /* 
                              controller.canContinue.value
                                  ? "Select School"
                                  : "No School",
                              style: kBody.copyWith(color: Colors.black),
                            */
                        ),
                        iconEnabledColor: Colors.black54,
                        iconDisabledColor: Colors.black54,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 12,
                        elevation: 10,
                        // style: kBody.copyWith(fontWeight: FontWeight.w500),
                        // focusColor: AppColor.white,
                        dropdownColor: AppColor.frenchSkyBlue100,
                        isDense: true,
                        isExpanded: true,
                        underline: Container(),
                        onChanged: (DummyValueModel? selectedModel) {
                          controller.mUpdateDummyValueModel(selectedModel);
                        },

                        items: controller.dummyValueModelList
                            .map((DummyValueModel value) {
                          return DropdownMenuItem<DummyValueModel>(
                            value: value,
                            child: Text(
                              value.name ?? "",
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
        AppSpacing.sm.height,
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
                      return DropdownButton<LeaveTypeAndCategoryModel>(
                        value: controller
                            .selectedLeaveAppSearchLeaveTypeModel.value,
                        hint: Text(
                          "Select Leave Type*",
                          style: kBody.copyWith(color: Colors.black),
                          /* 
                              controller.canContinue.value
                                  ? "Select School"
                                  : "No School",
                              style: kBody.copyWith(color: Colors.black),
                            */
                        ),
                        iconEnabledColor: Colors.black54,
                        iconDisabledColor: Colors.black54,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 12,
                        elevation: 10,
                        // style: kBody.copyWith(fontWeight: FontWeight.w500),
                        // focusColor: AppColor.white,
                        dropdownColor: AppColor.frenchSkyBlue100,
                        isDense: true,
                        isExpanded: true,
                        underline: Container(),
                        onChanged: (LeaveTypeAndCategoryModel? selectedModel) {
                          controller
                              .mUpdateLeaveAppSearchTypeDropDown(selectedModel);
                        },

                        items: controller.leaveAppSearchLeaveTypeModelList
                            .map((LeaveTypeAndCategoryModel value) {
                          return DropdownMenuItem<LeaveTypeAndCategoryModel>(
                            value: value,
                            child: Text(
                              value.name ?? "",
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
        AppSpacing.sm.height,
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
                      return DropdownButton<LeaveTypeAndCategoryModel>(
                        value: controller
                            .selectedLeaveAppSearchLeaveCategoryModel.value,
                        hint: Text(
                          "Select Leave Category*",
                          style: kBody.copyWith(color: Colors.black),
                          /* 
                              controller.canContinue.value
                                  ? "Select School"
                                  : "No School",
                              style: kBody.copyWith(color: Colors.black),
                            */
                        ),
                        iconEnabledColor: Colors.black54,
                        iconDisabledColor: Colors.black54,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 12,
                        elevation: 10,
                        // style: kBody.copyWith(fontWeight: FontWeight.w500),
                        // focusColor: AppColor.white,
                        dropdownColor: AppColor.frenchSkyBlue100,
                        isDense: true,
                        isExpanded: true,
                        underline: Container(),
                        onChanged: (LeaveTypeAndCategoryModel? selectedModel) {
                          controller.mUpdateLeaveAppSearchCategoryDropDown(
                              selectedModel);
                        },

                        items: controller.leaveAppSearchLeaveCategoryModelList
                            .map((LeaveTypeAndCategoryModel value) {
                          return DropdownMenuItem<LeaveTypeAndCategoryModel>(
                            value: value,
                            child: Text(
                              value.name ?? "",
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
        AppSpacing.sm.height,
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                color: AppColor.frenchSkyBlue100,
                child: InkWell(
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: kGlobContext,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(Duration(days: 630)),
                      lastDate: DateTime.now().add(Duration(days: 630)),
                    );
                    controller.mUpdateleaveAppSearchStartDate(selectedDate);
                  },
                  child: Text(
                    controller.leaveAppSearchFormatedStartDate.value,
                    style: kBody.copyWith(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _vLeaveBalanceSearchFilteringFields() {
    return Column(
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
                      return DropdownButton<DummyValueModel>(
                        value: controller.selectedDummyValueModel.value,
                        hint: Text(
                          "1S",
                          style: kBody.copyWith(color: Colors.black),
                          /* 
                              controller.canContinue.value
                                  ? "Select School"
                                  : "No School",
                              style: kBody.copyWith(color: Colors.black),
                            */
                        ),
                        iconEnabledColor: Colors.black54,
                        iconDisabledColor: Colors.black54,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 12,
                        elevation: 10,
                        // style: kBody.copyWith(fontWeight: FontWeight.w500),
                        // focusColor: AppColor.white,
                        dropdownColor: AppColor.frenchSkyBlue100,
                        isDense: true,
                        isExpanded: true,
                        underline: Container(),
                        onChanged: (DummyValueModel? selectedModel) {
                          controller.mUpdateDummyValueModel(selectedModel);
                        },

                        items: controller.dummyValueModelList
                            .map((DummyValueModel value) {
                          return DropdownMenuItem<DummyValueModel>(
                            value: value,
                            child: Text(
                              value.name ?? "",
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
        AppSpacing.sm.height,
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
                      return DropdownButton<LeaveTypeAndCategoryModel>(
                        value: controller
                            .selectedLeaveBalanceSearchLeaveTypeModel.value,
                        hint: Text(
                          "Select Leave Type*",
                          style: kBody.copyWith(color: Colors.black),
                          /* 
                              controller.canContinue.value
                                  ? "Select School"
                                  : "No School",
                              style: kBody.copyWith(color: Colors.black),
                            */
                        ),
                        iconEnabledColor: Colors.black54,
                        iconDisabledColor: Colors.black54,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 12,
                        elevation: 10,
                        // style: kBody.copyWith(fontWeight: FontWeight.w500),
                        // focusColor: AppColor.white,
                        dropdownColor: AppColor.frenchSkyBlue100,
                        isDense: true,
                        isExpanded: true,
                        underline: Container(),
                        onChanged: (LeaveTypeAndCategoryModel? selectedModel) {
                          controller.mUpdateLeaveBalanceLeaveTypeDropdown(
                              selectedModel);
                        },

                        items: controller.leaveBalanceSearchLeaveTypeModelList
                            .map((LeaveTypeAndCategoryModel value) {
                          return DropdownMenuItem<LeaveTypeAndCategoryModel>(
                            value: value,
                            child: Text(
                              value.name ?? "",
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
        AppSpacing.sm.height,
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
                      return DropdownButton<LeaveTypeAndCategoryModel>(
                        value: controller
                            .selectedLeaveBalanceSearchLeaveCategoryModel.value,
                        hint: Text(
                          "Select Leave Category*",
                          style: kBody.copyWith(color: Colors.black),
                          /* 
                              controller.canContinue.value
                                  ? "Select School"
                                  : "No School",
                              style: kBody.copyWith(color: Colors.black),
                            */
                        ),
                        iconEnabledColor: Colors.black54,
                        iconDisabledColor: Colors.black54,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 12,
                        elevation: 10,
                        // style: kBody.copyWith(fontWeight: FontWeight.w500),
                        // focusColor: AppColor.white,
                        dropdownColor: AppColor.frenchSkyBlue100,
                        isDense: true,
                        isExpanded: true,
                        underline: Container(),
                        onChanged: (LeaveTypeAndCategoryModel? selectedModel) {
                          controller.mUpdateLeaveBalanceLeaveCategoryDropdown(
                              selectedModel);
                        },

                        items: controller
                            .leaveBalanceSearchLeaveCategoryModelList
                            .map((LeaveTypeAndCategoryModel value) {
                          return DropdownMenuItem<LeaveTypeAndCategoryModel>(
                            value: value,
                            child: Text(
                              value.name ?? "",
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
      ],
    );
  }

  _vLeaveBalanceSearchBtn() {
    return AppButtons.vPrimaryButtonWithGradient(
      /*   bg: AppColor.green,
      bgGradient: AppColor.kDonwloadBtnGradiantColor, */
      onTap: () async {
        await controller.mGetLeaveBalance();
      },
      text: "Search",
    );
  }
}
