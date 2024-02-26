import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/student_library.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Views/STUDENT/quiz/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:school_management_system/Utils/custom_utils.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/Widgets/buttons.dart';

import '../../Widgets/custom_container.dart';

class StuQuiz extends GetView<StuQuizController> {
  const StuQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Quiz".toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: AppColor.primaryColor,
          actions: [
            IconButton(
                icon: new Icon(Icons.refresh, color: Colors.white),
                onPressed: () async {
                  await controller.mReload();
                }),
          ],
        ),
        body: BaseWidgetChild(
            child: Column(children: [
          /* StuQuizWidgets.vTabBar(),
          StuQuizWidgets.vLiveQuiz(),
          StuQuizWidgets.vQuizSchedule(),
          StuQuizWidgets.vQuizResult() */

          vTabBar(),
          vLiveQuiz(),
          vQuizSchedule(),
          vQuizResult()
        ])),
      ),
    );
  }

  vTabBar() {
    return Row(
      children: [
        Expanded(
          child: Obx(() => CommonContainers.vTabItemContainer(
              text: "Live Quiz",
              isActive: controller.isLiveQuizActive.value,
              // isActive: true,
              onTap: () {
                controller.mUpdateLiveQuiz();
              })),
        ),
        (AppSpacing.smh / 2).width,
        Expanded(
            child: Obx(() => CommonContainers.vTabItemContainer(
                  // text: "Quiz Schedule",
                  text: "Schedule",
                  isActive: controller.isQuizScheduleActive.value,
                  // isActive: false,
                  onTap: () {
                    controller.mUpdateQuizSchedule();
                  },
                ))),
        (AppSpacing.smh / 2).width,
        Expanded(
            child: Obx(() => CommonContainers.vTabItemContainer(
                  // text: "Quiz Result",
                  text: "Result",
                  isActive: controller.isQuizResultActive.value,
                  // isActive: false,
                  onTap: () {
                    controller.mUpdateQuizResult();
                  },
                ))),
      ],
    );
  }

  vLiveQuiz() {
    return Obx(() => Visibility(
        visible: controller.isLiveQuizActive.value,
        child: controller.isLoading.value
            ? Container()
            : controller.isQuizNotFound.value
                ? _vQuizNotfoundMessage()
                : controller.isQuizMissed.value
                    ? _vQuizMissedMessage()
                    : controller.quizInfoModel.value.endStatus == 1
                        ? _vQuizSubmitedMessage()
                        : controller.isQuizStart.value
                            ? controller.quizQuestionsModel.value == null
                                ? Container()
                                : _vQuizPart()
                            : _vQuizLaunchingPart()));
  }

  vQuizCounterProgressbar() {
    return Obx(() => Expanded(
            child: LinearProgressIndicator(
          value: controller.progress.value,
          color: AppColor.white,
          borderRadius: BorderRadius.circular(5),
          valueColor: const AlwaysStoppedAnimation<Color>(AppColor.green),

          // color: AppColor.green,
        )));
  }

  vNextAndPreviousButtons() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              controller.quizQuestionIndex.value <= 0
                  ? Container()
                  : AppButtons.vPrimaryButton(
                      onTap: () {
                        controller.mGotoPreviousQuiz();
                      },
                      bg: AppColor.inactiveTab,
                      text: "Previous",
                      textColor: Colors.white),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              controller.quizQuestionIndex.value ==
                      controller
                              .quizQuestionsModelList[
                                  controller.quizQuestionIndex.value]
                              .questionList!
                              .length -
                          1
                  ? AppButtons.vPrimaryButton(
                      onTap: () {
                        controller.mSubmitQuiz();
                      },
                      bg: AppColor.green,
                      text: "Submit Answer",
                      textColor: Colors.white)
                  : AppButtons.vPrimaryButton(
                      onTap: () {
                        controller.mGotoNextQuiz();
                      },
                      bg: AppColor.activeTab,
                      text: "Next",
                      textColor: Colors.white),
            ],
          ),
        )
      ],
    );
  }

  _vQuizLaunchingPart() {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.activeTab, width: .5)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Quiz will start",
                // Text("Before Quiz",
                style: kTitleLite.copyWith(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w500,
                )),
            AppSpacing.md.height,

            /// Countdown part
            TimerCountdown(
              format: CountDownTimerFormat.daysHoursMinutesSeconds,
              endTime: DateTime.now().add(
                Duration(
                  days: controller.daysRemainingBeforeStart.value,
                  hours: controller.hoursRemainingBeforeStart.value,
                  minutes: controller.minsRemainingBeforeStart.value,
                  seconds: controller.secsRemainingBeforeStart.value,

                  /*   days: 0,
                  hours: 0,
                  minutes: 0,
                  seconds: controller.testTimer.value, */
                ),
              ),
              onEnd: () {
                print("Timer finished");
                controller.isQuizStart.value = true;
              },
              onTick: (remainingTime) async {
                /* kLog(Utils()
                    .mCalculateSecsFromSecs(secs: remainingTime.inSeconds)); */
                if (remainingTime.inSeconds <= (60 * 20) &&
                    remainingTime.inSeconds > 0 &&
                    !controller.isReady.value) {
                  controller.isShownReady.value = true;
                  controller.mGetRemainingTimeBeforeStart();
                  controller.testTimer.value = remainingTime.inSeconds;
                }
                if (remainingTime.inSeconds == 0) {
                  if (controller.isReady.value) {
                    controller.isQuizStart.value = true;
                    await controller.mGetQuizQuestions();
                  } else {
                    controller.isQuizMissed.value = true;
                    controller.isShownReady.value = false;
                  }
                }
              },
              descriptionTextStyle: kBody.copyWith(color: AppColor.kBlack),
              timeTextStyle: kTitle.copyWith(color: AppColor.kBlack),
            ),
            AppSpacing.xxl.height,

            /// Ready Button
            controller.isShownReady.value
                ? AppButtons.vPrimaryButton(
                    onTap: () {
                      controller.mRegisterToQuiz();
                    },
                    text: "Ready",
                    textColor: Colors.white,
                    bg: const Color.fromARGB(255, 13, 160, 18))
                : Container(),

            /// After Clicking on Ready Button
            controller.isReady.value
                ? Column(
                    children: [
                      Text("Registration successful!",
                          // Text("Before Quiz",
                          style: kBody.copyWith(
                            fontSize: 16,
                            color: AppColor.green,
                            fontWeight: FontWeight.w500,
                          )),
                      AppSpacing.smh.height,
                      Text("Please wait here...",
                          // Text("Before Quiz",
                          style: kBody.copyWith(
                            color: Colors.black45,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  )
                : Container(),
            /*  controller.isQuizMissed.value
                ? Text("You have missed this quiz!",
                    // Text("Before Quiz",
                    style: kBody.copyWith(
                      fontSize: 16,
                      color: AppColor.red,
                      fontWeight: FontWeight.w500,
                    ))
                : Container(), */
          ],
        ),
      ),
    );
  }

  _vQuizPart() {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// Top heade
                  _vQuizPartHeading(),

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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Total Questions : "),
                            Text(controller
                                .quizQuestionsModel.value.questionList!.length
                                .toString()),
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
                                  (controller.quizQuestionIndex.value + 1)
                                      .toString(),
                                  style: kBody.copyWith(
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "/",
                                  style: kBody.copyWith(
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  controller
                                      .quizQuestionsModelList[
                                          controller.quizQuestionIndex.value]
                                      .questionList!
                                      .length
                                      .toString(),
                                  style: kBody.copyWith(
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        ),
                        AppSpacing.xl.height,
                        _vQuizQuestion(),
                        AppSpacing.sm.height,
                        _vQuizAnswers(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppSpacing.xxl.height,
          vNextAndPreviousButtons()
        ],
      ),
    );
  }

  Container _vQuizPartHeading() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.md,
      ),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColor.activeTab,
        /*  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSpacing.smh),
                    top)Right: Radius.circular(AppSpacing.smh),
              ) */
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///left right
          Expanded(
            child: Column(
              children: [
                Text(controller.quizQuestionsModel.value.quizDetails!.quizName!,
                    softWrap: true,
                    style: kBody.copyWith(
                      color: AppColor.kWhite,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ),

          ///right part
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /// timer
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.smh, horizontal: AppSpacing.sm),
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
                      AppSpacing.sm.width,
                      /* Text("00:59:34",
                            style: kBody.copyWith(
                                color: AppColor.red,
                                fontWeight: FontWeight.w500)), */
                      TimerCountdown(
                        spacerWidth: AppSpacing.smh,
                        format: CountDownTimerFormat.hoursMinutesSeconds,
                        endTime: DateTime.now().add(
                          Duration(
                            hours: controller.hoursRemainingBeforeStart.value,
                            minutes: controller.minsRemainingBeforeStart.value,
                            seconds: controller.secsRemainingBeforeStart.value,
                          ),
                        ),
                        onEnd: () {
                          kLog("Timer finished");
                        },
                        onTick: (remainingTime) async {
                          if (remainingTime.inSeconds == 0) {
                            await controller.mSubmitQuiz();
                          }
                        },
                        enableDescriptions: false,
                        timeTextStyle: kBody.copyWith(
                            color: AppColor.red, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
/* 
                AppSpacing.md.width,

                /// close
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.smh, horizontal: AppSpacing.sm),
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
                ), */
              ],
            ),
          ),
        ],
      ),
    );
  }

  vQuizSchedule() {
    return Obx(() => Container(
          child: Visibility(
            visible: controller.isQuizScheduleActive.value,
            child: _vScheduleTable(),
          ),
        ));
  }

  vQuizResult() {
    return Obx(() => Container(
          child: Visibility(
            visible: controller.isQuizResultActive.value,
            child: _vResultTable(),
          ),
        ));
  }

  _vQuizQuestion() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md, horizontal: AppSpacing.sm),
      decoration: BoxDecoration(
          border: Border.all(width: .5, color: Colors.black12),
          borderRadius: BorderRadius.circular(4),
          color: AppColor.kBlack.withOpacity(.2)),
      alignment: Alignment.center,
      child: Html(
        data: controller
            .quizQuestionsModelList[controller.quizQuestionIndex.value]
            .questionList![controller.quizQuestionIndex.value]
            .question
            .toString(),
      ), /* Text(
        // "What is the name of our country, can you tell us the shortform of the name?",
        controller.quizQuestionsModelList[controller.quizQuestionIndex.value]
            .questionList![controller.quizQuestionIndex.value].question
            .toString(),
        style:
            kBody.copyWith(color: AppColor.white, fontWeight: FontWeight.w500),
      ), */
    );
  }

  _vQuizAnswers() {
    return Obx(() => ListView.separated(
          shrinkWrap: true,
          itemCount: controller
              .quizQuestionsModelList[controller.quizQuestionIndex.value]
              .questionList![controller.quizQuestionIndex.value]
              .siteQuizQuestionDetailsForStudent!
              .length,
          itemBuilder: (context, index) {
            final optionsModel = controller
                .quizQuestionsModelList[controller.quizQuestionIndex.value]
                .questionList![controller.quizQuestionIndex.value]
                .siteQuizQuestionDetailsForStudent![index];

            return controller
                        .quizQuestionsModelList[
                            controller.quizQuestionIndex.value]
                        .questionList![controller.quizQuestionIndex.value]
                        .answerCount! <=
                    1
                ? Obx(
                    () {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppSpacing.sm, horizontal: 8),
                          decoration: BoxDecoration(
                            // color: AppColor.quizAnsItemBg,
                            border: Border.all(
                                color: AppColor.inactiveTab, width: .5),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              Radio(
                                value: optionsModel.id,
                                groupValue: controller.selectedOption.value,
                                onChanged: (value) {
                                  controller.selectedOption.value = value;

                                  /// save answer id into parent model
                                  if (controller
                                          .quizQuestionsModelList[controller
                                              .quizQuestionIndex.value]
                                          .questionList![controller
                                              .quizQuestionIndex.value]
                                          .studentAnswerIds!
                                          .isNotEmpty &&
                                      controller
                                          .quizQuestionsModelList[controller
                                              .quizQuestionIndex.value]
                                          .questionList![controller
                                              .quizQuestionIndex.value]
                                          .studentAnswerIds!
                                          .contains(optionsModel.id)) {
                                    controller
                                        .quizQuestionsModelList[
                                            controller.quizQuestionIndex.value]
                                        .questionList![
                                            controller.quizQuestionIndex.value]
                                        .studentAnswerIds!
                                        .removeWhere((element) =>
                                            element == optionsModel.id);
                                  } else {
                                    controller
                                        .quizQuestionsModelList[
                                            controller.quizQuestionIndex.value]
                                        .questionList![
                                            controller.quizQuestionIndex.value]
                                        .studentAnswerIds!
                                        .clear();

                                    controller
                                        .quizQuestionsModelList[
                                            controller.quizQuestionIndex.value]
                                        .questionList![
                                            controller.quizQuestionIndex.value]
                                        .studentAnswerIds!
                                        .add(optionsModel.id);
                                  }
                                },
                                activeColor: AppColor.activeTab,
                              ),
                              Text(
                                "${String.fromCharCode("A".codeUnitAt(0) + index)}. ",
                                style: kBody.copyWith(color: Colors.black87),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      optionsModel.option!,
                                      style:
                                          kBody.copyWith(color: Colors.black87),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : GestureDetector(
                    onTap: () {
                      controller.isModified.value =
                          !controller.isModified.value;
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.sm, horizontal: 8),
                      decoration: BoxDecoration(
                        // color: AppColor.quizAnsItemBg,
                        border:
                            Border.all(color: AppColor.inactiveTab, width: .5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Obx(() => Checkbox(
                                value: controller.answerIdList[index]
                                    ["selected"]
                                /* controller
                                                .quizQuestionsModelList[
                                                    controller
                                                        .quizQuestionIndex
                                                        .value]
                                                .questionList![controller
                                                    .quizQuestionIndex.value]
                                                .studentAnswerIds!
                                                .isNotEmpty &&
                                            controller
                                                .quizQuestionsModelList[
                                                    controller
                                                        .quizQuestionIndex
                                                        .value]
                                                .questionList![controller
                                                    .quizQuestionIndex.value]
                                                .studentAnswerIds!
                                                .contains(optionsModel.id)
                                        ? true
                                        : false */
                                ,
                                onChanged: (value) {
                                  // controller.selectedOption.value = value!;
                                  controller.answerIdList[index] = {
                                    "id": optionsModel.id,
                                    "selected": value
                                  };

                                  if (controller
                                          .quizQuestionsModelList[controller
                                              .quizQuestionIndex.value]
                                          .questionList![controller
                                              .quizQuestionIndex.value]
                                          .studentAnswerIds!
                                          .isNotEmpty &&
                                      controller
                                          .quizQuestionsModelList[controller
                                              .quizQuestionIndex.value]
                                          .questionList![controller
                                              .quizQuestionIndex.value]
                                          .studentAnswerIds!
                                          .contains(optionsModel.id)) {
                                    controller
                                        .quizQuestionsModelList[
                                            controller.quizQuestionIndex.value]
                                        .questionList![
                                            controller.quizQuestionIndex.value]
                                        .studentAnswerIds!
                                        .removeWhere((element) =>
                                            element == optionsModel.id);
                                  } else {
                                    controller
                                        .quizQuestionsModelList[
                                            controller.quizQuestionIndex.value]
                                        .questionList![
                                            controller.quizQuestionIndex.value]
                                        .studentAnswerIds!
                                        .add(optionsModel.id);
                                  }

                                  kLog(controller
                                      .quizQuestionsModelList[
                                          controller.quizQuestionIndex.value]
                                      .questionList![
                                          controller.quizQuestionIndex.value]
                                      .studentAnswerIds!);
                                },
                                activeColor: AppColor.activeTab,
                              )),
                          Text(
                            "${String.fromCharCode("A".codeUnitAt(0) + index)}. ",
                            style: kBody.copyWith(color: Colors.black87),
                          ),
                          Text(
                            optionsModel.option!,
                            style: kBody.copyWith(color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              height: AppSpacing.sm,
              color: Colors.transparent,
            );
          },
        ));
  }

  _vResultTable() {
    double cellVerMargin = 8;
    double cellHorMargin = 16;
    return Obx(() => Expanded(
          child: /*  controller.quizResultList.value == null
              ? Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Please wait...",
                    style: kLabel,
                  ),
                )
              :  */
              controller.quizResultList.isEmpty
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
                                11: IntrinsicColumnWidth(),
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
                                          'Quiz Date',
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
                                // for (var item in controller.userInfoModelList) // correct

                                for (var item
                                    in controller.quizResultList) // test

                                  TableRow(
                                    // table decoration
                                    decoration: BoxDecoration(
                                        color: /* controller.userInfoModelList.indexOf(item) */
                                            controller.quizResultList
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
                                            (controller.quizResultList
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            item.quizDeclare!.quiz!.quizName ??
                                                "",
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
                                            Utils().getTimeFromTimeStamp(
                                                item
                                                    .quizDeclare!
                                                    .quizDeclareSettings!
                                                    .startDateTime!,
                                                kAppDateFormat),
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
                                            Utils().getTimeFromTimeStamp(
                                                item
                                                    .quizDeclare!
                                                    .quizDeclareSettings!
                                                    .startDateTime!,
                                                kAppTimeFormat12),
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
                                            item.quizDeclare!
                                                .quizDeclareSettings!.duration
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            item.totalQuestion.toString(),
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
                                            item.quizTime.toString(),
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
                                            item.totalAnswer.toString(),
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
                                            item.totalRightAnswer.toString(),
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
                                            item.totalWrongAnswer.toString(),
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
                                            double.parse(
                                                    item.rightAnsPercentage ??
                                                        "0")
                                                .toStringAsFixed(2),
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
                                          // item.quizDeclare!.quiz!.status == 1
                                          item.joinStatus == 1
                                              ? AppButtons.vNarrowButton(
                                                      onTap: () {},
                                                      text: "Present",
                                                      bg: AppColor.green,
                                                      textColor: AppColor.white)
                                                  .marginSymmetric(
                                                      vertical: cellVerMargin,
                                                      horizontal: cellHorMargin)
                                              : AppButtons.vNarrowButton(
                                                      onTap: () {},
                                                      text: "Absent",
                                                      bg: AppColor.red,
                                                      textColor: AppColor.white)
                                                  .marginSymmetric(
                                                      vertical: cellVerMargin,
                                                      horizontal:
                                                          cellHorMargin),
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

  _vScheduleTable() {
    double cellVerMargin = 8;
    double cellHorMargin = 16;
    return Obx(() => Expanded(
          child: controller.quizScheduleList.isEmpty
              ? Container(
                  alignment: Alignment.center,
                  child: Text(
                    "No Data!",
                    style: kLabel.copyWith(color: AppColor.red),
                  ))
              : SingleChildScrollView(
                  controller: controller.quizScheduleListScrlCtrlr.value,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                              ],
                            ),
                            // for (var item in controller.userInfoModelList) // correct

                            for (var item
                                in controller.quizScheduleList) // test

                              TableRow(
                                // table decoration
                                decoration: BoxDecoration(
                                    color: /* controller.userInfoModelList.indexOf(item) */
                                        controller.quizScheduleList
                                                        .indexOf(item) %
                                                    2 ==
                                                0
                                            ? AppColor.secondaryColor
                                                .withOpacity(.4)
                                            : AppColor.secondaryColor
                                                .withOpacity(.2)),
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        (controller.quizScheduleList
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        item.quizDeclare!.quiz!.quizName ?? "",
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        Utils().getTimeFromTimeStamp(
                                            item
                                                .quizDeclare!
                                                .quizDeclareSettings!
                                                .startDateTime!,
                                            kAppDateFormat),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        Utils().getTimeFromTimeStamp(
                                            item
                                                .quizDeclare!
                                                .quizDeclareSettings!
                                                .startDateTime!,
                                            kAppTimeFormat12),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        item.quizDeclare!.quizDeclareSettings!
                                            .duration
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // item.quizDeclare!.quiz!.status == 1
                                      item.quizDeclare!.quizDeclareSettings!
                                                  .isCancel ==
                                              1
                                          ? Text(
                                              "Cancelled",
                                              style: kBody.copyWith(
                                                  color: Colors.red),
                                            ).marginSymmetric(
                                              vertical: cellVerMargin,
                                              horizontal: cellHorMargin)
                                          : item
                                                      .quizDeclare!
                                                      .quizDeclareSettings!
                                                      .isEnd ==
                                                  0
                                              ? Text(
                                                  "Running",
                                                  style: kBody.copyWith(
                                                      color: Colors.green),
                                                ).marginSymmetric(
                                                  vertical: cellVerMargin,
                                                  horizontal: cellHorMargin)
                                              : Text(
                                                  "Ended",
                                                  style: kBody.copyWith(
                                                      color: Colors.black),
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

  _vQuizMissedMessage() {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.activeTab, width: .5)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("You missed this quiz!",
                // Text("Before Quiz",
                style: kBody.copyWith(
                  fontSize: 16,
                  color: AppColor.red,
                  fontWeight: FontWeight.w500,
                ))
          ],
        ),
      ),
    );
  }

  _vQuizNotfoundMessage() {
    return Expanded(
        child: Center(
      child: Text(
        "No active quiz. Please check again later.",
        style: kBody.copyWith(
          color: Colors.amber.shade700,
        ),
      ),
    ));
  }

  _vQuizSubmitedMessage() {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.activeTab, width: .5)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: AssetImage(done),
              width: 48,
              height: 48,
              fit: BoxFit.contain,
            ),
            AppSpacing.md.height,
            Text("You submitted this quiz!",
                // Text("Before Quiz",
                style: kBody.copyWith(
                  fontSize: 16,
                  color: AppColor.green,
                  fontWeight: FontWeight.w500,
                ))
          ],
        ),
      ),
    );
  }
  // codes start from here
  // All methods should be  to maintain singleton instances
}
