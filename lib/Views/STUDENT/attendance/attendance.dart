import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/student_library.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/STUDENT/attendance/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

class StuAttendance extends StatelessWidget {
  const StuAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = StuAttendanceController.to;
    return BaseWidget(
        title: "My Attendance".toUpperCase(),
        child: BaseWidgetChild(
          child: Column(children: [
            Obx(() => _controller.isDailyAttendaceTabActive.value
                ? Expanded(child: StuAttendanceWidgets.vDailyAttendance())
                : Expanded(child: StuAttendanceWidgets.vPeriodicAttendance())),
          ]),
        ));
  }
}
