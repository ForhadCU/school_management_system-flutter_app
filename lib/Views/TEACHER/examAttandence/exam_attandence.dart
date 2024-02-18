import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/TEACHER/examAttandence/exam_attandence_controller.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Views/TEACHER/examAttandence/widgets.dart';

import '../../../Config/config.dart';
import '../../../Controller/common/common_controller.dart';
import '../../Widgets/base_widget.dart';
import '../home/widgets.dart';

class ExamAttendance extends StatelessWidget {
  const ExamAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Exam Attendance",
        child: BaseWidgetChild(
          child: Column(
            children: [
              // ExamAttendanceWidgets.vTabBar(),
              ExamAttendanceWidgets.vExamAttendanceTopbar(),
              AppSpacing.sm.height,
              ExamAttendanceWidgets.vExamAttendanceTab(),

              /*  AppSpacing.md.height,
              ExamAttendanceWidgets.vUpdateButton(), */
            ],
          ),
        ));
  }
}
