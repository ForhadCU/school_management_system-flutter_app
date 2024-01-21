import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/TEACHER/examMarksEntry/exam_marks_entry_controller.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../../Config/config.dart';
import '../../Widgets/buttons.dart';
import '../../Widgets/custom_container.dart';

class ExamMarksEntryWidgets {

  // make this class singleton
  ExamMarksEntryWidgets._internal();
  static final ExamMarksEntryWidgets _singleton =
      ExamMarksEntryWidgets._internal();
  factory ExamMarksEntryWidgets() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static final controller = ExamMarksEntryController.to;

  static vTabBar() {
    return Row(
      children: [
        Expanded(
          child: CommonContainers.vTabItemContainer(
              text: "Subject Base Marks",
              // isActive: _controller.isDailyAttendaceActive.value,
              isActive: true,
              onTap: () {
                // _controller.mUpdateDailyAttendanceTabItem();
              }),
        ),
        (AppSpacing.smh / 2).width,
        Expanded(
            child: CommonContainers.vTabItemContainer(
          text: "Students Base Marks",
          // isActive: _controller.isPeriodicAttendaceActive.value,
          isActive: false,

          onTap: () {
            // _controller.mUpdatePeriodicAttendanceTabItem();
          },
        )),
      ],
    );
  }

  static vSubjectBasedMarksEntryTopbar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.md, horizontal: AppSpacing.sm),
          decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(8),
              color: AppColor.activeTab),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _vDropdowns1(),
              AppSpacing.xl.height,
              _vGetResultBtn(),
            ],
          ),
        ),
      ],
    );
  }

  static _vDropdowns1() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                color: AppColor.frenchSkyBlue100,
                /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                // child: DropdownButton<StuHistoryModel>(
                child: DropdownButton<String>(
                  // value: _controller.selectedStudentHistory.value,
                  hint: Text(
                    "Select Year",
                    style: kBody.copyWith(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  // style: kBody.copyWith(fontWeight: FontWeight.w500),
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  // onChanged: (StuHistoryModel? selectedModel) {
                  //   _controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* _controller.stuHistoryList.map((StuHistoryModel value) {
                        return DropdownMenuItem<StuHistoryModel>(
                          value: value,
                          child: Text(
                            value.stClass!.className!,
                            style: kBody.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      } */
                      <String>["Option1", "Option2"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            AppSpacing.sm.width,
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                color: AppColor.frenchSkyBlue100,
                /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                // child: DropdownButton<StuHistoryModel>(
                child: DropdownButton<String>(
                  // value: controller.academicGrpDropdownValue.value,
                  // value: _controller.selectedStudentHistory.value,
                  hint: Text(
                    "Select Shift",
                    style: kBody.copyWith(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  // style: kBody.copyWith(fontWeight: FontWeight.w500),
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  // onChanged: (StuHistoryModel? selectedModel) {
                  //   _controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* _controller.stuHistoryList.map((StuHistoryModel value) {
                        return DropdownMenuItem<StuHistoryModel>(
                          value: value,
                          child: Text(
                            value.stClass!.className!,
                            style: kBody.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      } */
                      <String>["Option1", "Option2"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        AppSpacing.sm.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                color: AppColor.frenchSkyBlue100,
                /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                // child: DropdownButton<StuHistoryModel>(
                child: DropdownButton<String>(
                  // value: _controller.selectedStudentHistory.value,
                  hint: Text(
                    "Select Class",
                    style: kBody.copyWith(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  // style: kBody.copyWith(fontWeight: FontWeight.w500),
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  // onChanged: (StuHistoryModel? selectedModel) {
                  //   _controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* _controller.stuHistoryList.map((StuHistoryModel value) {
                        return DropdownMenuItem<StuHistoryModel>(
                          value: value,
                          child: Text(
                            value.stClass!.className!,
                            style: kBody.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      } */
                      <String>["Option1", "Option2"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            AppSpacing.sm.width,
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                color: AppColor.frenchSkyBlue100,
                /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                // child: DropdownButton<StuHistoryModel>(
                child: DropdownButton<String>(
                  // value: controller.academicGrpDropdownValue.value,
                  // value: _controller.selectedStudentHistory.value,
                  hint: Text(
                    "Select Group",
                    style: kBody.copyWith(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  // style: kBody.copyWith(fontWeight: FontWeight.w500),
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  // onChanged: (StuHistoryModel? selectedModel) {
                  //   _controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* _controller.stuHistoryList.map((StuHistoryModel value) {
                        return DropdownMenuItem<StuHistoryModel>(
                          value: value,
                          child: Text(
                            value.stClass!.className!,
                            style: kBody.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      } */
                      <String>["Option1", "Option2"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        AppSpacing.sm.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                color: AppColor.frenchSkyBlue100,
                /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                // child: DropdownButton<StuHistoryModel>(
                child: DropdownButton<String>(
                  // value: _controller.selectedStudentHistory.value,
                  hint: Text(
                    "Select Section",
                    style: kBody.copyWith(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  // style: kBody.copyWith(fontWeight: FontWeight.w500),
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  // onChanged: (StuHistoryModel? selectedModel) {
                  //   _controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* _controller.stuHistoryList.map((StuHistoryModel value) {
                        return DropdownMenuItem<StuHistoryModel>(
                          value: value,
                          child: Text(
                            value.stClass!.className!,
                            style: kBody.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      } */
                      <String>["Option1", "Option2"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            AppSpacing.sm.width,
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                color: AppColor.frenchSkyBlue100,
                /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                // child: DropdownButton<StuHistoryModel>(
                child: DropdownButton<String>(
                  // value: controller.academicGrpDropdownValue.value,
                  // value: _controller.selectedStudentHistory.value,
                  hint: Text(
                    "Select Session",
                    style: kBody.copyWith(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  // style: kBody.copyWith(fontWeight: FontWeight.w500),
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  // onChanged: (StuHistoryModel? selectedModel) {
                  //   _controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* _controller.stuHistoryList.map((StuHistoryModel value) {
                        return DropdownMenuItem<StuHistoryModel>(
                          value: value,
                          child: Text(
                            value.stClass!.className!,
                            style: kBody.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      } */
                      <String>["Option1", "Option2"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        AppSpacing.sm.height,
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                color: AppColor.frenchSkyBlue100,
                /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                // child: DropdownButton<StuHistoryModel>(
                child: DropdownButton<String>(
                  // value: _controller.selectedStudentHistory.value,
                  hint: Text(
                    "Select Exam",
                    style: kBody.copyWith(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  // style: kBody.copyWith(fontWeight: FontWeight.w500),
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  // onChanged: (StuHistoryModel? selectedModel) {
                  //   _controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* _controller.stuHistoryList.map((StuHistoryModel value) {
                        return DropdownMenuItem<StuHistoryModel>(
                          value: value,
                          child: Text(
                            value.stClass!.className!,
                            style: kBody.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      } */
                      <String>["Option1", "Option2"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        AppSpacing.sm.height,
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                color: AppColor.frenchSkyBlue100,
                /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                // child: DropdownButton<StuHistoryModel>(
                child: DropdownButton<String>(
                  // value: _controller.selectedStudentHistory.value,
                  hint: Text(
                    "Select Subject",
                    style: kBody.copyWith(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  // style: kBody.copyWith(fontWeight: FontWeight.w500),
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  // onChanged: (StuHistoryModel? selectedModel) {
                  //   _controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* _controller.stuHistoryList.map((StuHistoryModel value) {
                        return DropdownMenuItem<StuHistoryModel>(
                          value: value,
                          child: Text(
                            value.stClass!.className!,
                            style: kBody.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      } */
                      <String>["Option1", "Option2"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  static _vDropdowns2() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                color: AppColor.frenchSkyBlue100,
                /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                // child: DropdownButton<StuHistoryModel>(
                child: DropdownButton<String>(
                  // value: _controller.selectedStudentHistory.value,
                  hint: Text(
                    "Select Year",
                    style: kBody.copyWith(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  // style: kBody.copyWith(fontWeight: FontWeight.w500),
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  // onChanged: (StuHistoryModel? selectedModel) {
                  //   _controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* _controller.stuHistoryList.map((StuHistoryModel value) {
                        return DropdownMenuItem<StuHistoryModel>(
                          value: value,
                          child: Text(
                            value.stClass!.className!,
                            style: kBody.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      } */
                      <String>["Option1", "Option2"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            AppSpacing.sm.width,
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                color: AppColor.frenchSkyBlue100,
                /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                // child: DropdownButton<StuHistoryModel>(
                child: DropdownButton<String>(
                  // value: controller.academicGrpDropdownValue.value,
                  // value: _controller.selectedStudentHistory.value,
                  hint: Text(
                    "Select Shift",
                    style: kBody.copyWith(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  // style: kBody.copyWith(fontWeight: FontWeight.w500),
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  // onChanged: (StuHistoryModel? selectedModel) {
                  //   _controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* _controller.stuHistoryList.map((StuHistoryModel value) {
                        return DropdownMenuItem<StuHistoryModel>(
                          value: value,
                          child: Text(
                            value.stClass!.className!,
                            style: kBody.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      } */
                      <String>["Option1", "Option2"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        AppSpacing.sm.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                color: AppColor.frenchSkyBlue100,
                /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                // child: DropdownButton<StuHistoryModel>(
                child: DropdownButton<String>(
                  // value: _controller.selectedStudentHistory.value,
                  hint: Text(
                    "Select Class",
                    style: kBody.copyWith(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  // style: kBody.copyWith(fontWeight: FontWeight.w500),
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  // onChanged: (StuHistoryModel? selectedModel) {
                  //   _controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* _controller.stuHistoryList.map((StuHistoryModel value) {
                        return DropdownMenuItem<StuHistoryModel>(
                          value: value,
                          child: Text(
                            value.stClass!.className!,
                            style: kBody.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      } */
                      <String>["Option1", "Option2"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            AppSpacing.sm.width,
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                color: AppColor.frenchSkyBlue100,
                /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                // child: DropdownButton<StuHistoryModel>(
                child: DropdownButton<String>(
                  // value: controller.academicGrpDropdownValue.value,
                  // value: _controller.selectedStudentHistory.value,
                  hint: Text(
                    "Select Group",
                    style: kBody.copyWith(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  // style: kBody.copyWith(fontWeight: FontWeight.w500),
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  // onChanged: (StuHistoryModel? selectedModel) {
                  //   _controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* _controller.stuHistoryList.map((StuHistoryModel value) {
                        return DropdownMenuItem<StuHistoryModel>(
                          value: value,
                          child: Text(
                            value.stClass!.className!,
                            style: kBody.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      } */
                      <String>["Option1", "Option2"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        AppSpacing.sm.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                color: AppColor.frenchSkyBlue100,
                /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                // child: DropdownButton<StuHistoryModel>(
                child: DropdownButton<String>(
                  // value: _controller.selectedStudentHistory.value,
                  hint: Text(
                    "Select Section",
                    style: kBody.copyWith(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  // style: kBody.copyWith(fontWeight: FontWeight.w500),
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  // onChanged: (StuHistoryModel? selectedModel) {
                  //   _controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* _controller.stuHistoryList.map((StuHistoryModel value) {
                        return DropdownMenuItem<StuHistoryModel>(
                          value: value,
                          child: Text(
                            value.stClass!.className!,
                            style: kBody.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      } */
                      <String>["Option1", "Option2"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            AppSpacing.sm.width,
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                color: AppColor.frenchSkyBlue100,
                /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                // child: DropdownButton<StuHistoryModel>(
                child: DropdownButton<String>(
                  // value: controller.academicGrpDropdownValue.value,
                  // value: _controller.selectedStudentHistory.value,
                  hint: Text(
                    "Select Session",
                    style: kBody.copyWith(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  // style: kBody.copyWith(fontWeight: FontWeight.w500),
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  // onChanged: (StuHistoryModel? selectedModel) {
                  //   _controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* _controller.stuHistoryList.map((StuHistoryModel value) {
                        return DropdownMenuItem<StuHistoryModel>(
                          value: value,
                          child: Text(
                            value.stClass!.className!,
                            style: kBody.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      } */
                      <String>["Option1", "Option2"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        AppSpacing.sm.height,
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                color: AppColor.frenchSkyBlue100,
                /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                // child: DropdownButton<StuHistoryModel>(
                child: DropdownButton<String>(
                  // value: _controller.selectedStudentHistory.value,
                  hint: Text(
                    "Select Exam",
                    style: kBody.copyWith(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  // style: kBody.copyWith(fontWeight: FontWeight.w500),
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  // onChanged: (StuHistoryModel? selectedModel) {
                  //   _controller.mUpdateSelectedStuHistory(selectedModel);
                  // },
                  onChanged: (String? selectedModel) {
                    // _controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items:
                      /* _controller.stuHistoryList.map((StuHistoryModel value) {
                        return DropdownMenuItem<StuHistoryModel>(
                          value: value,
                          child: Text(
                            value.stClass!.className!,
                            style: kBody.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      } */
                      <String>["Option1", "Option2"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  static _vGetResultBtn() {
    return AppButtons.vPrimaryButtonWithGradient(
      onTap: () async {
        // await _controller.mGetResultPdf();
      },
      text: "Get List",
    );
  }

  static _vUpdateBtn() {
    return AppButtons.vPrimaryButtonWithGradient(
      onTap: () async {
        // await _controller.mGetResultPdf();
      },
      text: "Update",
    );
  }

  static vSubjectBasedMarksEntryTable() {
    double cellVerMargin = 8;
    double cellHorMargin = 16;
    return /*  Obx(() => */ SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ClipRRect(
                // borderRadius: BorderRadius.circular(12),
                child: Table(
              columnWidths: const <int, TableColumnWidth>{
                /*  0: m.sm
                                      ? const FlexColumnWidth()
                                      : const IntrinsicColumnWidth(), */
                // 1: FlexColumnWidth(),
                /*  1: FixedColumnWidth(AppScreenSize.mGetWidth(
                      kGlobContext, 30)), */
                0: IntrinsicColumnWidth(),
                1: IntrinsicColumnWidth(),
                2: IntrinsicColumnWidth(),
                3: IntrinsicColumnWidth(),
                4: IntrinsicColumnWidth(),
                5: IntrinsicColumnWidth(),
                6: IntrinsicColumnWidth(),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: TableBorder.all(color: AppColor.white),
              children: <TableRow>[
                TableRow(
                  // table decoration
                  decoration: const BoxDecoration(
                      // color: AppColor.secondaryColor),
                      color: AppColor.inactiveTab),
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '#',
                          style: kBody.copyWith(
                              color: AppColor.white,
                              fontWeight: FontWeight.w500),
                        ).marginSymmetric(
                            vertical: cellVerMargin, horizontal: cellHorMargin),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Student',
                          style: kBody.copyWith(
                              color: AppColor.white,
                              fontWeight: FontWeight.w500),
                        ).marginSymmetric(
                            vertical: cellVerMargin, horizontal: cellHorMargin),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Roll',
                          style: kBody.copyWith(
                              color: AppColor.white,
                              fontWeight: FontWeight.w500),
                        ).marginSymmetric(
                            vertical: cellVerMargin, horizontal: cellHorMargin),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Written',
                          style: kBody.copyWith(
                              color: AppColor.white,
                              fontWeight: FontWeight.w500),
                        ).marginSymmetric(
                            vertical: cellVerMargin, horizontal: cellHorMargin),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'MCQ',
                          style: kBody.copyWith(
                              color: AppColor.white,
                              fontWeight: FontWeight.w500),
                        ).marginSymmetric(
                            vertical: cellVerMargin, horizontal: cellHorMargin),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Practical',
                          style: kBody.copyWith(
                              color: AppColor.white,
                              fontWeight: FontWeight.w500),
                        ).marginSymmetric(
                            vertical: cellVerMargin, horizontal: cellHorMargin),
                      ],
                    ),
                  ],
                ),
                // for (var item in _controller.userInfoModelList) // correct

                for (var item in [
                  "Anamika Roy",
                  "Rafi Islam",
                  "Ankit Tewari",
                  "Anamika Roy",
                  "Rafi Islam",
                  "Ankit Tewari",
                  "Anamika Roy",
                  "Rafi Islam",
                  "Ankit Tewari",
                  "Anamika Roy",
                  "Rafi Islam",
                  "Ankit Tewari",
                ])
                  TableRow(
                    // table decoration
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColor.withOpacity(.4),
                      /*  _feeDetailsModel!.feeAllocationDetails!
                                        .indexOf(item) %
                                    2 ==
                                0
                            ? AppColor.secondaryColor.withOpacity(.4)
                            : AppColor.secondaryColor.withOpacity(.2) */
                    ),
                    children: <Widget>[
                      /// #
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            // _controller.mGetFormatDate(item.date),
                            ["Anamika Roy", "Rafi Islam", "Ankit Tewari"]
                                .indexOf(item)
                                .toString(),
                            style: kBody.copyWith(
                                color: AppColor.kBlack,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ).marginSymmetric(
                              vertical: cellVerMargin,
                              horizontal: cellHorMargin),
                        ],
                      ),

                      /// Name
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              item,
                              textAlign: TextAlign.start,
                              style: kBody.copyWith(
                                  color: AppColor.kBlack,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ).marginSymmetric(
                                vertical: cellVerMargin,
                                horizontal: cellHorMargin),
                          ),
                        ],
                      ),

                      /// Roll
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              "101",
                              textAlign: TextAlign.start,
                              style: kBody.copyWith(
                                  color: AppColor.kBlack,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ).marginSymmetric(
                                vertical: cellVerMargin,
                                horizontal: cellHorMargin),
                          ),
                        ],
                      ),

                      /// Written
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            child: TextFormField(
                              style: kBody,
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: AppSpacing.sm,
                                      horizontal: AppSpacing.sm),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black26))),
                            ).marginSymmetric(
                                vertical: cellVerMargin,
                                horizontal: cellHorMargin),
                          ),
                        ],
                      ),

                      /// MCQ
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: AppSpacing.sm,
                                      horizontal: AppSpacing.sm),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black26))),
                            ).marginSymmetric(
                                vertical: cellVerMargin,
                                horizontal: cellHorMargin),
                          ),
                        ],
                      ),

                      /// Practical
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: AppSpacing.sm,
                                      horizontal: AppSpacing.sm),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black26))),
                            ).marginSymmetric(
                                vertical: cellVerMargin,
                                horizontal: cellHorMargin),
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            )),
          ),
        ],
      ),
    );
  }

  static vSubjectBasedMarkEntry() {
    return Column(
      children: [
        ExamMarksEntryWidgets.vSubjectBasedMarksEntryTopbar(),
        AppSpacing.md.height,
        ExamMarksEntryWidgets.vSubjectBasedMarksEntryTable(),
        AppSpacing.sm.height,
        _vUpdateBtn(),
      ],
    );
  }

  static vStudentBasedMarkEntry() {
    return Column(
      children: [
        ExamMarksEntryWidgets.vStudentBasedMarksEntryTopbar(),
        AppSpacing.sm.height,
        ExamMarksEntryWidgets.vStudentList(),
        AppSpacing.sm.height,
        _vGetResultBtn(),
        AppSpacing.md.height,
        Divider(
          height: .5,
          thickness: .5,
          color: Colors.black12,
        ),
        AppSpacing.md.height,
        ExamMarksEntryWidgets.vStudentMarksEntryTable(),
        AppSpacing.sm.height,
        _vUpdateBtn(),
      ],
    );
  }

  static vStudentMarksEntryTable() {
    double cellVerMargin = 8;
    double cellHorMargin = 16;
    return /*  Obx(() => */ SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ClipRRect(
                // borderRadius: BorderRadius.circular(12),
                child: Table(
              columnWidths: const <int, TableColumnWidth>{
                /*  0: m.sm
                                      ? const FlexColumnWidth()
                                      : const IntrinsicColumnWidth(), */
                // 1: FlexColumnWidth(),
                /*  1: FixedColumnWidth(AppScreenSize.mGetWidth(
                      kGlobContext, 30)), */
                0: IntrinsicColumnWidth(),
                1: IntrinsicColumnWidth(),
                2: IntrinsicColumnWidth(),
                3: IntrinsicColumnWidth(),
                4: IntrinsicColumnWidth(),
                5: IntrinsicColumnWidth(),
                6: IntrinsicColumnWidth(),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: TableBorder.all(color: AppColor.white),
              children: <TableRow>[
                TableRow(
                  // table decoration
                  decoration: const BoxDecoration(
                      // color: AppColor.secondaryColor),
                      color: AppColor.inactiveTab),
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '#',
                          style: kBody.copyWith(
                              color: AppColor.white,
                              fontWeight: FontWeight.w500),
                        ).marginSymmetric(
                            vertical: cellVerMargin, horizontal: cellHorMargin),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Subject',
                          style: kBody.copyWith(
                              color: AppColor.white,
                              fontWeight: FontWeight.w500),
                        ).marginSymmetric(
                            vertical: cellVerMargin, horizontal: cellHorMargin),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Written',
                          style: kBody.copyWith(
                              color: AppColor.white,
                              fontWeight: FontWeight.w500),
                        ).marginSymmetric(
                            vertical: cellVerMargin, horizontal: cellHorMargin),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'MCQ',
                          style: kBody.copyWith(
                              color: AppColor.white,
                              fontWeight: FontWeight.w500),
                        ).marginSymmetric(
                            vertical: cellVerMargin, horizontal: cellHorMargin),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Practical',
                          style: kBody.copyWith(
                              color: AppColor.white,
                              fontWeight: FontWeight.w500),
                        ).marginSymmetric(
                            vertical: cellVerMargin, horizontal: cellHorMargin),
                      ],
                    ),
                  ],
                ),
                // for (var item in _controller.userInfoModelList) // correct

                for (var item in [
                  "Physics",
                  "Chemestry",
                  "Biology",
                ])
                  TableRow(
                    // table decoration
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColor.withOpacity(.4),
                      /*  _feeDetailsModel!.feeAllocationDetails!
                                        .indexOf(item) %
                                    2 ==
                                0
                            ? AppColor.secondaryColor.withOpacity(.4)
                            : AppColor.secondaryColor.withOpacity(.2) */
                    ),
                    children: <Widget>[
                      /// #
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            // _controller.mGetFormatDate(item.date),
                            ["Physics", "Chemestry", "Biology"]
                                .indexOf(item)
                                .toString(),
                            style: kBody.copyWith(
                                color: AppColor.kBlack,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ).marginSymmetric(
                              vertical: cellVerMargin,
                              horizontal: cellHorMargin),
                        ],
                      ),

                      /// Name
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              item,
                              textAlign: TextAlign.start,
                              style: kBody.copyWith(
                                  color: AppColor.kBlack,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ).marginSymmetric(
                                vertical: cellVerMargin,
                                horizontal: cellHorMargin),
                          ),
                        ],
                      ),

                      /// Written
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            child: TextFormField(
                              style: kBody,
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: AppSpacing.sm,
                                      horizontal: AppSpacing.sm),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black26))),
                            ).marginSymmetric(
                                vertical: cellVerMargin,
                                horizontal: cellHorMargin),
                          ),
                        ],
                      ),

                      /// MCQ
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: AppSpacing.sm,
                                      horizontal: AppSpacing.sm),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black26))),
                            ).marginSymmetric(
                                vertical: cellVerMargin,
                                horizontal: cellHorMargin),
                          ),
                        ],
                      ),

                      /// Practical
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: AppSpacing.sm,
                                      horizontal: AppSpacing.sm),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black26))),
                            ).marginSymmetric(
                                vertical: cellVerMargin,
                                horizontal: cellHorMargin),
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            )),
          ),
        ],
      ),
    );
  }

  static vStudentList() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Heading
        Container(
          color: AppColor.inactiveTab,
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Student Name",
                style: kBody.copyWith(color: Colors.white),
              ),
              Row(
                children: [
                  Text(
                    "Sellect All",
                    style: kBody.copyWith(color: Colors.white),
                  ),
                  Checkbox(
                    // value: _controller.answerIdList[index]["selected"]
                    value: false,

                    onChanged: (value) {},
                    activeColor: AppColor.activeTab,
                    fillColor: MaterialStatePropertyAll(Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          color: AppColor.secondaryColor.withOpacity(.4),
          padding:
              EdgeInsets.symmetric(horizontal: 0, vertical: AppSpacing.smh),
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Checkbox(
                      // value: _controller.answerIdList[index]["selected"]
                      value: false,

                      onChanged: (value) {},
                      activeColor: AppColor.activeTab,
                      fillColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    Text(
                      "Ankit Tewari",
                      style: kBody.copyWith(color: Colors.black87),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: .5,
                  color: Colors.white,
                  thickness: .5,
                );
              },
              itemCount: 5),
        ),
      ],
    );
  }

  static vStudentBasedMarksEntryTopbar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.md, horizontal: AppSpacing.sm),
          decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(8),
              color: AppColor.activeTab),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _vDropdowns2(),
            ],
          ),
        ),
      ],
    );
  }
}
