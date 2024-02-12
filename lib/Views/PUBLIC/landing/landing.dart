import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/PUBLIC/landing_controller.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:school_management_system/Singletones/app_data.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/PUBLIC/landing/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:school_management_system/Views/Widgets/custom_textfield.dart';
import 'package:school_management_system/Views/Widgets/top_bar_banner.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LandingController.to;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Website",
          style: kTitle.copyWith(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
        actions: [
          IconButton(
            // size: 24,
            color: Colors.white,
            onPressed: () {
              vExitDialog();
            },
            icon: Icon(
              Icons.exit_to_app,
              size: 24,
            ),
          ),
          // AppSpacing.md.width,
        ],
      ),
      /*  endDrawer: Obx(() => LandingWidgets.vEndDrawer(
          iconUrl: controller.siteListModel.value.siteLogo,
          title: controller.siteListModel.value.siteName ?? tDemoSchoolName)), */
      body: BaseWidgetChild(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // vSchollNameBanner(),
            Obx(() => InstitueBanaer(
                iconUrl: controller.siteListModel.value.siteLogo,
                title: controller.siteListModel.value.siteName ??
                    tDemoSchoolName)),
            (AppSpacing.xxl * 2).height,
            vBody(),
          ],
        ),
      )),
    ));
  }

  Widget vBody() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: vIconButton(
                  onTap: () {
                    print("Click");
                    return Get.toNamed(AppRoutes.notice);
                  },
                  iconLoc: PublicAssetLocation.ic_notices,
                  // bgColor: Colors.orange.shade100,
                  bgColor: Colors.blue,

                  // iconColor: Colors.orange,
                  label: "Notice"),
            ),
            Expanded(
                child: vIconButton(
                    onTap: () => Get.toNamed(AppRoutes.academicCalendar),
                    iconLoc: PublicAssetLocation.ic_academicCalander,
                    // bgColor: Colors.green.shade100,
                    bgColor: Colors.pink,

                    // iconColor: Colors.green,
                    label: "Academic Calendar")),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: vIconButton(
                        onTap: () => Get.toNamed(AppRoutes.gallery),
                        iconLoc: PublicAssetLocation.ic_gallery,
                        // bgColor: Colors.blue.shade100,
                        bgColor: Colors.green,

                        // iconColor: Colors.blue,
                        label: "Gallery"))),
          ],
        ),
        AppSpacing.xl.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: vIconButton(
                    onTap: () => Get.toNamed(AppRoutes.siteHistory),
                    iconLoc: PublicAssetLocation.ic_sitehistory,
                    // bgColor: Colors.purple.shade100,
                    bgColor: Colors.cyan,
                    // iconColor: Colors.purple,
                    label: "Site History"),
              ),
            ),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: vIconButton(
                        onTap: () => Get.toNamed(AppRoutes.contact),
                        iconLoc: PublicAssetLocation.ic_contact_mail_us,
                        // bgColor: Colors.red.shade100,
                        // iconColor: Colors.red,
                        bgColor: Colors.purple,
                        label: "Contact Us"))),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: vIconButton(
                        onTap: () => Get.toNamed(AppRoutes.login),
                        iconLoc: PublicAssetLocation.ic_userLogin,
                        // bgColor: Colors.amber.shade100,
                        bgColor: Colors.red,
                        // iconColor: Colors.amber,
                        label: "Login"))),
          ],
        ),
      ],
    );
  }

  Widget vIconButton(
      {required Function onTap,
      required String iconLoc,
      required Color bgColor,
      Color? iconColor,
      required String label}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            width: AppScreenSize.mGetWidth(kGlobContext, 20),
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(AppSpacing.sm)),
            child: Image(
              image: AssetImage(
                iconLoc,
              ),
              color: iconColor,
              width: 64,
            ),
          ),
          AppSpacing.sm.height,
          Text(
            label,
            style: kBody,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  static void vExitDialog() {
    Get.dialog(
        AlertDialog(
          backgroundColor: AppColor.white,
          contentPadding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          content: Container(
            padding: EdgeInsets.all(10),
            width: AppScreenSize.mGetWidth(kGlobContext, 80),
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Warning!",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
                AppSpacing.sm.height,
                Text(
                  "Do you really want to exit?",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                24.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                              vertical: AppSpacing.smh,
                            )),
                        child: Text(
                          "Cancel".toUpperCase(),
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                    AppSpacing.xxl.width,
                    ElevatedButton(
                        onPressed: () async {
                          // exit(0);  // both Android and Ios
                          SystemChannels.platform
                              .invokeMethod('SystemNavigator.pop');
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.red,
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                              vertical: AppSpacing.smh,
                            )),
                        child: Text(
                          "Exit".toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
        barrierDismissible: false);
  }
}
