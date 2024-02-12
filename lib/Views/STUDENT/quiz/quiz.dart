import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/student_library.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Views/STUDENT/quiz/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

class StuQuiz extends StatelessWidget {
  const StuQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "My Quiz",
        child: BaseWidgetChild(
            child: Column(children: [
          StuQuizWidgets.vTabBar(),
          // AppSpacing.smh.height,
          StuQuizWidgets.vLiveQuiz(),
          StuQuizWidgets.vQuizSchedule(),
          StuQuizWidgets.vQuizResult()
          /*   StuQuizWidgets.vQuizCounterProgressbar(),
              SizedBox(height: 20),
              StuQuizWidgets.vNextAndPreviousButtons() */
        ])));
  }
}
