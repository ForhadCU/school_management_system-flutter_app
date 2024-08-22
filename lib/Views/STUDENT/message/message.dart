import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Views/STUDENT/message/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../Controller/STUDENT/message/messages_ctrlr.dart';
import '../../../Model/STUDENT/message/message_model.dart';
import '../../../Singletones/app_data.dart';
import '../../../Utils/custom_utils.dart';
import '../../Widgets/site_cached_network_image.dart';
import '../../Widgets/user_cached_network_image.dart';

class StuMessage extends GetView<StuMessageController> {
  const StuMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Messages",
        child: BaseWidgetChild(
          child: Column(children: [
            vMessageList(),
          ]),
        ));
  }

  vMessageList() {
    return Expanded(
      child: Obx(() => controller.isLoading.value
          ? Container()
          : controller.messageList.isEmpty
              ? Center(
                  child: Text(
                    "No Message",
                    style: kBody.copyWith(color: Colors.black54),
                  ),
                )
              : ListView.separated(
                  controller: controller.messageListScrollCntrlr.value,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return vMessageCard(controller.messageList[index]);
                  }),
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: AppColor.frenchSkyBlue100,
                    );
                  },
                  itemCount: controller.messageList.length)),
    );
  }

  vMessageCard(MessageData message) {
    return Obx(() {
/*       kLog(
          "Message card Logo ImageUrl: ${AppData.eduWorldTheworldHostname + controller.siteListModel.value.siteLogo!}");
 */
      return ListTile(
        onTap: () {
          controller.mUpdateClickedMessageModel(message);
          Get.toNamed(AppRoutes.stuMessageExpand);
        },
        contentPadding: EdgeInsets.all(4),
        horizontalTitleGap: AppSpacing.md,
        minLeadingWidth: 16,
        leading: Container(
            padding: EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 238, 238, 238),
              shape: BoxShape.circle,
            ),
            child: siteCachedNetworkImage(
                "${AppData.hostNameFull}${controller.siteListModel.value.siteLogo ?? ""}",
                width: 28,
                fit: BoxFit
                    .contain) /* const Icon(
                Icons.person,
                size: 48,
                color: Colors.white,
              ) */
            ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              message.title ?? "",
              style: TextStyle(overflow: TextOverflow.ellipsis),
            ),
            Text(
              Utils().getFormatedDateTime(
                  message.createdAt.toString(), kAppTimeFormat12),
              style: kBody.copyWith(fontWeight: FontWeight.w400, fontSize: 12),
            ),
          ],
        ),
        subtitle: Column(
          children: [
            TextFormField(
              onTap: () {
                controller.mUpdateClickedMessageModel(message);
                Get.toNamed(AppRoutes.stuMessageExpand);
              },
              controller: TextEditingController(text: message.message ?? ""),
              minLines: 1,
              maxLines: 3,
              style: kBody.copyWith(
                  fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis),
              readOnly: true,
              textAlign: TextAlign.left,
              decoration: const InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0)),
            ),
            AppSpacing.sm.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                message.createdAt == null
                    ? Container()
                    : Text(
                        Utils().getFormatedDateTime(
                            message.createdAt.toString(),
                            kAppDateFormatWithDayMonth),
                        style: kBody.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 12),
                      ),
              ],
            )
          ],
        ),
        /* Text(message.message ?? "", style: kBody.copyWith(
          overflow: TextOverflow.ellipsis,
          
        ),), */
        /*  trailing: message.createdAt == null
            ? Container()
            : Text(Utils().getTimeFromTimeStamp(
                message.createdAt.toString(), kAppDateFormat)), */
      );
    });
  }
}
/*  onWillPop: () async {
        kLog("Pop");
        return true;
      }, */