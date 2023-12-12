// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/notice.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

class ExpandedNotice extends StatelessWidget {
  ExpandedNotice({super.key});
  NoticeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(""),
          backgroundColor: Colors.white,
        ),
        body: BaseWidgetChild(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.noticeTitle.value,
              style: kHeading,
            ),
            AppSpacing.sm.height,
            Text(
              controller.noticeDate.value,
              style: kBody.copyWith(fontWeight: FontWeight.w500),
            ),
            AppSpacing.md.height,
            Row(
              children: [
                Text(
                  "Notice Tag:",
                  style: kSubTitle.copyWith(fontWeight: FontWeight.w500),
                ),
                AppSpacing.smh.width,
                Expanded(
                  child: Text(
                    controller.noticeTag.value,
                    style: kBody,
                  ),
                ),
              ],
            ),
            AppSpacing.sm.height,
            Expanded(
              child: Text(
                controller.noticeBody.value,
                style: kBody,
              ),
            )
          ],
        )),
      ),
    );
  }
}
