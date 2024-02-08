import 'package:flutter/material.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/TEACHER/periodicAttendance/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../Config/config.dart';

class TeachPeriodicAttendance extends StatelessWidget {
  const TeachPeriodicAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Periodic Attendance",
        child: BaseWidgetChild(
            child: Column(
          children: [
            TeachPeriodicAttendanceWidgets.vPeriodicAttendanceTopbar(),
            AppSpacing.md.height,
            const Divider(height: 1, thickness: .3, color: Colors.black12),
            AppSpacing.md.height,
            TeachPeriodicAttendanceWidgets.vPeriodicAttendanceTable(),
            AppSpacing.sm.height,
            TeachPeriodicAttendanceWidgets.vUpdateAttendanceBtn(),
          ],
        )));
  }
}
