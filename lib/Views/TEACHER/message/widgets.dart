import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';

import '../../../Controller/TEACHER/message/messages_ctrlr.dart';
import '../../../Model/STUDENT/message/message_model.dart';
import '../../../Singletones/app_data.dart';
import '../../../Utils/custom_utils.dart';
import '../../Widgets/cached_network_image.dart';

class TeachMessageWidgets {
  // make this class singleton
  TeachMessageWidgets._internal();
  static final TeachMessageWidgets _singleton = TeachMessageWidgets._internal();
  factory TeachMessageWidgets() {
    return _singleton;
  }

  static final TeachMessageController _controller = TeachMessageController.to;

  static vMessageList() {
    return Expanded(
      child: Obx(() => ListView.separated(
          controller: _controller.messageListScrollCntrlr.value,
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            return vMessageCard(_controller.messageList[index]);
          }),
          separatorBuilder: (context, index) {
            return const Divider(
              color: AppColor.frenchSkyBlue100,
            );
          },
          itemCount: _controller.messageList.length)),
    );
  }

  static vMessageCard(MessageData message) {
    return ListTile(
      leading: Container(
          decoration: const BoxDecoration(
            color: Colors.black12,
            shape: BoxShape.circle,
          ),
          child: cachedNetworkImage(
              AppData.eduWorldTheworldHostname +
                  _controller.siteListModel.value.siteLogo!,
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
  }
}
