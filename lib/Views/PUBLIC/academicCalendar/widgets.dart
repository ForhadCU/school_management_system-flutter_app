import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/academic_calendar.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../Config/config.dart';

class AcademicCalanderWidget {
  AcademicCalanderWidget._internal();
  static final AcademicCalanderWidget _singleton =
      AcademicCalanderWidget._internal();
  factory AcademicCalanderWidget() {
    return _singleton;
  }
  // static final controller = AcademicCalendarController.to;
  static vAcademicCalendar(AcademicCalendarController controller) {
    return   Padding(
      padding: const EdgeInsets.all(AppSpacing.primaryPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // AppSpacing.sm.width,
              _vCalendarHint(label: 'Holiday', boxColor: AppColor.red),
              AppSpacing.sm.width,
              _vCalendarHint(label: 'Event', boxColor: AppColor.green),
              AppSpacing.sm.width,
              _vCalendarHint(
                  label: 'Examination', boxColor: AppColor.silverLakeBlue),
            ],
          ),
          AppSpacing.sm.height,
         TableCalendar(
                onPageChanged: (DateTime focusdate) {
                  print(focusdate.toString());
                },
                eventLoader: (day) => controller.events[day] ?? [],
                headerStyle: const HeaderStyle(
                    titleCentered: true,
                    decoration: BoxDecoration(color: AppColor.secondaryColor)),
                calendarFormat: CalendarFormat.month,
                availableCalendarFormats: {CalendarFormat.month: "Month"},
                calendarStyle: CalendarStyle(
                    tableBorder:
                        TableBorder.all(color: AppColor.orange500, width: 1)),
                focusedDay: controller.focusDay.value,
                firstDay: DateTime.now().subtract(Duration(days: 300)),
                lastDay: DateTime.now().add(
                  const Duration(
                    days: 34,
                  ),
                ),
                onDaySelected: (selectedDay, focusedDay) {
                  controller.focusDay.value = focusedDay;
                  print(controller.focusDay.value);
                },
              ),
        ],
      ),
    );
  }

  static _vCalendarHint({required String label, required Color boxColor}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// hint box
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(color: boxColor),
        ),
        AppSpacing.smh.width,
        Text(
          label,
          style: kLabel,
        )
      ],
    );
  }
}
