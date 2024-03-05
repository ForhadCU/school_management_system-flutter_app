import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../Controller/TEACHER/home/home_controller.dart';
import '../../../Model/PUBLIC/login/academic_group_model.dart';
import '../../../Utils/utils.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:school_management_system/Controller/TEACHER/profile/profile_controller.dart';
import 'package:school_management_system/Views/Widgets/user_cached_network_image.dart';

import '../../../Utils/custom_utils.dart';

class TeachProfile extends GetView<TeachProfileController> {
  TeachProfile({super.key});
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final homeController = TeachHomeController.to;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text(
                "My Profile".toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: AppColor.primaryColor,
              actions: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(vertical: 14),
                  padding: const EdgeInsets.symmetric(
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
                    icon: const Icon(Icons.menu, color: Colors.white),
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
                    vYourInfo(),
                    AppSpacing.xl.height,
                    vAcademicInfo(),
                    AppSpacing.md.height,
                    vPersonalInfo(),
                    AppSpacing.md.height,
                  ],
                ),
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
                      // width: AppScreenSize.mGetWidth(kGlobContext, 10),
                      // height: AppScreenSize.mGetHeight(kGlobContext, 10),
                      margin: EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 82, 86, 143),
                          borderRadius: BorderRadius.circular(4)),
                      // color: Colors.orange,
                      child: homeController.profileInfoModel.value.photo !=
                                  null &&
                              controller.siteListModel.value.siteAlias != null
                          ? userCachedNetworkImage(
                              // "https://fccdc.theworld.com.bd/uploads/1708681335.jpeg",
                              // "https://cdn-icons-png.flaticon.com/512/149/149071.png",
                              Utils.mMakeUserImageUrl(
                                  imageLoc: homeController
                                      .profileInfoModel.value.photo!,
                                  alisName: /* fccdc.theworld.com.bd/uploads/1707576530.jpeg */
                                      controller
                                          .siteListModel.value.siteAlias!),
                              width: AppScreenSize.mGetWidth(kGlobContext, 23),
                              height:
                                  AppScreenSize.mGetHeight(kGlobContext, 13),
                              fit: BoxFit.fill,
                            )
                          : Image(
                              image: const AssetImage(default_user),
                              width: AppScreenSize.mGetWidth(kGlobContext, 23),
                              fit: BoxFit.fill,
                            ), /* cachedNetworkImage(
                          "fccdc.theworld.com.bd/uploads/1707576530.jpeg"
                          /*  Utils.mMakeUserImageUrl(
                              imageLoc:
                                  homeController.profileInfoModel.value.photo ??
                                      "",
                              alisName:
                                  homeController.siteListModel.value.siteAlias ??
                                      "") */
                          ,
                          width: AppScreenSize.mGetWidth(kGlobContext, 23),
                          // height: AppScreenSize.mGetHeight(kGlobContext, 13),
                          fit: BoxFit.fill,
                        ) */

                      /*  Image(
                        image: AssetImage(StudentAssetLocation.user),
                        width: AppScreenSize.mGetWidth(kGlobContext, 23),
                        height: AppScreenSize.mGetHeight(kGlobContext, 13),
                        fit: BoxFit.fill,
                        color: Colors.black,
                      ), */
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

  Container _vPlainBlueBox({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm, vertical: AppSpacing.md),
      decoration:
          BoxDecoration(color: AppColor.frenchSkyBlue100.withOpacity(.5)),
      child: child,
    );
  }

  vYourInfo() {
    return Obx(() {
      /*     kLog(
          "ImgUrlProfile: ${Utils.mMakeUserImageUrl(imageLoc: homeController.profileInfoModel.value.photo ?? "", alisName: /* fccdc.theworld.com.bd/uploads/1707576530.jpeg */
              controller.siteListModel.value.siteAlias ?? "")}"); */
      return _vPlainBlueBox(
          child: Row(
        children: [
          userCachedNetworkImage(
            // "fccdc.theworld.com.bd/uploads/1707576530.jpeg"
            Utils.mMakeUserImageUrl(
                imageLoc: homeController.profileInfoModel.value.photo ?? "",
                alisName: /* fccdc.theworld.com.bd/uploads/1707576530.jpeg */
                    homeController.siteListModel.value.siteAlias ?? ""),
            width: AppScreenSize.mGetWidth(kGlobContext, 23),
            // height: AppScreenSize.mGetHeight(kGlobContext, 13),
            fit: BoxFit.fill,
          ) /* Image(
          image: AssetImage(
            StudentAssetLocation.user,
          ),
          color: Colors.black45,
          // image: CachedNetworkImage(imageUrl: controller.stuProfileInfoModel.value.),
          width: 64,
          height: 70,
          fit: BoxFit.cover,
        ) */
          ,
          AppSpacing.md.width,
          Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    homeController.profileInfoModel.value.firstName == null
                        ? ""
                        : homeController.profileInfoModel.value.firstName!
                            .toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColor.fontUsername,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    homeController.profileInfoModel.value.lastName == null
                        ? ""
                        : " ${homeController.profileInfoModel.value.lastName!.toUpperCase()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColor.fontUsername,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              AppSpacing.sm.height,
              Row(
                children: [
                  /* Text(
                  "UserName".toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  " : ".toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ), */
                  Expanded(
                    child: Text(
                      controller.userDesignition.value.capitalizeFirst ?? "N/A",
                      softWrap: true,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              AppSpacing.sm.height,
              Row(
                children: [
                  Text(
                    "UserName".capitalizeFirst!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    " : ".toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      homeController.profileInfoModel.value.username == null
                          ? "N/A"
                          : homeController.profileInfoModel.value.username!
                              .toLowerCase(),
                      softWrap: true,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ), /* 
            AppSpacing.smh.height,
            Row(
              children: [
                Text(
                  "Phone".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  " : ".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Expanded(
                  child: Text(
                   controller.stuProfileInfoModel.value. == null
                      ? ""
                      : controller.stuProfileInfoModel.value.username!
                          .toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            AppSpacing.smh.height, */
            ],
          ))
        ],
      ));
    });
  }

  vPersonalInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ///heading
        _vPlainBlueBox(
          child: Text(
            "Personal information".toUpperCase(),
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColor.fontUsername),
          ),
        ),

        AppSpacing.sm.height,

        ///body
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          child: StaggeredGrid.count(
            crossAxisCount: 1,
            crossAxisSpacing: 2,
            children: [
              /// Left part
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _vSingleColumTextPlate(
                      key: "Name",
                      value:
                          "${homeController.profileInfoModel.value.firstName ?? ""} ${homeController.profileInfoModel.value.lastName ?? ""}"),
                  _vSingleColumTextPlate(
                      key: "Father ",
                      value: homeController.profileInfoModel.value.fatherName !=
                              ""
                          ? homeController.profileInfoModel.value.fatherName!
                          : "N/A"),
                  _vSingleColumTextPlate(
                      key: "Mother ",
                      value: homeController.profileInfoModel.value.motherName !=
                              ""
                          ? homeController.profileInfoModel.value.motherName!
                          : "N/A"),
                  _vSingleColumTextPlate(
                      key: "Present Address",
                      value: homeController.profileInfoModel.value.address!
                                      .presentAddress!.districtName ==
                                  null ||
                              homeController.profileInfoModel.value.address!
                                      .presentAddress!.districtName ==
                                  ""
                          ? "N/A"
                          : "${homeController.profileInfoModel.value.address!.presentAddress!.districtName} , ${homeController.profileInfoModel.value.address!.presentAddress!.divisionName}"),
                  _vSingleColumTextPlate(
                      key: "Permanent Address",
                      value: homeController.profileInfoModel.value.address!
                                      .permanentAddress!.districtName ==
                                  null ||
                              homeController.profileInfoModel.value.address!
                                      .permanentAddress!.districtName ==
                                  ""
                          ? "N/A"
                          : "${homeController.profileInfoModel.value.address!.permanentAddress!.districtName}, ${homeController.profileInfoModel.value.address!.permanentAddress!.divisionName ?? ""}"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  vAcademicInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ///heading
        _vPlainBlueBox(
          child: Text(
            "Academic information".toUpperCase(),
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColor.fontUsername),
          ),
        ),

        AppSpacing.sm.height,

        ///body
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          child: StaggeredGrid.count(
            crossAxisCount: 1,
            crossAxisSpacing: 2,
            children: [
              /// Left part
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _vSingleColumTextPlate(
                      key: "Office Id",
                      value:
                          homeController.profileInfoModel.value.username != ""
                              ? homeController.profileInfoModel.value.username!
                              : "N/A"),
                  _vSingleColumTextPlate(
                      key: "Blood Group",
                      value: homeController.profileInfoModel.value.bladeGroup !=
                              ""
                          ? homeController.profileInfoModel.value.bladeGroup!
                          : "N/A"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Padding _vDoubleColumTextPlate({required String key, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.smh),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(key.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                )),
          ),
          2.width,
          Text(": ".toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              )),
          2.width,
          Expanded(
            flex: 2,
            child: Text(value.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                )),
          )
        ],
      ),
    );
  }

  Padding _vSingleColumTextPlate({required String key, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.smh),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(key.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                )),
          ),
          2.width,
          Text(": ".toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              )),
          2.width,
          Expanded(
            flex: 4,
            child: Text(value.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                )),
          )
        ],
      ),
    );
  }
}
