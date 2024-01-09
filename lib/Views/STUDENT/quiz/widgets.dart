import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/Widgets/buttons.dart';

import '../../../Config/config.dart';
import '../../../Controller/student_library.dart';
import '../../Widgets/custom_container.dart';

class StuQuizWidgets {
  // make this class singleton
  StuQuizWidgets._internal();
  static final StuQuizWidgets _singleton = StuQuizWidgets._internal();
  factory StuQuizWidgets() {
    return _singleton;
  }

  static final _controller = StuQuizController.to;

  static vQuizCounterProgressbar() {
    return Obx(() => Expanded(
            child: LinearProgressIndicator(
          value: _controller.progress.value,
          color: AppColor.white,
          borderRadius: BorderRadius.circular(5),
          valueColor: const AlwaysStoppedAnimation<Color>(AppColor.green),

          // color: AppColor.green,
        )));
  }

  static vNextAndPreviousButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AppButtons.vPrimaryButton(
            onTap: () {
              _controller.decrementProgress();
            },
            bg: AppColor.activeTab,
            text: "Previous",
            textColor: Colors.white),
        AppButtons.vPrimaryButton(
            onTap: () {
              _controller.incrementProgress();
            },
            bg: AppColor.activeTab,
            text: "Next",
            textColor: Colors.white),
      ],
    );
  }

  static vTabBar() {
    return Row(
      children: [
        Expanded(
          child: Obx(() => CommonContainers.vTabItemContainer(
              text: "Live Quiz",
              isActive: _controller.isLiveQuizActive.value,
              // isActive: true,
              onTap: () {
                _controller.mUpdateLiveQuiz();
              })),
        ),
        (AppSpacing.smh / 2).width,
        Expanded(
            child: Obx(() => CommonContainers.vTabItemContainer(
                  text: "Quiz Schedule",
                  isActive: _controller.isQuizScheduleActive.value,
                  // isActive: false,
                  onTap: () {
                    _controller.mUpdateQuizSchedule();
                  },
                ))),
        (AppSpacing.smh / 2).width,
        Expanded(
            child: Obx(() => CommonContainers.vTabItemContainer(
                  text: "Quiz Result",
                  isActive: _controller.isQuizResultActive.value,
                  // isActive: false,
                  onTap: () {
                    _controller.mUpdateQuizResult();
                  },
                ))),
      ],
    );
  }

  static vLiveQuiz() {
    return Obx(() => Visibility(
          visible: _controller.isLiveQuizActive.value,
          child: Column(
            children: [
              /// Top header
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.md,
                ),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColor.activeTab,
                  /*  borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSpacing.smh),
                  topRight: Radius.circular(AppSpacing.smh),
                ) */
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///left right
                    Text("Quiz Title",
                        style: kBody.copyWith(
                          color: AppColor.kWhite,
                          fontWeight: FontWeight.w500,
                        )),

                    ///right part
                    Row(
                      children: [
                        /// timer
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppSpacing.smh,
                              horizontal: AppSpacing.sm),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.timer_outlined,
                                color: AppColor.red,
                                size: 16,
                              ),
                              AppSpacing.smh.width,
                              Text("00:59:34",
                                  style: kBody.copyWith(
                                      color: AppColor.red,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),

                        AppSpacing.md.width,

                        /// close
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppSpacing.smh,
                              horizontal: AppSpacing.sm),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Close",
                                  style: kBody.copyWith(
                                    color: AppColor.white,
                                  )),
                              AppSpacing.smh.width,
                              const Icon(
                                Icons.highlight_remove_outlined,
                                color: AppColor.white,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// Body
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppColor.liveQuizBg,
                  border: Border.all(color: AppColor.activeTab, width: .2),
                ),
                child: Column(
                  children: [
                    /// Quiz info
                    Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Type : "),
                            Text("MCQ"),
                          ],
                        ),
                        AppSpacing.sm.height,
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Total Questions : "),
                            Text("40"),
                          ],
                        ),
                      ],
                    ),
                    AppSpacing.md.height,

                    /// Quiz ProgressLoader
                    Row(
                      children: [
                        vQuizCounterProgressbar(),
                        AppSpacing.md.width,
                        Row(
                          children: [
                            Text(
                              _controller.quizNumber.value.toString(),
                              style:
                                  kBody.copyWith(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "/",
                              style:
                                  kBody.copyWith(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "20",
                              style:
                                  kBody.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      ],
                    ),
                    AppSpacing.xl.height,
                    _vQuizQuestion(),
                    AppSpacing.sm.height,
                    _vQuizAnswers(),
                    AppSpacing.xxl.height,
                    vNextAndPreviousButtons(),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  static vQuizSchedule() {
    return Obx(() => Container(
          child: Visibility(
            visible: _controller.isQuizScheduleActive.value,
            child: _vScheduleTable(),
          ),
        ));
  }

  static vQuizResult() {
    return Obx(() => Container(
          child: Visibility(
            visible: _controller.isQuizResultActive.value,
            child: _vResultTable(),
          ),
        ));
  }

  static _vQuizQuestion() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md, horizontal: AppSpacing.sm),
      decoration: BoxDecoration(
          border: Border.all(width: .5, color: Colors.black12),
          borderRadius: BorderRadius.circular(4),
          color: AppColor.kBlack.withOpacity(.5)),
      alignment: Alignment.center,
      child: Text(
        "What is the name of our country, can you tell us the shortform of the name?",
        style:
            kBody.copyWith(color: AppColor.white, fontWeight: FontWeight.w500),
      ),
    );
  }

  static _vQuizAnswers() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.sm, horizontal: 8),
          decoration: BoxDecoration(
            // color: AppColor.quizAnsItemBg,
            border: Border.all(color: AppColor.inactiveTab, width: .5),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Text(
                "${String.fromCharCode("A".codeUnitAt(0) + index)}. ",
                style: kBody.copyWith(color: Colors.black87),
              ),
              Text(
                "Option ${index + 1}",
                style: kBody.copyWith(color: Colors.black87),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          height: AppSpacing.sm,
          color: Colors.transparent,
        );
      },
    );
  }

  static _vResultTable() {
    double cellVerMargin = 8;
    double cellHorMargin = 16;
    return Obx(() => Expanded(
          child: _controller.scheduleList.value == null
              ? Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Please wait...",
                    style: kLabel,
                  ),
                )
              : _controller.scheduleList.value!.isEmpty
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
                                      color: AppColor.activeTab),
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '#',
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
                                          'Quiz Title',
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
                                          'Quiz Date & Time',
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
                                          'Duration(Min)',
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
                                          'Total Question',
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
                                          'Quiz Time',
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
                                          'Total Answer',
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
                                          'Correct Answer',
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
                                          'Incorrect Answer',
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
                                          'Quiz Percentage',
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
                                          'Attendance',
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

                                for (var item
                                    in _controller.scheduleList.value!) // test

                                  TableRow(
                                    // table decoration
                                    decoration: BoxDecoration(
                                        color: /* _controller.userInfoModelList.indexOf(item) */
                                            _controller.scheduleList.value!
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
                                            '1',
                                            style: kBody.copyWith(
                                                color: AppColor.kBlack,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
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
                                            'Quiz Test 1',
                                            style: kBody.copyWith(
                                                color: AppColor.kBlack,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
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
                                            '12 Sep 2024',
                                            style: kBody.copyWith(
                                                color: AppColor.kBlack,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
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
                                            '02:45 PM',
                                            style: kBody.copyWith(
                                                color: AppColor.kBlack,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
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
                                            '45',
                                            style: kBody.copyWith(
                                                color: AppColor.kBlack,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
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
                                            'AWS',
                                            style: kBody.copyWith(
                                                color: AppColor.kBlack,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
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
                                            'AWS',
                                            style: kBody.copyWith(
                                                color: AppColor.kBlack,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
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
                                            'AWS',
                                            style: kBody.copyWith(
                                                color: AppColor.kBlack,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
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
                                            'AWS',
                                            style: kBody.copyWith(
                                                color: AppColor.kBlack,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
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
                                            'AWS',
                                            style: kBody.copyWith(
                                                color: AppColor.kBlack,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ).marginSymmetric(
                                              vertical: cellVerMargin,
                                              horizontal: cellHorMargin),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          AppButtons.vNarrowButton(
                                                  onTap: () {},
                                                  text: "Present",
                                                  bg: AppColor.green,
                                                  textColor: AppColor.white)
                                              .marginSymmetric(
                                                  vertical: cellVerMargin,
                                                  horizontal: cellHorMargin),
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

  static _vScheduleTable() {
    double cellVerMargin = 8;
    double cellHorMargin = 16;
    return Obx(() => Expanded(
          child: _controller.scheduleList.value == null
              ? Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Please wait...",
                    style: kLabel,
                  ),
                )
              : _controller.scheduleList.value!.isEmpty
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
                                4: IntrinsicColumnWidth(),
                                5: IntrinsicColumnWidth(),
                                6: IntrinsicColumnWidth(),
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
                                          '#',
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
                                          'Quiz Title',
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
                                          'Exam Date',
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
                                          'Start Time',
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
                                          'Duration (Min)',
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
                                          'Quiz By',
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

                                for (var item
                                    in _controller.scheduleList.value!) // test

                                  TableRow(
                                    // table decoration
                                    decoration: BoxDecoration(
                                        color: /* _controller.userInfoModelList.indexOf(item) */
                                            _controller.scheduleList.value!
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
                                            '1',
                                            style: kBody.copyWith(
                                                color: AppColor.kBlack,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
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
                                            'Quiz Test 1',
                                            style: kBody.copyWith(
                                                color: AppColor.kBlack,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
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
                                            '12 Sep 2024',
                                            style: kBody.copyWith(
                                                color: AppColor.kBlack,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
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
                                            '02:45 PM',
                                            style: kBody.copyWith(
                                                color: AppColor.kBlack,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
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
                                            '45',
                                            style: kBody.copyWith(
                                                color: AppColor.kBlack,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
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
                                            'AWS',
                                            style: kBody.copyWith(
                                                color: AppColor.kBlack,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ).marginSymmetric(
                                              vertical: cellVerMargin,
                                              horizontal: cellHorMargin),
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
  // codes start from here
  // All methods should be static to maintain singleton instances
}
