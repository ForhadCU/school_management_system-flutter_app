import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/student_library.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/Widgets/custom_textfield.dart';

import '../../../Config/config.dart';
import '../../../Utils/custom_utils.dart';
import '../../Widgets/buttons.dart';
import '../../Widgets/custom_container.dart';

class StuPaymentsWidgets {
  // make this class singleton
  StuPaymentsWidgets._internal();
  static final StuPaymentsWidgets _singleton = StuPaymentsWidgets._internal();
  factory StuPaymentsWidgets() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static final _controller = StuPaymentsController.to;
  static final _feeDetailsModel = _controller.feeDetailsModel.value;

  static vTopbar({required M m}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// tab buttons

        Row(
          children: [
            Expanded(
              child: CommonContainers.vTabItemContainer(
                  text: "Make Payment",
                  isActive: _controller.isMakePaymentTabActive.value,
                  // isActive: true,
                  onTap: () {
                    _controller.mUpdateMakePaymentTabItem();
                  }),
            ),
            (AppSpacing.smh / 2).width,
            Expanded(
                child: CommonContainers.vTabItemContainer(
              text: "Payment History",
              isActive: _controller.isPaymentHistoryTabActive.value,
              // isActive: false,
              onTap: () {
                _controller.mUpdatePaymentHistoryTabItem();
              },
            )),
          ],
        ),

        /// DropDowns and Get-Button
        _controller.isPaymentHistoryTabActive.value
            ? Container()
            : Container(
                decoration: const BoxDecoration(
                  // color: AppColor.helpDeskTopbar,
                  color: AppColor.activeTab,
                  // borderRadius: BorderRadius.circular(5.0),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0, vertical: AppSpacing.md),
                child: m.small
                    ? Column(
                        children: [
                          _vDropdowns(),
                          AppSpacing.md.height,
                          _vGetResultBtn(),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(child: _vDropdowns()),
                          AppSpacing.sm.width,
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

  static _vGetResultBtn() {
    return AppButtons.vPrimaryButton(
        onTap: () async {
          /* await _controller.mGetExamRoutinePdf();
        await _controller.mGetExamAdmitCardPdf(); */
        },
        text: "Get",
        bg: AppColor.inactiveTab);
  }

  static _vPaymentBtn() {
    return AppButtons.vPrimaryButton(
        onTap: () async {
          /* await _controller.mGetExamRoutinePdf();
        await _controller.mGetExamAdmitCardPdf(); */
        },
        text: "Payment",
        bg: AppColor.activeTab);
  }

  static _vDropdowns() {
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
              child: DropdownButton<String>(
                // value: _controller.selectedStudentHistory.value,
                hint: Text(
                  "Academic Payment (by Transaction id)",
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
                onChanged: (String? selectedModel) {
                  // _controller.mChangeClassDropdownValue(selectedModel!);
                },
                items: <String>[
                  "Academic Payment (by Walet)",
                  "Academic Payment (by Transaction id)"
                ].map((String value) {
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
              ) /*  Obx(() => DropdownButton<StuHistoryModel>(
                  // value: controller.academicGrpDropdownValue.value,
                  value: _controller.selectedStudentHistory.value,
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
                    _controller.mChangeClassDropdownValue(selectedModel!);
                  },
                  items: /* <String>["Recent", "Older"] */
                      _controller.stuHistoryList.map((StuHistoryModel value) {
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
                ) */
              ),
        ),
      ],
    );
  }

  static vPayableAmountBanner({required M m}) {
    return _controller.isFeeDetailsActive.value
        ? Container()
        : Row(
            children: [
              Expanded(
                  child: Container(
                padding: m.small
                    ? const EdgeInsets.symmetric(
                        vertical: AppSpacing.sm, horizontal: AppSpacing.sm)
                    : const EdgeInsets.symmetric(
                        vertical: AppSpacing.md, horizontal: AppSpacing.sm),
                decoration: BoxDecoration(
                  gradient: AppColor.kVerticalCovexGradiantPink,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    /// Payable amount
                    Expanded(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Payable Amount",
                          style: kBody.copyWith(fontWeight: FontWeight.w500),
                        ),
                        (AppSpacing.smh).height,
                        Text(
                          "1254.23",
                          style: kBody.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    )),

                    m.small
                        ? Column(
                            children: [
                              /// Bank Slip btn
                              AppButtons.vNarrowButton(
                                  onTap: () {},
                                  text: "Bank Slip",
                                  bg: AppColor.green,
                                  textColor: AppColor.white),

                              AppSpacing.sm.height,

                              /// Fee Details btn
                              AppButtons.vNarrowButton(
                                  onTap: () {
                                    _controller.mUpdateFeeDetails();
                                  },
                                  text: "Fee Details",
                                  bg: AppColor.activeTab,
                                  textColor: AppColor.white),
                            ],
                          )
                        : Row(
                            children: [
                              /// Fee Details btn
                              AppButtons.vNarrowButton(
                                  onTap: () {
                                    _controller.mUpdateFeeDetails();
                                  },
                                  text: "Fee Details",
                                  bg: AppColor.activeTab,
                                  textColor: AppColor.white),
                              AppSpacing.sm.width,

                              /// Bank Slip btn
                              AppButtons.vNarrowButton(
                                  onTap: () {},
                                  text: "Bank Slip",
                                  bg: AppColor.green,
                                  textColor: AppColor.white),
                            ],
                          )
                  ],
                ),
              )),
            ],
          );
  }

  static vPaymentByWalet({required M m}) {
    return Obx(() => _controller.isByWalet.value
        ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _controller.isNagadBtnClicked.value ||
                          _controller.isCellFinBtnClicked.value
                      ? Expanded(
                          flex: 3,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: AppSpacing.smh),
                            height: AppScreenSize.mGetWidth(kGlobContext, 15),
                            child: _vPaymentMethodBtn(
                              bg: AppColor.paymentMethodCard,
                              logo: StudentAssetLocation.bkash,
                              onTap: () async {
                                _controller.mClickedBkashBtn();
                              },
                            ),
                          ),
                        )
                      : _controller.isBkashBtnClicked.value
                          ? Expanded(
                              flex: 5,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: AppSpacing.smh),
                                height:
                                    AppScreenSize.mGetWidth(kGlobContext, 20),
                                child: _vPaymentMethodBtn(
                                  bg: AppColor.inactiveTab,
                                  logo: StudentAssetLocation.bkash,
                                  onTap: () async {
                                    _controller.mClickedBkashBtn();
                                  },
                                ),
                              ),
                            )
                          : Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: AppSpacing.smh),
                                height:
                                    AppScreenSize.mGetWidth(kGlobContext, 17),
                                child: _vPaymentMethodBtn(
                                  bg: AppColor.paymentMethodCard,
                                  logo: StudentAssetLocation.bkash,
                                  onTap: () async {
                                    _controller.mClickedBkashBtn();
                                  },
                                ),
                              ),
                            ),
                  AppSpacing.sm.width,
                  _controller.isBkashBtnClicked.value ||
                          _controller.isCellFinBtnClicked.value
                      ? Expanded(
                          flex: 3,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: AppSpacing.smh),
                            height: AppScreenSize.mGetWidth(kGlobContext, 15),
                            child: _vPaymentMethodBtn(
                              bg: AppColor.paymentMethodCard,
                              logo: StudentAssetLocation.nagad,
                              onTap: () async {
                                _controller.mClickedNagadBtn();
                              },
                            ),
                          ),
                        )
                      : _controller.isNagadBtnClicked.value
                          ? Expanded(
                              flex: 5,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: AppSpacing.smh),
                                height:
                                    AppScreenSize.mGetWidth(kGlobContext, 20),
                                child: _vPaymentMethodBtn(
                                  bg: AppColor.inactiveTab,
                                  logo: StudentAssetLocation.nagad,
                                  onTap: () async {
                                    _controller.mClickedNagadBtn();
                                  },
                                ),
                              ),
                            )
                          : Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: AppSpacing.smh),
                                height:
                                    AppScreenSize.mGetWidth(kGlobContext, 17),
                                child: _vPaymentMethodBtn(
                                  bg: AppColor.paymentMethodCard,
                                  logo: StudentAssetLocation.nagad,
                                  onTap: () async {
                                    _controller.mClickedNagadBtn();
                                  },
                                ),
                              ),
                            ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _controller.isBkashBtnClicked.value ||
                          _controller.isNagadBtnClicked.value
                      ? Expanded(
                          flex: 3,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: AppSpacing.smh),
                            height: AppScreenSize.mGetWidth(kGlobContext, 15),
                            child: _vPaymentMethodBtn(
                              bg: AppColor.paymentMethodCard,
                              logo: StudentAssetLocation.cellfin,
                              onTap: () async {
                                _controller.mClickedCellfinBtn();
                              },
                            ),
                          ),
                        )
                      : _controller.isCellFinBtnClicked.value
                          ? Expanded(
                              flex: 5,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: AppSpacing.smh),
                                height:
                                    AppScreenSize.mGetWidth(kGlobContext, 20),
                                child: _vPaymentMethodBtn(
                                  bg: AppColor.inactiveTab,
                                  logo: StudentAssetLocation.cellfin,
                                  onTap: () async {
                                    _controller.mClickedCellfinBtn();
                                  },
                                ),
                              ),
                            )
                          : Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: AppSpacing.smh),
                                height:
                                    AppScreenSize.mGetWidth(kGlobContext, 17),
                                child: _vPaymentMethodBtn(
                                  bg: AppColor.paymentMethodCard,
                                  logo: StudentAssetLocation.cellfin,
                                  onTap: () async {
                                    _controller.mClickedCellfinBtn();
                                  },
                                ),
                              ),
                            ),
                  AppSpacing.sm.width,
                  _controller.isBkashBtnClicked.value ||
                          _controller.isNagadBtnClicked.value
                      ? Expanded(
                          flex: 5,
                          child: Container(),
                        )
                      : _controller.isCellFinBtnClicked.value
                          ? Expanded(
                              flex: 3,
                              child: Container(),
                            )
                          : Expanded(flex: 1, child: Container()),
                ],
              )
            ],
          )
        : Container());

    /*  StaggeredGrid.count(
      crossAxisCount: 4,
      crossAxisSpacing: AppSpacing.smh,
      mainAxisSpacing: AppSpacing.smh,
      children: [
        StaggeredGridTile.fit(
            crossAxisCellCount: 3,
            child: _vPaymentMethodBtn(
                logo: StudentAssetLocation.bkash, onTap: () async {})),
        StaggeredGridTile.fit(
            crossAxisCellCount: 1,
            child: _vPaymentMethodBtn(
                logo: StudentAssetLocation.nagad, onTap: () async {})),
        StaggeredGridTile.fit(
            crossAxisCellCount: 2,
            child: _vPaymentMethodBtn(
                logo: StudentAssetLocation.cellfin, onTap: () async {})),
      ],
    ); */
  }

  static _vPaymentMethodBtn({
    required String logo,
    required Future<void> Function() onTap,
    required Color bg,
  }) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(4),
        decoration:
            BoxDecoration(color: bg, borderRadius: BorderRadius.circular(4)),
        child: Image.asset(
          logo,
          /*  height: 50,
          width: 100, */
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  static vPaymentByTransId({required M m}) {
    return Column(
      children: [
        Text(
          "Payment Method*",
          style: kBody.copyWith(fontWeight: FontWeight.w500),
        ),
        AppSpacing.sm.height,
        _vPaymentMethodsDropdown(),
        AppSpacing.md.height,
        Text(
          "Transactioh Id*",
          style: kBody.copyWith(fontWeight: FontWeight.w500),
        ),
        AppSpacing.sm.height,

        /// Transaction id Field
        Container(
          width: AppScreenSize.mGetWidth(kGlobContext, 70),
          decoration: BoxDecoration(
            color: AppColor.white,
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(4),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(3, 3),
                blurRadius: 1,
              )
            ],
          ),
          child: TextFormField(
            textAlign: TextAlign.start,
            style: kBody,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              border: InputBorder.none,
              hintText: "Write Transaction id",
              fillColor: AppColor.white,
            ),
          ),
        ),
        AppSpacing.xl.height,
        _vPaymentBtn(),
      ],
    );
  }

  static _vPaymentMethodsDropdown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Classname Dropdown
        Container(
            width: AppScreenSize.mGetWidth(kGlobContext, 70),
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              color: AppColor.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(3, 3),
                  blurRadius: 1,
                )
              ],
              borderRadius: BorderRadius.circular(4),
            ),
            child: DropdownButton<String>(
              // value: _controller.selectedStudentHistory.value,
              hint: Text(
                "Select Payment Method",
                style: kBody.copyWith(
                  color: AppColor.hintColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              icon: const Icon(Icons.keyboard_arrow_down),
              iconSize: 12,
              elevation: 10,
              focusColor: AppColor.white,
              dropdownColor: const Color.fromARGB(255, 240, 240, 240),
              isDense: true,
              isExpanded: true,
              underline: Container(),
              onChanged: (String? selectedModel) {
                // _controller.mChangeClassDropdownValue(selectedModel!);
              },
              items: <String>["Method 1", "Method 2"].map((String value) {
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
            ) /*  Obx(() => DropdownButton<StuHistoryModel>(
                // value: controller.academicGrpDropdownValue.value,
                value: _controller.selectedStudentHistory.value,
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
                  _controller.mChangeClassDropdownValue(selectedModel!);
                },
                items: /* <String>["Recent", "Older"] */
                    _controller.stuHistoryList.map((StuHistoryModel value) {
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
              ) */
            ),
      ],
    );
  }

  static vFeeDetails() {
    return Column(
      children: [
        /// Top header
        Container(
          padding: const EdgeInsets.only(
            left: AppSpacing.sm,
          ),
          decoration: const BoxDecoration(
              color: AppColor.activeTab,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSpacing.smh),
                topRight: Radius.circular(AppSpacing.smh),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Fee Details",
                  style: kBody.copyWith(
                    color: AppColor.kWhite,
                  )),
              IconButton(
                icon: const Icon(Icons.highlight_remove_outlined,
                    color: AppColor.white),
                onPressed: () {
                  _controller.mUpdateFeeDetails();
                },
              ),
            ],
          ),
        ),

        /// Body: PdfView

        Container(
          padding: EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.activeTab, width: .2),
          ),
          child: _controller.feeDetailsModel.value == null
              ? Center(
                  child: Text(
                    "Fetching data...",
                    style: kLabel.copyWith(
                        fontStyle: FontStyle.italic, color: Colors.black45),
                  ),
                )
              : Column(
                  children: [
                    /// Personal Info
                    _vPersonalInfo(),
                    AppSpacing.md.height,
                    _vFeeDetailsTable(),
                    AppSpacing.sm.height,

                    Divider(
                      height: 0,
                      color: Colors.black12,
                      thickness: .5,
                    ),
                    AppSpacing.md.height,
                    _vFeeDetailsFooter(),
                  ],
                ),
        )
      ],
    );
  }

  static vMakePayment({required Widget child}) {
    return child;
  }

  static vPaymentHistory({required child}) {
    return child;
  }

  static vTransHistoryTable() {
    double cellVerMargin = 8;
    double cellHorMargin = 16;
    return Obx(() => Expanded(
          child: _controller.paymentHistoryList.value == null
              ? Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Please wait...",
                    style: kLabel,
                  ),
                )
              : _controller.paymentHistoryList.value!.isEmpty
                  ? Container(
                      alignment: Alignment.center,
                      child: Text(
                        "No Data!",
                        style: kLabel.copyWith(color: AppColor.red),
                      ))
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                                // width: double.infinity,
                                /* width:
                                    AppScreenSize.mGetWidth(kGlobContext, 100) +
                                        50, */
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
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              border: TableBorder.all(color: AppColor.white),
                              children: <TableRow>[
                                TableRow(
                                  // table decoration
                                  decoration: const BoxDecoration(
                                      // color: AppColor.secondaryColor),
                                      color: AppColor.activeTab),
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Date',
                                          style: kBody.copyWith(
                                              color: AppColor.white,
                                              fontWeight: FontWeight.w500),
                                        ).marginSymmetric(
                                            vertical: cellVerMargin,
                                            horizontal: cellHorMargin),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Details',
                                          style: kBody.copyWith(
                                              color: AppColor.white,
                                              fontWeight: FontWeight.w500),
                                        ).marginSymmetric(
                                            vertical: cellVerMargin,
                                            horizontal: cellHorMargin),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Amount',
                                          style: kBody.copyWith(
                                              color: AppColor.white,
                                              fontWeight: FontWeight.w500),
                                        ).marginSymmetric(
                                            vertical: cellVerMargin,
                                            horizontal: cellHorMargin),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Payment Details',
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

                                for (var item in _controller
                                    .paymentHistoryList.value!) // test

                                  TableRow(
                                    // table decoration
                                    decoration: BoxDecoration(
                                        color: /* _controller.userInfoModelList.indexOf(item) */
                                            _controller.paymentHistoryList
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
                                            // _controller.mGetFormatDate(item.date),
                                            "20 Sep 2023",
                                            style: kBody.copyWith(
                                                color: AppColor.kBlack,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ).marginSymmetric(
                                              vertical: cellVerMargin,
                                              horizontal: cellHorMargin),
                                        ],
                                      ),

                                      /// Details
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Half Yearly Exam Fee",
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

                                      /// out Time
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "12500.00",
                                              textAlign: TextAlign.center,
                                              style: kBody.copyWith(
                                                  color: AppColor.kBlack,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ).marginSymmetric(
                                                vertical: cellVerMargin,
                                                horizontal: cellHorMargin),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          AppButtons.vNarrowButton(
                                              onTap: () {},
                                              text: "Details",
                                              bg: AppColor.green,
                                              textColor: AppColor.white),
                                        ],
                                      ).marginSymmetric(
                                          vertical: cellVerMargin,
                                          horizontal: cellHorMargin),
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

  static _vPersonalInfo() {
    return Column(
      children: [
        StaggeredGrid.count(
          crossAxisCount: 10,
          crossAxisSpacing: 4,
          children: [
            StaggeredGridTile.fit(
              crossAxisCellCount: 2,
              child: Text("Name"),
            ),
            StaggeredGridTile.fit(
              crossAxisCellCount: 1,
              child: Text(":"),
            ),
            StaggeredGridTile.fit(
              crossAxisCellCount: 7,
              child: Text(_feeDetailsModel!.studentDetails!.fullName ?? "N/A"),
            ),
          ],
        ),
        StaggeredGrid.count(
          crossAxisCount: 10,
          crossAxisSpacing: 4,
          children: [
            StaggeredGridTile.fit(
              crossAxisCellCount: 2,
              child: Text("Class"),
            ),
            StaggeredGridTile.fit(
              crossAxisCellCount: 1,
              child: Text(":"),
            ),
            StaggeredGridTile.fit(
              crossAxisCellCount: 7,
              child: Text(
                  _feeDetailsModel!.studentDetails!.stClass!.className ??
                      "N/A"),
            ),
          ],
        ),
        StaggeredGrid.count(
          crossAxisCount: 10,
          crossAxisSpacing: 4,
          children: [
            StaggeredGridTile.fit(
              crossAxisCellCount: 2,
              child: Text("Group"),
            ),
            StaggeredGridTile.fit(
              crossAxisCellCount: 1,
              child: Text(":"),
            ),
            StaggeredGridTile.fit(
              crossAxisCellCount: 7,
              child: Text(
                  _feeDetailsModel!.studentDetails!.accGroup!.groupName ??
                      "N/A"),
            ),
          ],
        ),
        StaggeredGrid.count(
          crossAxisCount: 10,
          crossAxisSpacing: 4,
          children: [
            StaggeredGridTile.fit(
              crossAxisCellCount: 2,
              child: Text("Section"),
            ),
            StaggeredGridTile.fit(
              crossAxisCellCount: 1,
              child: Text(":"),
            ),
            StaggeredGridTile.fit(
              crossAxisCellCount: 7,
              child: Text(_feeDetailsModel!.studentDetails!.section ?? "N/A"),
            ),
          ],
        ),
        StaggeredGrid.count(
          crossAxisCount: 10,
          crossAxisSpacing: 4,
          children: [
            StaggeredGridTile.fit(
              crossAxisCellCount: 2,
              child: Text("Roll"),
            ),
            StaggeredGridTile.fit(
              crossAxisCellCount: 1,
              child: Text(":"),
            ),
            StaggeredGridTile.fit(
              crossAxisCellCount: 7,
              child: Text(
                  (_feeDetailsModel!.studentDetails!.studentRollNumber ?? 00)
                      .toString()),
            ),
          ],
        ),
      ],
    );
  }

  static _vFeeDetailsTable() {
    double cellVerMargin = 8;
    double cellHorMargin = 16;
    return /*  Obx(() => */ SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
                // width: double.infinity,
                /* width:
                      AppScreenSize.mGetWidth(kGlobContext, 100) +
                          50, */
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
                          'Head',
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
                          'Type',
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
                          'Items',
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
                          'Amount',
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

                for (var item in _feeDetailsModel!.feeAllocationDetails!)
                  TableRow(
                    // table decoration
                    decoration: BoxDecoration(
                        color: /* _controller.userInfoModelList.indexOf(item) */
                            _feeDetailsModel!.feeAllocationDetails!
                                            .indexOf(item) %
                                        2 ==
                                    0
                                ? AppColor.secondaryColor.withOpacity(.4)
                                : AppColor.secondaryColor.withOpacity(.2)),
                    children: <Widget>[
                      /// Head
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            // _controller.mGetFormatDate(item.date),
                            item.academicFeeHead!.name ?? "",
                            style: kBody.copyWith(
                                color: AppColor.kBlack,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ).marginSymmetric(
                              vertical: cellVerMargin,
                              horizontal: cellHorMargin),
                        ],
                      ),

                      /// Type
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              item.feeTypeName ?? "",
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

                      /// Items
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: .5, color: Colors.white)),
                                      child: Text(
                                        item.academicFeeSubHead!.name ?? "",
                                        textAlign: TextAlign.center,
                                        style: kBody.copyWith(
                                            color: AppColor.kBlack,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ] /* List.generate(7, (index) =>  Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: .5, color: Colors.white)),
                                      child: Text(
                                        "Mid Term Exam",
                                        textAlign: TextAlign.center,
                                        style: kBody.copyWith(
                                            color: AppColor.kBlack,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ],
                              ),) */ /* [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: .5, color: Colors.white)),
                                      child: Text(
                                        "Mid Term Exam",
                                        textAlign: TextAlign.center,
                                        style: kBody.copyWith(
                                            color: AppColor.kBlack,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: .5, color: Colors.white)),
                                      child: Text(
                                        "Mid Term Exam",
                                        textAlign: TextAlign.center,
                                        style: kBody.copyWith(
                                            color: AppColor.kBlack,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: .5, color: Colors.white)),
                                      child: Text(
                                        "Mid Term Exam",
                                        textAlign: TextAlign.center,
                                        style: kBody.copyWith(
                                            color: AppColor.kBlack,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ] */
                            ,
                          )),
                        ],
                      ) /* .marginSymmetric(
                              vertical: cellVerMargin,
                              horizontal: cellHorMargin) */
                      ,

                      /// fee
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: .5, color: Colors.white)),
                                      child: Text(
                                        (item.amount ?? 0.00).toString(),
                                        textAlign: TextAlign.center,
                                        style: kBody.copyWith(
                                            color: AppColor.kBlack,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ],
                              ), /* 
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: .5, color: Colors.white)),
                                      child: Text(
                                        "1254.00",
                                        textAlign: TextAlign.center,
                                        style: kBody.copyWith(
                                            color: AppColor.kBlack,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: .5, color: Colors.white)),
                                      child: Text(
                                        "1254.00",
                                        textAlign: TextAlign.center,
                                        style: kBody.copyWith(
                                            color: AppColor.kBlack,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ],
                              ), */
                            ],
                          )),
                        ],
                      ) /* .marginSymmetric(
                              vertical: cellVerMargin,
                              horizontal: cellHorMargin) */
                      ,
                    ],
                  ),

                TableRow(children: <Widget>[
                  Container(),
                  Container(),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(width: .5, color: Colors.white)),
                    child: Text(
                      "Total (Tk)",
                      textAlign: TextAlign.center,
                      style: kBody.copyWith(
                          color: AppColor.kBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(width: .5, color: Colors.white)),
                    child: Text(
                      (_feeDetailsModel!.demandSlipDetails!.feeAmount ?? 0.00)
                          .toString(),
                      textAlign: TextAlign.center,
                      style: kBody.copyWith(
                          color: AppColor.kBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ]),
                TableRow(children: <Widget>[
                  Container(),
                  Container(),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(width: .5, color: Colors.white)),
                    child: Text(
                      "Due (Tk)",
                      textAlign: TextAlign.center,
                      style: kBody.copyWith(
                          color: AppColor.kBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(width: .5, color: Colors.white)),
                    child: Text(
                      (_feeDetailsModel!.demandSlipDetails!.previousDue ?? 0.00)
                          .toString(),
                      textAlign: TextAlign.center,
                      style: kBody.copyWith(
                          color: AppColor.kBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ]),

                TableRow(children: <Widget>[
                  Container(),
                  Container(),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(width: .5, color: Colors.white)),
                    child: Text(
                      "Total With Due (Tk)",
                      textAlign: TextAlign.center,
                      style: kBody.copyWith(
                          color: AppColor.kBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(width: .5, color: Colors.white)),
                    child: Text(
                      (_feeDetailsModel!.totalWithDue ?? 0.00).toString(),
                      textAlign: TextAlign.center,
                      style: kBody.copyWith(
                          color: AppColor.kBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ]),
                TableRow(children: <Widget>[
                  Container(),
                  Container(),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(width: .5, color: Colors.white)),
                    child: Text(
                      "Weiver (Tk)",
                      textAlign: TextAlign.center,
                      style: kBody.copyWith(
                          color: AppColor.kBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(width: .5, color: Colors.white)),
                    child: Text(
                      (_feeDetailsModel!.demandSlipDetails!.waiverAmount ??
                              0.00)
                          .toString(),
                      textAlign: TextAlign.center,
                      style: kBody.copyWith(
                          color: AppColor.kBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ]),
                TableRow(children: <Widget>[
                  Container(),
                  Container(),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(width: .5, color: Colors.white)),
                    child: Text(
                      "Special Weiver (Tk)",
                      textAlign: TextAlign.center,
                      style: kBody.copyWith(
                          color: AppColor.kBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(width: .5, color: Colors.white)),
                    child: Text(
                      (_feeDetailsModel!
                                  .demandSlipDetails!.specialWaiverAmount ??
                              0.00)
                          .toString(),
                      textAlign: TextAlign.center,
                      style: kBody.copyWith(
                          color: AppColor.kBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ]),

                TableRow(children: <Widget>[
                  Container(),
                  Container(),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(width: .5, color: Colors.white)),
                    child: Text(
                      "Offer (Tk)",
                      textAlign: TextAlign.center,
                      style: kBody.copyWith(
                          color: AppColor.kBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(width: .5, color: Colors.white)),
                    child: Text(
                      (_feeDetailsModel!.demandSlipDetails!.offerAmount ?? 0.00)
                          .toString(),
                      textAlign: TextAlign.center,
                      style: kBody.copyWith(
                          color: AppColor.kBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ]),
                TableRow(children: <Widget>[
                  Container(),
                  Container(),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(width: .5, color: Colors.white)),
                    child: Text(
                      "Pay (Tk)",
                      textAlign: TextAlign.center,
                      style: kBody.copyWith(
                          color: AppColor.kBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(width: .5, color: Colors.white)),
                    child: Text(
                      (_feeDetailsModel!.demandSlipDetails!.totalAmount ?? 0.00)
                          .toString(),
                      textAlign: TextAlign.center,
                      style: kBody.copyWith(
                          color: AppColor.kBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
              ],
            )) /* .marginOnly(left: 20, top: 10, right: 20, bottom: 50) */),
          ),
        ],
      ),
    );
  }

  static _vFeeDetailsFooter() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 2,
                child: Text(
                  "In Word",
                  textAlign: TextAlign.left,
                  style: kBody,
                )),
            Text(
              " : ",
              style: kBody,
            ),
            Expanded(
                flex: 6,
                child: Text(
                  (_feeDetailsModel!.total ?? "").toUpperCase().trim(),
                  textAlign: TextAlign.left,
                  style: kBody,
                ))
          ],
        ),
        AppSpacing.sm.height,
        Row(
          children: [
            Expanded(
                flex: 2,
                child: Text(
                  "Created by",
                  textAlign: TextAlign.left,
                  style: kBody,
                )),
            Text(
              " : ",
              style: kBody,
            ),
            Expanded(
                flex: 6,
                child: Text(
                  _feeDetailsModel!.userName ?? "",
                  textAlign: TextAlign.left,
                  style: kBody,
                ))
          ],
        ),
      ],
    );
  }
}
