import 'package:flutter/material.dart';
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
              AcademicCalanderWidget.vAcademicCalendar(),
            ],
          ),
        ));
  }
}
