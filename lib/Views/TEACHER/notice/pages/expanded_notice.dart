import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/student_library.dart';
import 'package:school_management_system/Utils/custom_utils.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';


class ExpandedTeachNotice extends StatelessWidget {
  ExpandedTeachNotice({super.key});

  @override
  Widget build(BuildContext context) {
    final StuNoticeController controller = Get.find();
    kLog(controller.clickedNoticeModel.value.createdAt.toString());
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Notice Details"),
          backgroundColor: AppColor.primaryColor,
          elevation: 0,
        ),
        body: BaseWidgetChild(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.clickedNoticeModel.value.noticeTitle ?? "N/A",
              style: kHeading,
            ),
            AppSpacing.sm.height,
            Text(
              Utils().getTimeFromTimeStamp(
                  controller.clickedNoticeModel.value.createdAt.toString(),
                  kAppDateFormatWithTime12),
              style: kBody.copyWith(fontWeight: FontWeight.w500),
            ),
            AppSpacing.md.height,
            Expanded(
              child: Text(
                controller.clickedNoticeModel.value.noticeDescription ?? "N/A",
                style: kBody,
                softWrap: true,
              ),
            )
          ],
        )),
      ),
    );
  }
}
