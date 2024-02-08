import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Api/STUDENT/message/messages_api.dart';
import 'package:school_management_system/Model/STUDENT/message/message_model.dart';
import 'package:school_management_system/Singletones/app_data.dart';
import 'package:school_management_system/Utils/api%20structure/payloads.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../../Config/config.dart';

class StuMessageController extends GetxController {
  static StuMessageController get to => Get.find();

  var messageList = <MessageData>[].obs;
  var messageModel = MessageModel().obs;
  var token = '';
  var messageListScrollCntrlr = ScrollController().obs;
  var pageNumber = 1.obs;

  @override
  void onInit() async {
    token = await AppLocalDataFactory.mGetToken();
    await mGetMessageModel();
    messageListScrollCntrlr.value.addListener(() {
      if (messageListScrollCntrlr.value.offset ==
          messageListScrollCntrlr.value.position.maxScrollExtent) {
        if (messageModel.value.nextPageUrl != null) {
          kLog("go next page");
          kLog(messageModel.value.currentPage!);
          /*  pageNumber.value =  */ pageNumber.value++;
          mGetMessageModel();
        } else {
          kLog("end");
        }
        kLog("Reached to End");
        // kLog(noticeApiModel.value.);
      }
    });

    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  mGetMessageModel() async {
    messageModel.value = await StuMessageApis.mGetMessageModel(
        PayLoads.stuMessage(
            page: pageNumber.value.toString(),
            api_access_key: AppData.api_access_key,
            paginate: 10.toString()),
        token);
    if (messageModel.value.data != null) {
      messageList.addAll(messageModel.value.data!);
    }
  }

  void mResetList() {
    messageList.clear();
    pageNumber.value = 1;
  }
}
