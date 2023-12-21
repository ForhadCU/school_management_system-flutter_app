import 'package:flutter/material.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/STUDENT/calendar/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../Config/config.dart';

class StuCalendar extends StatelessWidget {
  const StuCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Academic Calendar",
        child: BaseWidgetChild(
          child: Column(
            children: [
              /* StuCalendarWidgets.vDropdown(),
              AppSpacing.xl.height, */
              StuCalendarWidgets.vAcademicCalendar(),
              AppSpacing.md.height,
              StuCalendarWidgets.vEventHeading(),
              AppSpacing.sm.height,
              StuCalendarWidgets.vEventList(),
            ],
          ),
        ));
  }
}
