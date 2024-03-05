import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/TEACHER/notice/notice_controller.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../Config/config.dart';
import '../../../Controller/TEACHER/home/home_controller.dart';
import '../../../Model/PUBLIC/login/academic_group_model.dart';
import '../../../Utils/custom_utils.dart';
import '../../../Utils/utils.dart';
import '../../Widgets/user_cached_network_image.dart';
import '../home/widgets.dart';

class TeachNotification extends GetView<TeachNoticeController> {
  TeachNotification({super.key});
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final homeController = TeachHomeController.to;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text(
                "Noitce Board".toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: AppColor.primaryColor,
              actions: [
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
                        homeController.selectedAcademicGroup.value
                                .academicGroupName ??
                            "",
                        style: kBody.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      )),
                ),
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
              child: Container(
                  // child: Text("Notification"),
                  ),
            )));
  }

  Widget vEndDrawer() {
    kLog("ImgUrl: " +
        Utils.mMakeUserImageUrl(
            imageLoc: homeController.profileInfoModel.value.photo ?? "",
            alisName: homeController.siteListModel.value.siteAlias ?? ""));
    kLog("Designation: ${homeController.designition.value}");
    kLog("Imageloc: ${homeController.profileInfoModel.value.photo}");
    kLog("alisName: ${homeController.siteListModel.value.siteAlias}");
    return Obx(() => Drawer(
        backgroundColor: AppColor.inactiveTab,
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(5),
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
                                homeController.profileInfoModel.value.photo ??
                                    "",
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
                            "${homeController.profileInfoModel.value.firstName} ${homeController.profileInfoModel.value.lastName}",
                            style: kBody.copyWith(
                                color: const Color.fromARGB(255, 2, 2, 2),
                                fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                          ),
                          AppSpacing.sm.height,
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 4),
                            decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(2)),
                            child: Text(
                              homeController
                                      .designition.value.capitalizeFirst ??
                                  "",
                              style: kBody.copyWith(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          AppSpacing.smh.height,
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.sm,
                                vertical: AppSpacing.smh),
                            color: AppColor.inactiveTab,
                            /*  decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                            child: DropdownButton<AcademicGroup>(
                              // child: DropdownButton<String>(
                              value: homeController.selectedAcademicGroup.value,

                              icon: const Icon(Icons.keyboard_arrow_down),
                              iconSize: 12,
                              elevation: 10,
                              // style: kBody.copyWith(fontWeight: FontWeight.w500),
                              focusColor: AppColor.white,
                              dropdownColor: AppColor.inactiveTab,
                              isDense: true,
                              isExpanded: true,
                              underline: Container(),
                              onChanged: (AcademicGroup? selectedModel) {
                                homeController.mChangeSelectedAcademicGroup(
                                    selectedModel);
                              },

                              items: homeController.academicGroupList
                                  .map((AcademicGroup value) {
                                return DropdownMenuItem<AcademicGroup>(
                                  value: value,
                                  child: Text(
                                    value.academicGroupName ?? "",
                                    style: kBody.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
            Expanded(
              child: ListView.separated(
                itemCount: homeController.drawerItems.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () => homeController.mNavigateTo(
                          homeController.drawerItems[index]["name"]!),
                      child: Container(
                        child: homeController.drawerItems.length - 1 == index
                            ? InkWell(
                                onTap: () {
                                  Get.back();
                                  vLogoutDialog();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: AppSpacing.md,
                                      horizontal: AppSpacing.sm),
                                  decoration: BoxDecoration(
                                      // gradient: AppColor.kVerticalCovexGradiant
                                      color: AppColor.activeTab),
                                  child: Row(
                                    children: [
                                      Image(
                                        image: AssetImage(homeController
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
                                            homeController.drawerItems[index]
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
                                decoration: BoxDecoration(
                                    // gradient: AppColor.kVerticalCovexGradiant),
                                    color: AppColor.activeTab),
                                child: Row(
                                  children: [
                                    Image(
                                      image: AssetImage(homeController
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
                                          homeController.drawerItems[index]
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
                      ));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: Colors.transparent,
                    height: 1,
                  );
                },
              ),
            ),
          ],
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
                Text("Warning!",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
                AppSpacing.sm.height,
                Text(
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
                          await homeController.mLogutUser();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.red,
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                              vertical: AppSpacing.smh,
                            )),
                        child: Text(
                          "Logout".toUpperCase(),
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
