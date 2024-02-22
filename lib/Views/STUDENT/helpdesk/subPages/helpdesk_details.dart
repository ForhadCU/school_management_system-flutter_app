import 'package:flutter/material.dart';
import 'package:school_management_system/Views/STUDENT/helpdesk/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../Config/config.dart';
import '../../../../Controller/student_library.dart';


class HelpDeskDetails extends GetView<HelpDeskController> {
  const HelpDeskDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Tutorial",
        child: BaseWidgetChild(
          child: SingleChildScrollView(
            child: vTutorialCard(),
          ),
        ));
  }

   vTutorialCard() {
    return Column(
      children: [
        _vTopBar(
            text:
                controller.clickedEduSiteHelpDeskSetting.value.helpTitle ?? ""),
        _vPlainBlueBox(
          child: _vBody(),
        )
      ],
    );
  }

   _vTopBar({required String text}) {
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

   Container _vPlainBlueBox({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
      decoration: const BoxDecoration(color: AppColor.frenchSkyBlue100),
      child: child,
    );
  }

   _vBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: AppScreenSize.mGetHeight(kGlobContext, 25),
          decoration: BoxDecoration(color: AppColor.secondaryColor),
          child: Obx(() => YoutubePlayer(
                controller: controller.youtubePlayerController.value,
                showVideoProgressIndicator: true,
                onReady: () {
                  kLog("Video is ready");
                },
              )),
        ),
        Visibility(
            visible: controller
                        .clickedEduSiteHelpDeskSetting.value.helpDescription !=
                    null
                ? true
                : false,
            child: Column(
              children: [
                AppSpacing.md.height,
                Text(
                  "Description".toUpperCase(),
                  style: kBody.copyWith(color: AppColor.fontUsername),
                ),
                AppSpacing.sm.height,
                Text(controller
                        .clickedEduSiteHelpDeskSetting.value.helpDescription ??
                    ''),
              ],
            ))
      ],
    );
  }
  // codes start from here
  // All methods should be  to maintain singleton instances
}
