import 'package:flutter/material.dart';
import 'package:school_management_system/Views/TEACHER/attendance/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';


class TeachAttendance extends StatelessWidget {
  const TeachAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    // final _controller = TeachAttendanceController.to;
    return BaseWidget(
        title: "My Attendance".toUpperCase(),
        child: BaseWidgetChild(
          child: Column(children: [
            /*  Obx(() => _controller.isDailyAttendaceTabActive.value
                ? Expanded(child: StuAttendanceWidgets.vDailyAttendance())
                : Expanded(child: StuAttendanceWidgets.vPeriodicAttendance())), */
            Expanded(child: TeachAttendanceWidgets.vDailyAttendance())
          ]),
        ));
  }
}
