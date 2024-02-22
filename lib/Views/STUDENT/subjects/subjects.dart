import 'package:flutter/material.dart';
import 'package:school_management_system/Views/STUDENT/subjects/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/student_library.dart';

import '../../../Config/config.dart';
import '../../../Utils/utils.dart';

class StuSubjects extends GetView<StuSubjectsController> {
  const StuSubjects({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Subjects",
        child: BaseWidgetChild(
          child: Column(children: [
            StuSubjectsWidgets.vExamDocumentsTable(),
          ]),
        ));
  }

     vExamDocumentsTable() {
    return Obx(() => Expanded(
        child: controller.stuSubjectList.isEmpty
            ? Center(
                child: Text("No Data!",
                    style: kLabel.copyWith(
                      color: AppColor.red,
                    )))
            : SingleChildScrollView(
                child: Container(
                    width: double.infinity,
                    child: ClipRRect(
                      // borderRadius: BorderRadius.circular(12),
                      child: Table(
                        columnWidths: <int, TableColumnWidth>{
                          0: FlexColumnWidth(
                              AppScreenSize.mGetWidth(kGlobContext, 8)),
                          // 1: IntrinsicColumnWidth(),
                          1: FlexColumnWidth(
                              AppScreenSize.mGetWidth(kGlobContext, 32)),
                          2: FlexColumnWidth(
                              AppScreenSize.mGetWidth(kGlobContext, 20)),
                        },
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: <TableRow>[
                          TableRow(
                            // table decoration
                            decoration: const BoxDecoration(
                                color: AppColor.secondaryColor),
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '#',
                                    style: kBody.copyWith(
                                        color: AppColor.white,
                                        fontWeight: FontWeight.bold),
                                  ).marginAll(0),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Subject list'.toUpperCase(),
                                    style: kBody.copyWith(
                                        color: AppColor.white,
                                        fontWeight: FontWeight.bold),
                                  ).marginAll(10),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Condition'.toUpperCase(),
                                    style: kBody.copyWith(
                                        color: AppColor.white,
                                        fontWeight: FontWeight.bold),
                                  ).marginAll(0),
                                ],
                              ),
                            ],
                          ),
                          // for (var item in controller.userInfoModelList) // correct

                          for (var item in controller.stuSubjectList) // test

                            TableRow(
                              // table decoration
                              decoration: BoxDecoration(
                                  color:
                                      /* controller.userInfoModelList.indexOf(item) */ controller
                                                      .stuSubjectList
                                                      .indexOf(item) %
                                                  2 ==
                                              0
                                          ? AppColor.secondaryColor
                                              .withOpacity(.4)
                                          : AppColor.secondaryColor
                                              .withOpacity(.2)),
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      (controller.stuSubjectList
                                                  .indexOf(item) +
                                              1)
                                          .toString(),
                                      style: kBody.copyWith(
                                          color: AppColor.kBlack,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ).marginSymmetric(
                                        vertical: 2, horizontal: 2),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        item.subjectName!,
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.clip,
                                        style: kBody.copyWith(
                                            color: AppColor.kBlack,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ).marginAll(8),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        item.academicSubjectConditions!.first
                                            .condition!,
                                        textAlign: TextAlign.end,
                                        overflow: TextOverflow.clip,
                                        style: kBody.copyWith(
                                            color: AppColor.kBlack,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ).marginSymmetric(
                                          horizontal: 8, vertical: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                        ],
                      ),
                    ) /* .marginOnly(left: 20, top: 10, right: 20, bottom: 50) */),
              )));
  }

}
