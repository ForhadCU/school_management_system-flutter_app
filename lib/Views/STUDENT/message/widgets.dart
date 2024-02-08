import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Model/STUDENT/message/message_model.dart';
import 'package:school_management_system/Utils/custom_utils.dart';

import '../../../Controller/STUDENT/message/messages_ctrlr.dart';

class StuMessageWidgets {
  // make this class singleton
  StuMessageWidgets._internal();
  static final StuMessageWidgets _singleton = StuMessageWidgets._internal();
  factory StuMessageWidgets() {
    return _singleton;
  }

  static final StuMessageController _controller = StuMessageController.to;

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
          child: const Icon(
            Icons.person,
            size: 48,
            color: Colors.white,
          )),
      title: Text(message.title ?? ""),
      subtitle: Text(message.message ?? ""),
      trailing: message.createdAt == null
          ? Container()
          : Text(Utils().getTimeFromTimeStamp(
              message.createdAt.toString(), kAppDateFormat)),
    );
  }
}
