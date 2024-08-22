import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/TEACHER/leave/leave_controller.dart';
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
      ],
    );
  }

  vLeaveBalanceBody() {
    return Container(
      child: const Text("Balance"),
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
              _vFilteringFields(),
              Obx(
                () => Visibility(
                  visible: controller.isApplyApplicationBtn.value,
                  child: Column(
                    children: [
                      AppSpacing.md.height,
                      SizedBox(
                        width: AppScreenSize.mGetWidth(kGlobContext, 50),
                        child: _vSearchApplicationBtn(),
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

  vResultTable() {
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
                    3: IntrinsicColumnWidth(),
                    4: IntrinsicColumnWidth(),
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
                      ],
                    ),
                    for (var item in controller.dummyValueModelList)
                      TableRow(
                        // table decoration
                        decoration: BoxDecoration(
                            // color: AppColor.secondaryColor.withOpacity(.4),
                            color:
                                controller.dummyValueModelList.indexOf(item) %
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
                                item.name ?? "",
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
                                  item.name ?? "",
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
                                  item.name ?? "",
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
        // await controller.mGetPubExamResultResModel();
      },
      text: "Apply",
    );
  }

  _vSearchApplicationBtn() {
    return AppButtons.vPrimaryButtonWithGradient(
      /*   bg: AppColor.green,
      bgGradient: AppColor.kDonwloadBtnGradiantColor, */
      onTap: () async {
        // await controller.mGetPubExamResultResModel();
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
                      return DropdownButton<DummyValueModel>(
                        value: controller.selectedDummyValueModel.value,
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
                      return DropdownButton<DummyValueModel>(
                        value: controller.selectedDummyValueModel.value,
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
                    controller.UpdateLeaveAppDateRange(dateTimeRange);
                  },
                  child: Text(
                    controller.leaveAppDateRange.value,
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
                  controller: controller.leaveAppReasonEditTextCtrlr,
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

  _vFilteringFields() {
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
                      return DropdownButton<DummyValueModel>(
                        value: controller.selectedDummyValueModel.value,
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
                      return DropdownButton<DummyValueModel>(
                        value: controller.selectedDummyValueModel.value,
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
                    controller.leaveAppDateRange.value,
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
}
