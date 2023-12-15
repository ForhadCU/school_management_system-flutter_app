import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/PUBLIC/academic_calendar_controller.dart';
import 'package:school_management_system/Model/PUBLIC/academicCalendar/academic_grp_api_model.dart';
import 'package:school_management_system/Model/PUBLIC/academicCalendar/monthwise_event_cal_api_model.dart';
import 'package:school_management_system/Utils/custom_utils.dart';
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
  static final controller = AcademicCalendarController.to;

  static Widget vDropdown() {
    return Obx(
      () => Row(
        children: [
          Text("Academic Group :",
              style: kBody.copyWith(
                // color: AppColor.kGray700,
              )),
          AppSpacing.sm.width,
          DropdownButton<AcademicGroupModel>(
            value: controller.academicGrpDropdownValue.value,
            icon: const Icon(Icons.keyboard_arrow_down),
            iconSize: 12,
            elevation: 10,
            // style: kBody.copyWith(fontWeight: FontWeight.w500),
            focusColor: AppColor.white,
            dropdownColor: Colors.white,
            isDense: true,
            isExpanded: false,
            underline: Container(
              height: 1,
              color: AppColor.kGray700.withOpacity(.5),
            ),
            onChanged: (AcademicGroupModel? selectedModel) {
              // int index = controller.academicGroupModeList.indexOf(newValue);
              // print(controller.academicGroupModeList[index]);
              controller.mUpdateAcademicGroupSelection(selectedModel!);
            },
            items: /* <String>["Recent", "Older"] */
                controller.academicGroupModeList
                    .map<DropdownMenuItem<AcademicGroupModel>>(
                        (AcademicGroupModel value) {
              return DropdownMenuItem<AcademicGroupModel>(
                value: value,
                child: Text(
                  value.academicGroupName!,
                  style: kBody.copyWith(fontWeight: FontWeight.w500),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  static vAcademicCalendar() {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // AppSpacing.sm.width,
                _vCalendarHint(
                    label: 'Holiday',
                    boxColor: Utils.mParseColorFromHexCode(
                        hexCode: "#FF0000") /*  AppColor.holiday */),
                AppSpacing.sm.width,
                _vCalendarHint(
                    label: 'Event',
                    boxColor: Utils.mParseColorFromHexCode(hexCode: "#008000")),
                AppSpacing.sm.width,
                _vCalendarHint(
                    label: 'Examination',
                    boxColor: Utils.mParseColorFromHexCode(hexCode: "#0000FF")),
              ],
            ),
            AppSpacing.sm.height,
            controller.eventDateListModelList.isEmpty
                ? TableCalendar(
                    onPageChanged: (DateTime focusdate) {
                      print(focusdate.toString());
                    },
                    headerStyle: const HeaderStyle(
                        titleCentered: true,
                        decoration:
                            BoxDecoration(color: AppColor.secondaryColor)),
                    calendarFormat: CalendarFormat.month,
                    availableCalendarFormats: {CalendarFormat.month: "Month"},
                    calendarStyle: CalendarStyle(
                        isTodayHighlighted: false,
                        tableBorder: TableBorder.all(
                            color: AppColor.secondaryColor, width: 1)),
                    focusedDay: controller.focusDay.value,
                    firstDay: controller.firstDay,
                    lastDay: controller.lastDay,
                  )
                : TableCalendar(
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, day, focusedDay) {
                        for (List<EventDateList> element
                            in controller.eventDateListModelList) {
                          if (day.day == element.first.startDate!.day &&
                              day.month == element.first.startDate!.month &&
                              day.year == element.first.startDate!.year) {
                            return Container(
                              margin: EdgeInsets.all(AppSpacing.smh + 2),
                              decoration: BoxDecoration(
                                  color: Utils.mParseColorFromHexCode(
                                      hexCode: element.first
                                          .academicCalendarHead!.colorId!),
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Text(
                                  '${day.day}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }
                        }
                        return null;
                      },
                    ),
                    onPageChanged: (DateTime focusdate) {
                      print(focusdate.toString());
                    },
                    headerStyle: const HeaderStyle(
                        titleCentered: true,
                        decoration:
                            BoxDecoration(color: AppColor.secondaryColor)),
                    calendarFormat: CalendarFormat.month,
                    availableCalendarFormats: {CalendarFormat.month: "Month"},
                    calendarStyle: CalendarStyle(
                        isTodayHighlighted: false,
                        tableBorder: TableBorder.all(
                            color: AppColor.secondaryColor, width: 1)),
                    focusedDay: controller.focusDay.value,
                    firstDay: controller.firstDay,
                    lastDay: controller.lastDay,
                  ),
          ],
        ));
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

  static vEventList() {
    return Expanded(
        child: Obx(() => controller.eventDateListModelList.length == 0
            ? Center(
                child: Text(
                  "No event found.",
                  style:
                      kLabel.copyWith(color: AppColor.kGray700.withOpacity(.5)),
                ),
              )
            : ListView.separated(
                shrinkWrap: true,
                itemCount: controller.eventDateListModelList.length,
                itemBuilder: (context, index) {
                  final EventDateList eventDateList =
                      controller.eventDateListModelList[index].first;
                  return _vEventCard(
                    title: eventDateList.title!,
                    color: Utils.mParseColorFromHexCode(
                        hexCode: eventDateList.subheadColorId!),
                    date: Utils().getTimeFromTimeStamp(
                        eventDateList.startDate.toString(),
                        kAppDateFormatWithDayMonth),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: Colors.white,
                  );
                },
              )));
  }

  static _vEventCard(
      {required String title, required String date, required Color color}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSpacing.smh),
      child: Row(
        children: [
          Text(
            date,
            style: kBody.copyWith(
              color: color,
            ),
          ),
          AppSpacing.sm.width,
          Expanded(
            child: Text(
              title,
              style: kBody.copyWith(color: color, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  static vEventHeading() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Monthly Events List",
          style: kBody.copyWith(fontWeight: FontWeight.w500),
        ),
        Divider(
          color: AppColor.kGray300,
          thickness: .5,
        ),
      ],
    );
  }
}
