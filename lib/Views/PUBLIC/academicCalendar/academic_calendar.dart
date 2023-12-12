import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Views/PUBLIC/academicCalendar/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../Config/config.dart';
import '../../../Controller/academic_calendar.dart';

class AcademicCalendar extends StatelessWidget {
  const AcademicCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AcademicCalendarController.to;

    return GetBuilder<AcademicCalendarController>(
      builder:(controller) =>  BaseWidget(
          title: "Academic Calander".toUpperCase(),
          child: BaseWidgetChild(
            child: Column(
              children: [
                // AcademicCalanderWidget.vAcademicCalendar(controller),
    
               TableCalendar(
                      onPageChanged: (DateTime focusdate) {
                        print(focusdate.toString());
                      },
                      eventLoader: (day) => controller.events[day] ?? [],
                      headerStyle: const HeaderStyle(
                          titleCentered: true,
                          decoration:
                              BoxDecoration(color: AppColor.secondaryColor)),
                      calendarFormat: CalendarFormat.month,
                      availableCalendarFormats: {CalendarFormat.month: "Month"},
                      calendarStyle: CalendarStyle(
                          tableBorder: TableBorder.all(
                              color: AppColor.orange500, width: 1)),
                      focusedDay: controller.focusDay.value,
                      firstDay: DateTime.now().subtract(Duration(days: 300)),
                      lastDay: DateTime.now().add(
                        const Duration(
                          days: 34,
                        ),
                      ),
    
                      //... other properties remain the same as in the previous example
                      selectedDayPredicate: (day) =>
                          isSameDay(controller.selectedDay.value, day),
                      onDaySelected: (selectedDay, focusedDay) {
                        controller.onDaySelected(selectedDay, focusedDay);
                      },
                      onRangeSelected: (start, end, focusedDay) {
                        controller.onRangeSelected(start!, end!, focusedDay);
                      },
                    ),
              ],
            ),
          )),
    );
  }
}
