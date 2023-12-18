import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../../Config/config.dart';
import '../../../Singletones/app_data.dart';
import '../../Widgets/buttons.dart';

class LandingWidgets {
  // make this class singleton
  LandingWidgets._internal();
  static final LandingWidgets _singleton = LandingWidgets._internal();
  factory LandingWidgets() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Widget vEndDrawer({String? iconUrl, required String title}) {
    return Drawer(
        child: Column(
            children: [
        DrawerHeader(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            iconUrl != null
                ? CachedNetworkImage(
                    imageUrl: AppData.eduWorldTheworldHostname + iconUrl!,
                    width: 48 * 2,
                    height: 48 * 2,
                    fit: BoxFit.fill,
                  )
                : const Image(
                    image: AssetImage(demo_school),
                    width: 48 * 2,
                    height: 48 * 2,
                    fit: BoxFit.fill,
                  ),
            AppSpacing.sm.height,
            Text(
              title,
              style: kTitleLite,
            ),
            (AppSpacing.smh+2).height,
            Divider(
              thickness: .3,
              height: .5,
              color: AppColor.secondaryColor.withOpacity(.8),
            )
          ],
        )),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: AppButtons.vPrimaryButton(
                onTap: () {
                  Get.toNamed(AppRoutes.login);
                },
                text: "Log in"),
          ),
        ),
            ],
          ));
  }
}
