/* import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/PUBLIC/about_us_controller.dart';
import 'package:school_management_system/Singletones/app_data.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/Widgets/user_cached_network_image.dart';

class AboutUsWidgets {
  // make this class singleton
  AboutUsWidgets._internal();
  static final AboutUsWidgets _singleton = AboutUsWidgets._internal();
  factory AboutUsWidgets() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static final controller = AboutUsController.to;

  static vBody() {
    return Obx(() {
      /*  kLog(
          "ImageUri: ${controller.siteListModel.value.siteAlias ?? ""}.${AppData.hostNameTheWorld}${controller.aboutUsData.value.image}");
 */
      return controller.aboutUsData.value.description == null
          ? Container()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  controller.aboutUsData.value.image != null
                      ? Container(
                          margin: const EdgeInsets.only(bottom: AppSpacing.md),
                          child: userCachedNetworkImage(
                            /* imageUrl: */ controller
                                    .siteListModel.value.siteAlias! +
                                AppData.hostNameTheWorld +
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
 */