import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Config/config.dart';
import '../../../Utils/utils.dart';

class StuSubjectsWidgets {
  // make this class singleton
  StuSubjectsWidgets._internal();
  static final StuSubjectsWidgets _singleton = StuSubjectsWidgets._internal();
  factory StuSubjectsWidgets() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances
  static vExamDocumentsTable() {
    List list = [
      {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"},
    ];
    return Expanded(
        child: SingleChildScrollView(
      child: Container(
          width: double.infinity,
          child: ClipRRect(
            // borderRadius: BorderRadius.circular(12),
            child: Table(
              columnWidths: <int, TableColumnWidth>{
                0: FlexColumnWidth(AppScreenSize.mGetWidth(kGlobContext, 8)),
                // 1: IntrinsicColumnWidth(),
                1: FlexColumnWidth(AppScreenSize.mGetWidth(kGlobContext, 32)),
                2: FlexColumnWidth(AppScreenSize.mGetWidth(kGlobContext, 20)),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                TableRow(
                  // table decoration
                  decoration:
                      const BoxDecoration(color: AppColor.secondaryColor),
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
                // for (var item in _controller.userInfoModelList) // correct

                for (var item in list) // test

                  TableRow(
                    // table decoration
                    decoration: BoxDecoration(
                        color:
                            /* _controller.userInfoModelList.indexOf(item) */ list
                                            .indexOf(item) %
                                        2 ==
                                    0
                                ? AppColor.secondaryColor.withOpacity(.4)
                                : AppColor.secondaryColor.withOpacity(.2)),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "5",
                            style: kBody.copyWith(
                                color: AppColor.kBlack,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ).marginSymmetric(vertical: 2, horizontal: 2),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Higher Math" ,
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
                              "Compulsory",
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.clip,
                              style: kBody.copyWith(
                                  color: AppColor.kBlack,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ).marginSymmetric(horizontal: 8, vertical: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          ) /* .marginOnly(left: 20, top: 10, right: 20, bottom: 50) */),
    ));
  }
}
