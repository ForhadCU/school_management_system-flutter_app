import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/PUBLIC/about_us_controller.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/PUBLIC/siteHistory/widgets.dart';
import 'package:school_management_system/Views/Widgets/common_cached_network_image.dart';

import '../../../Config/config.dart';
import '../../../Singletones/app_data.dart';
import '../../Widgets/base_widget.dart';
import '../../Widgets/user_cached_network_image.dart';
import '../../Widgets/top_bar_banner.dart';

class AboutUs extends GetView<AboutUsController> {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      title: tAboutUs,
      child: BaseWidgetChild(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // vSchollNameBanner(),
              InstitueBanaer(
                  iconUrl: controller.siteListModel.value.siteLogo,
                  title: controller.siteListModel.value.siteName ??
                      tDemoSchoolName),
              (AppSpacing.md).height,
              vBody(),
            ],
          ),
        ),
      )),
    );
  }

  vBody() {
    return Obx(() {
      return controller.aboutUsData.value.description == null
          ? Container()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  controller.aboutUsData.value.image != null
                      ? Container(
                          margin: const EdgeInsets.only(bottom: AppSpacing.md),
                          child: commonCachedNetworkImage(
                            /* imageUrl: */ controller
                                    .siteListModel.value.siteAlias! +
                                AppData.hostNameShort +
                                controller.aboutUsData.value.image,
                            width: AppScreenSize.mGetWidth(kGlobContext, 95),
                            height: AppScreenSize.mGetWidth(kGlobContext, 35),
                            fit: BoxFit.fill,
                          ),
                        )
                      : Container(),
                  Html(
                    data: controller.aboutUsData.value.description,
                  ),
                ],
              ),
            );
    });
  }
}
