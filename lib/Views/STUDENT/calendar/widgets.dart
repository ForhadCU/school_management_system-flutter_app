/* import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/student_library.dart';
import 'package:school_management_system/Model/STUDENT/calendar/stu_calendar_model.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../Config/config.dart';
import '../../../Model/STUDENT/calendar/stu_acdemic_grp_model.dart';
import '../../../Utils/custom_utils.dart';

class StuCalendarWidgets {
  
  // make this class singleton
  StuCalendarWidgets._internal();
  static final StuCalendarWidgets _singleton = StuCalendarWidgets._internal();
  factory StuCalendarWidgets() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static final controller = StuCalendarController.to;

  static Widget vDropdown() {
    return Obx(
      () => Row(
        children: [
          Text("Academic Group :",
              style: kBody.copyWith(
                  // color: AppColor.kGray700,
                  )),
          AppSpacing.sm.width,
          DropdownButton<StuAcademicGroupModel>(
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
            onChanged: (StuAcademicGroupModel? selectedModel) {
              // int index = controller.academicGroupModeList.indexOf(newValue);
              // print(controller.academicGroupModeList[index]);
              // controller.mUpdateAcademicGroupSelection(selectedModel!);
            },
            items: /* <String>["Recent", "Older"] */
                controller.academicGroupModeList
                    .map<DropdownMenuItem<StuAcademicGroupModel>>(
                        (StuAcademicGroupModel value) {
              return DropdownMenuItem<StuAcademicGroupModel>(
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
                      if (controller.toDay.value == focusdate) {
                        controller.currentPageIndex.value = 0;
                        controller.mGetEventDateList();
                      } else if (controller.toDay.value.millisecondsSinceEpoch >
                          focusdate.millisecondsSinceEpoch) {
                        controller.toDay.value = focusdate;
                        controller.currentPageIndex.value =
                            controller.currentPageIndex.value - 1;
                        controller.mGetEventDateList();
                      } else {
                        controller.toDay.value = focusdate;
                        controller.currentPageIndex.value =
                            controller.currentPageIndex.value + 1;
                        controller.mGetEventDateList();
                      }

                      print(controller.currentPageIndex);
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
                    focusedDay: controller.toDay.value,
                    firstDay: controller.firstDay,
                    lastDay: controller.lastDay,
                  )
                : TableCalendar(
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, day, focusedDay) {
                        for (List<StuEventDateList> element
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
                      if (controller.toDay.value == focusdate) {
                        controller.currentPageIndex.value = 0;
                        controller.mGetEventDateList();
                      } else if (controller.toDay.value.millisecondsSinceEpoch >
                          focusdate.millisecondsSinceEpoch) {
                        controller.toDay.value = focusdate;
                        controller.currentPageIndex.value =
                            controller.currentPageIndex.value - 1;
                        controller.mGetEventDateList();
                      } else {
                        controller.toDay.value = focusdate;
                        controller.currentPageIndex.value =
                            controller.currentPageIndex.value + 1;
                        controller.mGetEventDateList();
                      }

                      print(controller.currentPageIndex);
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
                    focusedDay: controller.toDay.value,
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
                  final StuEventDateList eventDateList =
                      controller.eventDateListModelList[index].first;
                  return _vEventCard(
                    title: eventDateList.title!,
                    color: Utils.mParseColorFromHexCode(
                        hexCode: eventDateList.academicCalendarHead!.colorId!),
                    date: Utils().getTimeFromTimeStamp(
                        eventDateList.startDate.toString(),
                        kAppDateFormatWithDayMonth),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    thickness: .5,
                    
                    color: Colors.black12,
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
          Expanded(
            child: Text(
              date,
              style: kBody.copyWith(
                color: color,
              ),
            ),
          ),
          AppSpacing.sm.width,
          Expanded(
            flex: 7,
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
          color: Colors.black45,
          thickness: .5,
        ),
      ],
    );
  }
}
 */