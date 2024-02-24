import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/student_library.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Views/STUDENT/home/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../Routes/app_pages.dart';
import '../../../Utils/custom_utils.dart';
import '../../../Utils/utils.dart';
import '../../Widgets/user_cached_network_image.dart';

class StuHome extends GetView<StuHomeController> {
  StuHome({super.key});
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            "Home".toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: AppColor.primaryColor,
          actions: [
            /* 
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 14),
              padding: EdgeInsets.symmetric(
                  vertical: AppSpacing.smh, horizontal: AppSpacing.sm),
              // color: Colors.red,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white, width: .5),
                  borderRadius: BorderRadius.circular(4)),
              child: Obx(() => Text(
                    controller.selectedAcademicGroup.value.academicGroupName ??
                        "",
                    style: kBody.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  )),
            ), */
            /* SizedBox(
              width: 48,
            ), */
            IconButton(
                icon: new Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  _scaffoldKey.currentState!.openEndDrawer();
                }),
          ],
        ),
        endDrawer: vEndDrawer(),
        body: BaseWidgetChild(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppSpacing.md.height,
                vBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget vEndDrawer() {
    return Obx(() => Drawer(
        backgroundColor: AppColor.inactiveTab,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.symmetric(
                    vertical: AppSpacing.sm, horizontal: AppSpacing.sm),
                color: AppColor.activeTab,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 82, 86, 143),
                          borderRadius: BorderRadius.circular(4)),
                      // color: Colors.orange,
                      child: userCachedNetworkImage(
                        // "fccdc.theworld.com.bd//uploads/1708681335.jpeg"
                        Utils.mMakeUserImageUrl(
                            imageLoc:
                                controller.profileInfoModel.value.photo ?? "",
                            alisName:
                                controller.siteListModel.value.siteAlias ?? ""),
                        width: AppScreenSize.mGetWidth(kGlobContext, 23),
                        // height: AppScreenSize.mGetHeight(kGlobContext, 13),
                        fit: BoxFit.fill,
                      ) /* Image(
                        image: const AssetImage(StudentAssetLocation.user),
                        width: AppScreenSize.mGetWidth(kGlobContext, 23),
                        height: AppScreenSize.mGetHeight(kGlobContext, 13),
                        fit: BoxFit.fill,
                        color: Colors.black,
                      ) */
                      ,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${controller.profileInfoModel.value.firstName ?? ""} ${controller.profileInfoModel.value.lastName ?? ""}",
                            style: kBody.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                          ),
                          AppSpacing.sm.height,
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 4),
                            decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(4)),
                            child: Text(
                              controller.designition.value.capitalizeFirst ??
                                  "",
                              style: kBody.copyWith(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          /*  AppSpacing.smh.height,
                          Container(
                            alignment: Alignment.center,
                            // margin: EdgeInsets.symmetric(vertical: 14),
                            padding: EdgeInsets.symmetric(
                                vertical: AppSpacing.smh,
                                horizontal: AppSpacing.sm),
                            // color: Colors.red,
                         /*    decoration: BoxDecoration(
                                color: Colors.transparent,
                                border:
                                    Border.all(color: Colors.white, width: .5),
                                borderRadius: BorderRadius.circular(4)), */
                            child: Text(
                      
                                  "",
                              style: kBody.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ), */
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ListView.separated(
                itemCount: controller.drawerItems.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () => controller
                          .mNavigateTo(controller.drawerItems[index]["name"]!),
                      child: Container(
                        child: controller.drawerItems.length - 1 == index
                            ? InkWell(
                                onTap: () {
                                  Get.back();
                                  vLogoutDialog();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: AppSpacing.md,
                                      horizontal: AppSpacing.sm),
                                  decoration: const BoxDecoration(
                                      // gradient: AppColor.kVerticalCovexGradiant
                                      color: AppColor.activeTab),
                                  child: Row(
                                    children: [
                                      Image(
                                        image: AssetImage(controller
                                            .drawerItems[index]["iconUri"]!),
                                        width: 20,
                                        height: 20,
                                      ),
                                      AppSpacing.sm.width,
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          width: double.infinity,
                                          child: Text(
                                            controller.drawerItems[index]
                                                    ["name"]!
                                                .toUpperCase(),
                                            style: kSubTitle.copyWith(
                                                color: AppColor.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: AppSpacing.md,
                                    horizontal: AppSpacing.sm),
                                decoration: const BoxDecoration(
                                    // gradient: AppColor.kVerticalCovexGradiant),
                                    color: AppColor.activeTab),
                                child: Row(
                                  children: [
                                    Image(
                                      image: AssetImage(controller
                                          .drawerItems[index]["iconUri"]!),
                                      width: 20,
                                      height: 20,
                                      color: Colors.white,
                                    ),
                                    AppSpacing.sm.width,
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        width: double.infinity,
                                        child: Text(
                                          controller.drawerItems[index]["name"]!
                                              .toUpperCase(),
                                          style: kSubTitle.copyWith(
                                              color: AppColor.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                      ));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: Colors.transparent,
                    height: 1,
                  );
                },
              ),
            ],
          ),
        )));
  }

  void vLogoutDialog() {
    Get.dialog(
        AlertDialog(
          backgroundColor: AppColor.white,
          contentPadding: const EdgeInsets.all(0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.w)),
          content: Container(
            padding: EdgeInsets.all(10.w),
            width: AppScreenSize.mGetWidth(kGlobContext, 80),
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Warning!",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
                AppSpacing.sm.height,
                const Text(
                  "Do you really want to logout?",
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                              vertical: AppSpacing.smh,
                            )),
                        child: Text(
                          "Cancel".toUpperCase(),
                          style: const TextStyle(
                              color: Colors.black45,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )),
                    AppSpacing.xxl.width,
                    ElevatedButton(
                        onPressed: () async {
                          await controller.mLogutUser();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.red,
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                              vertical: AppSpacing.smh,
                            )),
                        child: Text(
                          "Logout".toUpperCase(),
                          style: const TextStyle(
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

  Widget vBody() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: _vIconButton(
                  onTap: () {
                    print("Click");
                    return Get.toNamed(AppRoutes.exam);
                  },
                  iconLoc: StudentAssetLocation.my_exam,
                  // bgColor: AppColor.orange.shade100,
                  bgColor: AppColor.my_exam,

                  // iconColor: AppColor.orange,
                  label: "My exam".toUpperCase()),
            ),
            Expanded(
                child: _vIconButton(
                    onTap: () async {
                      Get.toNamed(AppRoutes.result);
                    },
                    iconLoc: StudentAssetLocation.my_result,
                    // bgColor: AppColor.green.shade100,
                    bgColor: AppColor.my_result,

                    // iconColor: AppColor.green,
                    label: "My result".toUpperCase())),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: _vIconButton(
                        onTap: () => Get.toNamed(AppRoutes.payments),
                        iconLoc: StudentAssetLocation.my_payments,
                        // bgColor: AppColor.blue.shade100,
                        bgColor: AppColor.my_payments,

                        // iconColor: AppColor.blue,
                        label: "My Payment".toUpperCase()))),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: _vIconButton(
                    onTap: () => Get.toNamed(AppRoutes.routine),
                    iconLoc: StudentAssetLocation.my_routine,
                    // bgColor: AppColor.purple.shade100,
                    bgColor: AppColor.my_routine,
                    // iconColor: AppColor.purple,
                    label: "My routine".toUpperCase()),
              ),
            ),
          ],
        ),
        AppSpacing.xl.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /* Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: _vIconButton(
                        onTap: () => Get.toNamed(AppRoutes.classroom),
                        iconLoc: StudentAssetLocation.my_class,
                        // bgColor: AppColor.red.shade100,
                        // iconColor: AppColor.red,
                        bgColor: AppColor.my_class,
                        label: "My class".toUpperCase()))),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: _vIconButton(
                        onTap: () => Get.toNamed(AppRoutes.liveClass),
                        iconLoc: StudentAssetLocation.live_class,
                        // bgColor: AppColor.amber.shade100,
                        bgColor: AppColor.live_class,
                        // iconColor: AppColor.amber,
                        label: "Live Class".toUpperCase()))), */
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: _vIconButton(
                    onTap: () => Get.toNamed(AppRoutes.calendar),
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
                        onTap: () => Get.toNamed(AppRoutes.attendance),
                        iconLoc: StudentAssetLocation.attendance,
                        // bgColor: AppColor.red.shade100,
                        // iconColor: AppColor.red,
                        bgColor: AppColor.attendance,
                        label: "Attendance".toUpperCase()))),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: _vIconButton(
                        onTap: () => Get.toNamed(AppRoutes.quiz),
                        iconLoc: StudentAssetLocation.my_quiz,
                        // bgColor: AppColor.amber.shade100,
                        bgColor: AppColor.my_quiz,
                        // iconColor: AppColor.amber,
                        label: "My Quiz".toUpperCase()))),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: _vIconButton(
                    onTap: () => Get.toNamed(AppRoutes.subjects),
                    iconLoc: StudentAssetLocation.my_subject,
                    // bgColor: AppColor.purple.shade100,
                    bgColor: AppColor.my_subject,
                    // iconColor: AppColor.purple,
                    label: "My subject".toUpperCase()),
              ),
            ),
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
                        // onTap: () => Get.toNamed(AppRoutes.website),
                        onTap: () async {
                          await controller.mGotoWebsite();
                        },
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
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: _vIconButton(
                        onTap: () {
                          Get.toNamed(AppRoutes.stuMessage);
                          // controller.mLogutUser();
                        },
                        // onTap: () => Get.toNamed(AppRoutes.login),
                        iconLoc: StudentAssetLocation.message_ic,
                        // bgColor: AppColor.amber.shade100,
                        bgColor: AppColor.messages,
                        // iconColor: AppColor.amber,
                        label: "Messages".toUpperCase()))),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: _vIconButton(
                        onTap: () {
                          vLogoutDialog();
                          // controller.mLogutUser();
                        },
                        // onTap: () => Get.toNamed(AppRoutes.login),
                        iconLoc: StudentAssetLocation.log_out,
                        // bgColor: AppColor.amber.shade100,
                        bgColor: AppColor.log_out,
                        // iconColor: AppColor.amber,
                        label: "Log out".toUpperCase()))),
          ],
        ),
        /*  AppSpacing.xl.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: Container()),
            Expanded(child: Container()),
          ],
        ), */
        /*  AppSpacing.xl.height,
        Row(
          children: [],
        ), */
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
            width: AppScreenSize.mGetWidth(kGlobContext, 14),
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(AppSpacing.sm)),
            child: Image(
              image: AssetImage(
                iconLoc,
              ),
              color: iconColor,
              width: AppScreenSize.mGetWidth(kGlobContext, 8),
            ),
          ),
          AppSpacing.sm.height,
          Text(
            label,
            style: kBody.copyWith(fontSize: 11),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
