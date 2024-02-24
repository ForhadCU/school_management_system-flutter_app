import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
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
    return Obx(() {
      kLog(
          "Message card Logo ImageUrl: ${AppData.eduWorldTheworldHostname + controller.siteListModel.value.siteLogo!}");

      return ListTile(
        leading: Container(
            decoration: const BoxDecoration(
              color: Colors.black12,
              shape: BoxShape.circle,
            ),
            child: siteCachedNetworkImage(
                AppData.eduWorldTheworldHostname +
                    controller.siteListModel.value.siteLogo!,
                width: 48,
                fit: BoxFit
                    .contain) /* const Icon(
                Icons.person,
                size: 48,
                color: Colors.white,
              ) */
            ),
        title: Text(message.title ?? ""),
        subtitle: Text(message.message ?? ""),
        trailing: message.createdAt == null
            ? Container()
            : Text(Utils().getTimeFromTimeStamp(
                message.createdAt.toString(), kAppDateFormat)),
      );
    });
  }
}
/*  onWillPop: () async {
        kLog("Pop");
        return true;
      }, */