import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/student_library.dart';

import '../../../Config/config.dart';
import '../../../Routes/app_pages.dart';
import '../../../Utils/utils.dart';
import '../../Widgets/buttons.dart';

class StuHomeWidgets {
  // make this class singleton
  StuHomeWidgets._internal();
  static final StuHomeWidgets _singleton = StuHomeWidgets._internal();
  factory StuHomeWidgets() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances
  static final controller = StuHomeController.to;
  static Widget vBody() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: _vIconButton(
                  onTap: () {
                    print("Click");
                    return Get.toNamed(AppRoutes.notice);
                  },
                  iconLoc: StudentAssetLocation.my_exam,
                  // bgColor: AppColor.orange.shade100,
                  bgColor: AppColor.my_exam,

                  // iconColor: AppColor.orange,
                  label: "My exam".toUpperCase()),
            ),
            Expanded(
                child: _vIconButton(
                    onTap: () => Get.toNamed(AppRoutes.academicCalendar),
                    iconLoc: StudentAssetLocation.my_result,
                    // bgColor: AppColor.green.shade100,
                    bgColor: AppColor.my_result,

                    // iconColor: AppColor.green,
                    label: "My result".toUpperCase())),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: _vIconButton(
                        onTap: () => Get.toNamed(AppRoutes.gallery),
                        iconLoc: StudentAssetLocation.my_payments,
                        // bgColor: AppColor.blue.shade100,
                        bgColor: AppColor.my_payments,

                        // iconColor: AppColor.blue,
                        label: "My Payment".toUpperCase()))),
          ],
        ),
        AppSpacing.xl.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: _vIconButton(
                    onTap: () => Get.toNamed(AppRoutes.siteHistory),
                    iconLoc: StudentAssetLocation.my_routine,
                    // bgColor: AppColor.purple.shade100,
                    bgColor: AppColor.my_routine,
                    // iconColor: AppColor.purple,
                    label: "My routine".toUpperCase()),
              ),
            ),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: _vIconButton(
                        onTap: () => Get.toNamed(AppRoutes.contact),
                        iconLoc: StudentAssetLocation.my_class,
                        // bgColor: AppColor.red.shade100,
                        // iconColor: AppColor.red,
                        bgColor: AppColor.my_class,
                        label: "My class".toUpperCase()))),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: _vIconButton(
                        onTap: () => Get.toNamed(AppRoutes.login),
                        iconLoc: StudentAssetLocation.live_class,
                        // bgColor: AppColor.amber.shade100,
                        bgColor: AppColor.live_class,
                        // iconColor: AppColor.amber,
                        label: "Live Class".toUpperCase()))),
          ],
        ),
        AppSpacing.xl.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: _vIconButton(
                    onTap: () => Get.toNamed(AppRoutes.siteHistory),
                    iconLoc: StudentAssetLocation.academic_calendar,
                    // bgColor: AppColor.purple.shade100,
                    bgColor: AppColor.academic_calendar,
                    // iconColor: AppColor.purple,
                    label: "Calendar".toUpperCase()),
              ),
            ),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: _vIconButton(
                        onTap: () => Get.toNamed(AppRoutes.contact),
                        iconLoc: StudentAssetLocation.attendance,
                        // bgColor: AppColor.red.shade100,
                        // iconColor: AppColor.red,
                        bgColor: AppColor.attendance,
                        label: "Attendance".toUpperCase()))),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: _vIconButton(
                        onTap: () => Get.toNamed(AppRoutes.login),
                        iconLoc: StudentAssetLocation.my_quiz,
                        // bgColor: AppColor.amber.shade100,
                        bgColor: AppColor.my_quiz,
                        // iconColor: AppColor.amber,
                        label: "My Quiz".toUpperCase()))),
          ],
        ),
        AppSpacing.xl.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: _vIconButton(
                    onTap: () => Get.toNamed(AppRoutes.siteHistory),
                    iconLoc: StudentAssetLocation.my_subject,
                    // bgColor: AppColor.purple.shade100,
                    bgColor: AppColor.my_subject,
                    // iconColor: AppColor.purple,
                    label: "My subject".toUpperCase()),
              ),
            ),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: _vIconButton(
                        onTap: () => Get.toNamed(AppRoutes.contact),
                        iconLoc: StudentAssetLocation.website,
                        // bgColor: AppColor.red.shade100,
                        // iconColor: AppColor.red,
                        bgColor: AppColor.website,
                        label: "Website".toUpperCase()))),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: _vIconButton(
                        onTap: () => Get.toNamed(AppRoutes.helpdesk),
                        iconLoc: StudentAssetLocation.help_desk,
                        // bgColor: AppColor.amber.shade100,
                        bgColor: AppColor.log_out,
                        // iconColor: AppColor.amber,
                        label: "Help Desk".toUpperCase()))),
          ],
        ),
        AppSpacing.xl.height,
        Row(
          children: [
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: _vIconButton(
                      onTap: ()=> controller.mLogutUser(),
                        // onTap: () => Get.toNamed(AppRoutes.login),
                        iconLoc: StudentAssetLocation.log_out,
                        // bgColor: AppColor.amber.shade100,
                        bgColor: AppColor.log_out,
                        // iconColor: AppColor.amber,
                        label: "Log out".toUpperCase()))),
          ],
        ),
      ],
    );
  }

  static Widget _vIconButton(
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

  static Widget vEndDrawer() {
    return Drawer(
        backgroundColor: AppColor.secondaryColor,
        child: ListView.separated(
          itemCount: controller.drawerItems.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () =>
                    controller.mNavigateTo(controller.drawerItems[index]),
                child: Container(
                  child: controller.drawerItems.length - 1 == index
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppSpacing.md,
                              horizontal: AppSpacing.sm),
                          decoration: BoxDecoration(
                              gradient: AppColor.kVerticalCovexGradiant),
                          child: Row(
                            children: [
                              const Image(
                                image: AssetImage(StudentAssetLocation.logout),
                                width: 14,
                                height: 14,
                              ),
                              AppSpacing.sm.width,
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  width: double.infinity,
                                  child: Text(
                                    controller.drawerItems[index].toUpperCase(),
                                    style: kSubTitle.copyWith(
                                        color: AppColor.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: AppSpacing.md,
                              horizontal: AppSpacing.sm),
                          decoration: BoxDecoration(
                              gradient: AppColor.kVerticalCovexGradiant),
                          child: Text(
                            controller.drawerItems[index].toUpperCase(),
                            style: kTitleLite.copyWith(
                                color: AppColor.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                ));
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: AppColor.kGray700,
              height: 1,
            );
          },
        ));
  }
}
