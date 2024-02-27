import 'package:flutter/material.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/STUDENT/message/widgets.dart';
import 'package:school_management_system/Views/TEACHER/message/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';

import '../../../Controller/TEACHER/message/messages_ctrlr.dart';
import '../../../Model/STUDENT/message/message_model.dart';
import '../../../Routes/app_pages.dart';
import '../../../Singletones/app_data.dart';
import '../../../Utils/custom_utils.dart';
import '../../Widgets/site_cached_network_image.dart';
import '../../Widgets/user_cached_network_image.dart';

class TeachMessage extends GetView<TeachMessageController> {
  const TeachMessage({super.key});

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
      child: Obx(() => ListView.separated(
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
    return ListTile(
        onTap: () {
          controller.mUpdateClickedMessageModel(message);
          Get.toNamed(AppRoutes.teachMessageExpand);
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
                AppData.eduWorldTheworldHostname +
                    controller.siteListModel.value.siteLogo!,
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
              Utils().getTimeFromTimeStamp(
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
                Get.toNamed(AppRoutes.teachMessageExpand);
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
                        Utils().getTimeFromTimeStamp(
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
  }
}
