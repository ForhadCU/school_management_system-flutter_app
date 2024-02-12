import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Model/STUDENT/quiz/quiz_questions_model.dart';
import 'package:school_management_system/Utils/custom_utils.dart';
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
  static final List<QuizQuestionsModel> _quizQuestionsModelList =
      _controller.quizQuestionsModelList;
  static QuizQuestionsModel _quizQuestionsModel =
      _quizQuestionsModelList[_controller.quizQuestionIndex.value] ??
          QuizQuestionsModel();

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
                  // text: "Quiz Schedule",
                  text: "Schedule",
                  isActive: _controller.isQuizScheduleActive.value,
                  // isActive: false,
                  onTap: () {
                    _controller.mUpdateQuizSchedule();
                  },
                ))),
        (AppSpacing.smh / 2).width,
        Expanded(
            child: Obx(() => CommonContainers.vTabItemContainer(
                  // text: "Quiz Result",
                  text: "Result",
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
        child: _controller.isLoading.value
            ? Container()
            : _controller.isQuizNotFound.value
                ? _vQuizNotfoundMessage()
                : _controller.isQuizMissed.value
                    ? _vQuizMissedMessage()
                    : _controller.isQuizStart.value
                        ? _controller.quizQuestionsModel.value == null
                            ? Container()
                            : _vQuizPart()
                        : _vQuizLaunchingPart()));
  }

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
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _controller.quizQuestionIndex.value <= 0
                  ? Container()
                  : AppButtons.vPrimaryButton(
                      onTap: () {
                        _controller.mGotoPreviousQuiz();
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
              _controller.quizQuestionIndex.value ==
                      _quizQuestionsModel.questionList!.length - 1
                  ? AppButtons.vPrimaryButton(
                      onTap: () {
                        _controller.mSubmitQuiz();
                      },
                      bg: AppColor.green,
                      text: "Submit Answer",
                      textColor: Colors.white)
                  : AppButtons.vPrimaryButton(
                      onTap: () {
                        _controller.mGotoNextQuiz();
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

  static _vQuizLaunchingPart() {
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
                  days: _controller.daysRemainingBeforeStart.value,
                  hours: _controller.hoursRemainingBeforeStart.value,
                  minutes: _controller.minsRemainingBeforeStart.value,
                  seconds: _controller.secsRemainingBeforeStart.value,

                  /*   days: 0,
                  hours: 0,
                  minutes: 0,
                  seconds: _controller.testTimer.value, */
                ),
              ),
              onEnd: () {
                print("Timer finished");
                _controller.isQuizStart.value = true;
              },
              onTick: (remainingTime) async {
                /* kLog(Utils()
                    .mCalculateSecsFromSecs(secs: remainingTime.inSeconds)); */
                if (remainingTime.inSeconds <= (60 * 20) &&
                    remainingTime.inSeconds > 0 &&
                    !_controller.isReady.value) {
                  _controller.isShownReady.value = true;
                  _controller.mGetRemainingTimeBeforeStart();
                  _controller.testTimer.value = remainingTime.inSeconds;
                }
                if (remainingTime.inSeconds == 0) {
                  if (_controller.isReady.value) {
                    _controller.isQuizStart.value = true;
                    await _controller.mGetQuizQuestions();
                  } else {
                    _controller.isQuizMissed.value = true;
                    _controller.isShownReady.value = false;
                  }
                }
              },
              descriptionTextStyle: kBody.copyWith(color: AppColor.kBlack),
              timeTextStyle: kTitle.copyWith(color: AppColor.kBlack),
            ),
            AppSpacing.xxl.height,

            /// Ready Button
            _controller.isShownReady.value
                ? AppButtons.vPrimaryButton(
                    onTap: () {
                      _controller.mRegisterToQuiz();
                    },
                    text: "Ready",
                    textColor: Colors.white,
                    bg: const Color.fromARGB(255, 13, 160, 18))
                : Container(),

            /// After Clicking on Ready Button
            _controller.isReady.value
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
            /*  _controller.isQuizMissed.value
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

  static _vQuizPart() {
    return Expanded(
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
                      Text(_controller
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
                            (_controller.quizQuestionIndex.value + 1)
                                .toString(),
                            style: kBody.copyWith(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "/",
                            style: kBody.copyWith(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            _quizQuestionsModel.questionList!.length.toString(),
                            style: kBody.copyWith(fontWeight: FontWeight.w500),
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
                  vNextAndPreviousButtons()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  static Container _vQuizPartHeading() {
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
                Text(
                    _controller.quizQuestionsModel.value.quizDetails!.quizName!,
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
                            hours: _controller.hoursRemainingBeforeStart.value,
                            minutes: _controller.minsRemainingBeforeStart.value,
                            seconds: _controller.secsRemainingBeforeStart.value,
                          ),
                        ),
                        onEnd: () {
                          kLog("Timer finished");
                        },
                        onTick: (remainingTime) async {
                          if (remainingTime.inSeconds == 0) {
                            await _controller.mSubmitQuiz();
                          }
                        },
                        enableDescriptions: false,
                        timeTextStyle: kBody.copyWith(
                            color: AppColor.red, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),

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
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
          color: AppColor.kBlack.withOpacity(.2)),
      alignment: Alignment.center,
      child: Html(
        data: _quizQuestionsModel
            .questionList![_controller.quizQuestionIndex.value].question
            .toString(),
      ), /* Text(
        // "What is the name of our country, can you tell us the shortform of the name?",
        _quizQuestionsModel
            .questionList![_controller.quizQuestionIndex.value].question
            .toString(),
        style:
            kBody.copyWith(color: AppColor.white, fontWeight: FontWeight.w500),
      ), */
    );
  }

  static _vQuizAnswers() {
    return Obx(() => ListView.separated(
          shrinkWrap: true,
          itemCount: _quizQuestionsModel
              .questionList![_controller.quizQuestionIndex.value]
              .siteQuizQuestionDetailsForStudent!
              .length,
          itemBuilder: (context, index) {
            final optionsModel = _quizQuestionsModel
                .questionList![_controller.quizQuestionIndex.value]
                .siteQuizQuestionDetailsForStudent![index];

            return _quizQuestionsModel
                        .questionList![_controller.quizQuestionIndex.value]
                        .answerCount ==
                    1
                ? Obx(
                    () => GestureDetector(
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
                              groupValue: _controller.selectedOption.value,
                              onChanged: (value) {
                                _controller.selectedOption.value = value;

                                /// save answer id into parent model
                                if (_controller
                                        .quizQuestionsModelList[
                                            _controller.quizQuestionIndex.value]
                                        .questionList![
                                            _controller.quizQuestionIndex.value]
                                        .studentAnswerIds!
                                        .isNotEmpty &&
                                    _controller
                                        .quizQuestionsModelList[
                                            _controller.quizQuestionIndex.value]
                                        .questionList![
                                            _controller.quizQuestionIndex.value]
                                        .studentAnswerIds!
                                        .contains(optionsModel.id)) {
                                  _controller
                                      .quizQuestionsModelList[
                                          _controller.quizQuestionIndex.value]
                                      .questionList![
                                          _controller.quizQuestionIndex.value]
                                      .studentAnswerIds!
                                      .removeWhere((element) =>
                                          element == optionsModel.id);
                                } else {
                                  _controller
                                      .quizQuestionsModelList[
                                          _controller.quizQuestionIndex.value]
                                      .questionList![
                                          _controller.quizQuestionIndex.value]
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
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      _controller.isModified.value =
                          !_controller.isModified.value;
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
                                value: _controller.answerIdList[index]
                                    ["selected"]
                                /* _controller
                                                .quizQuestionsModelList[
                                                    _controller
                                                        .quizQuestionIndex
                                                        .value]
                                                .questionList![_controller
                                                    .quizQuestionIndex.value]
                                                .studentAnswerIds!
                                                .isNotEmpty &&
                                            _controller
                                                .quizQuestionsModelList[
                                                    _controller
                                                        .quizQuestionIndex
                                                        .value]
                                                .questionList![_controller
                                                    .quizQuestionIndex.value]
                                                .studentAnswerIds!
                                                .contains(optionsModel.id)
                                        ? true
                                        : false */
                                ,
                                onChanged: (value) {
                                  // _controller.selectedOption.value = value!;
                                  _controller.answerIdList[index] = {
                                    "id": optionsModel.id,
                                    "selected": value
                                  };

                                  if (_controller
                                          .quizQuestionsModelList[_controller
                                              .quizQuestionIndex.value]
                                          .questionList![_controller
                                              .quizQuestionIndex.value]
                                          .studentAnswerIds!
                                          .isNotEmpty &&
                                      _controller
                                          .quizQuestionsModelList[_controller
                                              .quizQuestionIndex.value]
                                          .questionList![_controller
                                              .quizQuestionIndex.value]
                                          .studentAnswerIds!
                                          .contains(optionsModel.id)) {
                                    _controller
                                        .quizQuestionsModelList[
                                            _controller.quizQuestionIndex.value]
                                        .questionList![
                                            _controller.quizQuestionIndex.value]
                                        .studentAnswerIds!
                                        .removeWhere((element) =>
                                            element == optionsModel.id);
                                  } else {
                                    _controller
                                        .quizQuestionsModelList[
                                            _controller.quizQuestionIndex.value]
                                        .questionList![
                                            _controller.quizQuestionIndex.value]
                                        .studentAnswerIds!
                                        .add(optionsModel.id);
                                  }

                                  kLog(_controller
                                      .quizQuestionsModelList[
                                          _controller.quizQuestionIndex.value]
                                      .questionList![
                                          _controller.quizQuestionIndex.value]
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

  static _vResultTable() {
    double cellVerMargin = 8;
    double cellHorMargin = 16;
    return Obx(() => Expanded(
          child: /*  _controller.quizResultList.value == null
              ? Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Please wait...",
                    style: kLabel,
                  ),
                )
              :  */
              _controller.quizResultList.isEmpty
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
                                // for (var item in _controller.userInfoModelList) // correct

                                for (var item
                                    in _controller.quizResultList) // test

                                  TableRow(
                                    // table decoration
                                    decoration: BoxDecoration(
                                        color: /* _controller.userInfoModelList.indexOf(item) */
                                            _controller.quizResultList
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
                                            (_controller.quizResultList
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
                                          item.quizDeclare!.quiz!.status == 1
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

  static _vScheduleTable() {
    double cellVerMargin = 8;
    double cellHorMargin = 16;
    return Obx(() => Expanded(
          child: _controller.quizScheduleList.isEmpty
              ? Container(
                  alignment: Alignment.center,
                  child: Text(
                    "No Data!",
                    style: kLabel.copyWith(color: AppColor.red),
                  ))
              : SingleChildScrollView(
                  controller: _controller.quizScheduleListScrlCtrlr.value,
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
                                /*  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                ), */
                              ],
                            ),
                            // for (var item in _controller.userInfoModelList) // correct

                            for (var item
                                in _controller.quizScheduleList) // test

                              TableRow(
                                // table decoration
                                decoration: BoxDecoration(
                                    color: /* _controller.userInfoModelList.indexOf(item) */
                                        _controller.quizScheduleList
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
                                        (_controller.quizScheduleList
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
                                  /* Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                  ), */
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

  static _vQuizMissedMessage() {
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

  static _vQuizNotfoundMessage() {
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
  // codes start from here
  // All methods should be static to maintain singleton instances
}
