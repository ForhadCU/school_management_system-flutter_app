import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/student_library.dart';
import 'package:school_management_system/Model/STUDENT/helpdesk/stu_helpdesk_model.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../Config/config.dart';

class HelpDeskWidgets {
  // make this class singleton
  HelpDeskWidgets._internal();
  static final HelpDeskWidgets _singleton = HelpDeskWidgets._internal();
  factory HelpDeskWidgets() {
    return _singleton;
  }

  // codes start from here
  // All methods should be static to maintain singleton instances
  static final _controller = HelpDeskController.to;
  static final List<HelpDeskModel> stuHelpDeskModelList =
      _controller.stuHelpdeskModelList;

  static vParentList() {
    return Obx(() => ListView.separated(
          shrinkWrap: true,
          itemCount:
              stuHelpDeskModelList.isEmpty ? 0 : stuHelpDeskModelList.length,
          itemBuilder: ((context, index) {
            final stuHelpdeskModel = stuHelpDeskModelList[index];
            return Column(
              children: [
                _vTopBar(text: stuHelpdeskModel.name ?? ''),
                _vChildList(
                    list: stuHelpdeskModel.eduSiteHelpDeskSetting!,
                    onTap: (int tappedIndex) {
                      kLog(tappedIndex);
                      print(
                          "Tapped : ${stuHelpdeskModel.eduSiteHelpDeskSetting![tappedIndex].helpTitle}");
                      _controller.mTappedOnHelpDeskItem(stuHelpdeskModel
                          .eduSiteHelpDeskSetting![tappedIndex]);
                    }),
              ],
            );
          }),
          separatorBuilder: (BuildContext copagentext, int index) {
            return const Divider(
              color: AppColor.white,
              height: AppSpacing.md,
            );
          },
        ));
  }

  static _vTopBar({required String text}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm, vertical: AppSpacing.sm + 2),
      decoration: const BoxDecoration(
          color: AppColor.helpDeskTopbar,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          )),
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.w500, fontSize: 18, color: AppColor.white),
      ),
    );
  }

  static _vChildList(
      {required Null Function(int tappedIndex) onTap,
      required List<EduSiteHelpDeskSetting> list}) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: ((context, index) {
          final EduSiteHelpDeskSetting eduSiteHelpDeskSetting = list[index];
          return GestureDetector(
            onTap: () => onTap(index),
            child: _vPlainBlueBox(
              child: Text(
                eduSiteHelpDeskSetting.helpTitle ?? '',
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColor.fontUsername),
              ),
            ),
          );
        }),
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.white,
            height: AppSpacing.smh,
          );
        },
        itemCount: list.length);
  }

  static Container _vPlainBlueBox({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
      decoration: const BoxDecoration(color: AppColor.frenchSkyBlue100),
      child: child,
    );
  }
}

class HelpDeskDetailsWidgets {
  // make this class singleton
  HelpDeskDetailsWidgets._internal();
  static final HelpDeskDetailsWidgets _singleton =
      HelpDeskDetailsWidgets._internal();
  factory HelpDeskDetailsWidgets() {
    return _singleton;
  }
  static final _controller = HelpDeskController.to;
  static EduSiteHelpDeskSetting _eduSiteHelpDeskSetting =
      _controller.clickedEduSiteHelpDeskSetting.value;

  static vTutorialCard() {
    return Column(
      children: [
        _vTopBar(text: _eduSiteHelpDeskSetting.helpTitle ?? ""),
        _vPlainBlueBox(
          child: _vBody(),
        )
      ],
    );
  }

  static _vTopBar({required String text}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm, vertical: AppSpacing.sm + 2),
      decoration: const BoxDecoration(
          color: AppColor.helpDeskTopbar,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          )),
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.w500, fontSize: 18, color: AppColor.white),
      ),
    );
  }

  static Container _vPlainBlueBox({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
      decoration: const BoxDecoration(color: AppColor.frenchSkyBlue100),
      child: child,
    );
  }

  static _vBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: AppScreenSize.mGetHeight(kGlobContext, 25),
          decoration: BoxDecoration(color: AppColor.secondaryColor),
          child: Obx(() => YoutubePlayer(
                controller: _controller.youtubePlayerController.value,
                showVideoProgressIndicator: true,
                onReady: () {
                  kLog("Video is ready");
                },
              )),
        ),
        Visibility(
            visible:
                _eduSiteHelpDeskSetting.helpDescription != null ? true : false,
            child: Column(
              children: [
                AppSpacing.md.height,
                Text(
                  "Description".toUpperCase(),
                  style: kBody.copyWith(color: AppColor.fontUsername),
                ),
                AppSpacing.sm.height,
                Text(_eduSiteHelpDeskSetting.helpDescription ?? ''),
              ],
            ))
      ],
    );
  }
  // codes start from here
  // All methods should be static to maintain singleton instances
}
