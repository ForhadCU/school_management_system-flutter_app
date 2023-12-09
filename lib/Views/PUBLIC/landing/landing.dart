import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.white,
      body: BaseWidget(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            vSchollNameBanner(),
            (AppSpacing.xxl * 2).height,
            vBody(),
          ],
        ),
      )),
    ));
  }

  Widget vIconButton(
      {required Function onTap,
      required String iconLoc,
      required Color bgColor,
      required Color iconColor,
      required String label}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(AppSpacing.sm)),
            child: Image(
              image: AssetImage(
                iconLoc,
              ),
              color: iconColor,
              width: 48,
            ),
          ),
          AppSpacing.sm.height,
          Text(
            label,
            style: kBody,
          )
        ],
      ),
    );
  }

  Widget vBody() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: vIconButton(
                    onTap: () {
                      print("Click");
                      return Get.toNamed(AppRoutes.notice);
                    },
                    iconLoc: PublicAssetLocation.notices,
                    bgColor: Colors.orange.shade100,
                    iconColor: Colors.orange,
                    label: "Notice"),
              ),
            ),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: vIconButton(
                        onTap: () => Get.toNamed(AppRoutes.academicCalendar),
                        iconLoc: PublicAssetLocation.academicCalander,
                        bgColor: Colors.green.shade100,
                        iconColor: Colors.green,
                        label: "Academic Calendar"))),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: vIconButton(
                        onTap: () => Get.toNamed(AppRoutes.gallery),
                        iconLoc: PublicAssetLocation.gallery,
                        bgColor: Colors.blue.shade100,
                        iconColor: Colors.blue,
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
                    iconLoc: PublicAssetLocation.sitehistory,
                    bgColor: Colors.purple.shade100,
                    iconColor: Colors.purple,
                    label: "Site History"),
              ),
            ),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: vIconButton(
                        onTap: () => Get.toNamed(AppRoutes.contact),
                        iconLoc: PublicAssetLocation.contact_mail_us,
                        bgColor: Colors.red.shade100,
                        iconColor: Colors.red,
                        label: "Contact Us"))),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: vIconButton(
                        onTap: () => Get.toNamed(AppRoutes.login),
                        iconLoc: PublicAssetLocation.userLogin,
                        bgColor: Colors.amber.shade100,
                        iconColor: Colors.amber,
                        label: "Login"))),
          ],
        ),
      ],
    );
  }

  vSchollNameBanner() {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/logos/demo_school.png"),
              width: 48 * 2,
              height: 48 * 2,
              fit: BoxFit.fill,
            ),
            /*  IconButton(
                onPressed: () => scafoldKey.currentState?.openEndDrawer(),
                icon: Image(
                  image: AssetImage(menu),
                  width: 24,
                  height: 24,
                  fit: BoxFit.fill,
                )), */
          ],
        ),
        AppSpacing.sm.height,
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Nasirabad Govt. High School",
              style: kHeading,
            ),
          ],
        ),
      ],
    );
  }
}
