import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/PUBLIC/academic_calendar_controller.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Views/PUBLIC/academicCalendar/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

class AcademicCalendar extends StatelessWidget {
  const AcademicCalendar({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Academic Calander".toUpperCase(),
        child: BaseWidgetChild(
            child: Column(
                  children: [
                    AcademicCalanderWidget.vDropdown(),
                    AppSpacing.xl.height,
                    AcademicCalanderWidget.vAcademicCalendar(),
                    AppSpacing.md.height,
                    AcademicCalanderWidget.vEventHeading(),
                    AppSpacing.sm.height,
                    AcademicCalanderWidget.vEventList(),
                  ],
                ),
        ));
  }
}
