import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Api/TEACHER/messages_api.dart';
import '../../../Config/config.dart';
import '../../../Model/PUBLIC/searchSchool/site_list_model.dart';
import '../../../Model/STUDENT/message/message_model.dart';
import '../../../Singletones/app_data.dart';
import '../../../Utils/api structure/payloads.dart';
import '../../../Utils/utils.dart';

class TeachMessageController extends GetxController {
  static TeachMessageController get to => Get.find();

  var messageList = <MessageData>[].obs;
  var messageModel = MessageModel().obs;
  var token = '';
  var messageListScrollCntrlr = ScrollController().obs;
  var pageNumber = 1.obs;
  var siteListModel = SitelistModel().obs;
  var clickedMessageModel = MessageData().obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    await mInitialization();
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
    void mUpdateClickedMessageModel(MessageData data) {
    clickedMessageModel.value = data;
  }
  

  mGetMessageModel() async {
    messageModel.value = await TeachMessageApis.mGetMessageModel(
        PayLoads.teachMessage(
            page: pageNumber.value.toString(),
            api_access_key: AppData.api_access_key,
            paginate: 10.toString(),
            academic_group_id: siteListModel.value.id.toString()),
        token);
    if (messageModel.value.data != null) {
      messageList.addAll(messageModel.value.data!);
    }
  }

  void mResetList() {
    messageList.clear();
    pageNumber.value = 1;
  }

  mInitialization() async {
    token = await AppLocalDataFactory.mGetToken();

    siteListModel.value = await AppLocalDataFactory.mGetSiteListModel();
  }
}
