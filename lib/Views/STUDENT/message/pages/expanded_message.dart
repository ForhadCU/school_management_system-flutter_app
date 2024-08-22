import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/student_library.dart';
import 'package:school_management_system/Utils/custom_utils.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../../Controller/STUDENT/message/messages_ctrlr.dart';

class StuMessageExpand extends GetView<StuMessageController> {
  StuMessageExpand({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Message Details".toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColor.primaryColor,
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
        ),
        body: BaseWidgetChild(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.clickedMessageModel.value.title ?? "N/A",
              style: kHeading,
            ),
            AppSpacing.sm.height,
            Text(
              Utils().getFormatedDateTime(
                  controller.clickedMessageModel.value.createdAt.toString(),
                  kAppDateFormatWithTime12),
              style: kBody.copyWith(fontWeight: FontWeight.w500),
            ),
            AppSpacing.md.height,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      controller.clickedMessageModel.value.message ?? "N/A",
                      style: kBody,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
