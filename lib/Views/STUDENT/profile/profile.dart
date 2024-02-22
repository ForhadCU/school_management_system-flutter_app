import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Views/STUDENT/profile/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../../Controller/student_library.dart';
import '../../../Utils/custom_utils.dart';
import '../../Widgets/cached_network_image.dart';

class Profile extends GetView<StuProfileController> {
  Profile({super.key});
  final homeController = StuHomeController.to;

  @override
  Widget build(BuildContext context) {
    // kLog("Year: ${controller.stuProfileInfoModel.value.academicInfo!.year!}");
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "My Profile",
              style: TextStyle(color: Colors.white),
            ),
            elevation: 0,
            backgroundColor: AppColor.primaryColor,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          endDrawer: vEndDrawer(),
          body: BaseWidgetChild(
            child: SingleChildScrollView(child: Obx(
              () {
                return controller.stuProfileInfoModel.value.id == null
                    ? Center(
                        child: Text(
                          "No result found!",
                          style: kBody.copyWith(color: Colors.black45),
                        ),
                      )
                    : Column(
                        children: [
                          vYourInfo(),
                          AppSpacing.xl.height,
                          vAcademicInfo(),
                          AppSpacing.md.height,
                          vParentsInfo(),
                          AppSpacing.md.height,
                          vGaurdianInfo(),
                          AppSpacing.md.height,
                        ],
                      );
              },
            )),
          )),
    );
  }

  Widget vEndDrawer() {
    /*  return Obx(() {
      kLog("Length: ${homeController.drawerItems.length}"); */
    return Drawer(
        backgroundColor: AppColor.inactiveTab,
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
                    child: Image(
                      image: const AssetImage(StudentAssetLocation.user),
                      width: AppScreenSize.mGetWidth(kGlobContext, 23),
                      height: AppScreenSize.mGetHeight(kGlobContext, 13),
                      fit: BoxFit.fill,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${controller.stuProfileInfoModel.value.firstName} ${controller.stuProfileInfoModel.value.lastName}",
                          style: kBody.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w500),
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
                            homeController.designition.value.capitalizeFirst ??
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
              itemCount: homeController.drawerItems.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                kLog("Name: ${homeController.drawerItems[index]["name"]}");
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
                                decoration: const BoxDecoration(
                                    // gradient: AppColor.kVerticalCovexGradiant
                                    color: AppColor.activeTab),
                                child: Row(
                                  children: [
                                    Image(
                                      image: AssetImage(homeController
                                          .drawerItems[index]["iconUri"]!),
                                      width: 16,
                                      height: 16,
                                    ),
                                    AppSpacing.sm.width,
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        width: double.infinity,
                                        child: Text(
                                          homeController.drawerItems[index]
                                                  ["name"] ??
                                              "".toUpperCase(),
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
                                    image: AssetImage(homeController
                                        .drawerItems[index]["iconUri"]!),
                                    width: 16,
                                    height: 16,
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
          ],
        ));
    // });
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
                          await homeController.mLogutUser();
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

  vYourInfo() {
    kLog(
        "Uri: ${Utils.mMakeUserImageUrl(imageLoc: controller.stuProfileInfoModel.value.photo!, alisName: /* fccdc.theworld.com.bd/uploads/1707576530.jpeg */
            controller.siteListModel.value.siteAlias!)}");
    return _vPlainBlueBox(
        child: Row(
      children: [
        /*  Obx(() {
          controller.stuProfileInfoModel.value.photo != null &&
                  controller.siteListModel.value.siteAlias != null
              ? kLog(Utils.mMakeUserImageUrl(
                  imageLoc: controller.stuProfileInfoModel.value.photo!,
                  alisName: /* fccdc.theworld.com.bd/uploads/1707576530.jpeg */
                      controller.siteListModel.value.siteAlias!))
              : null;
          return */
        controller.stuProfileInfoModel.value.photo != null &&
                controller.siteListModel.value.siteAlias != null
            ? cachedNetworkImage(
                // "fccdc.theworld.com.bd/uploads/1707576530.jpeg"
                // "https://cdn-icons-png.flaticon.com/512/149/149071.png"
                Utils.mMakeUserImageUrl(
                    imageLoc: controller.stuProfileInfoModel.value.photo!,
                    alisName: /* fccdc.theworld.com.bd/uploads/1707576530.jpeg */
                        controller.siteListModel.value.siteAlias!),
                width: AppScreenSize.mGetWidth(kGlobContext, 23),
                // height: AppScreenSize.mGetHeight(kGlobContext, 13),
                fit: BoxFit.fill,
              )
            : Container(
                child: Text("Loading"),
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
        /*   ;
        })*/
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
                  controller.stuProfileInfoModel.value.firstName == null
                      ? ""
                      : controller.stuProfileInfoModel.value.firstName!
                          .toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColor.fontUsername,
                    fontSize: 16,
                  ),
                ),
                Text(
                  controller.stuProfileInfoModel.value.lastName == null
                      ? ""
                      : controller.stuProfileInfoModel.value.lastName!
                          .toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColor.fontUsername,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            AppSpacing.sm.height,
            Row(
              children: [
                Text(
                  "UserName".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Text(
                  " : ".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Expanded(
                  child: Text(
                    controller.stuProfileInfoModel.value.username == null
                        ? ""
                        : controller.stuProfileInfoModel.value.username!
                            .toUpperCase(),
                    softWrap: true,
                    style: TextStyle(
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
  }

  vParentsInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ///heading
        _vPlainBlueBox(
          child: Text(
            "Parent's information".toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColor.fontUsername),
          ),
        ),

        AppSpacing.sm.height,

        ///body
        Padding(
          padding: EdgeInsets.symmetric(
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
                      key: "Father",
                      value: controller.stuProfileInfoModel.value.fatherName!),
                  _vSingleColumTextPlate(key: "Phone", value: ""),
                  _vSingleColumTextPlate(key: "Nid", value: ""),
                  _vSingleColumTextPlate(key: "Bcn", value: ""),
                ],
              ),

              /*   /// Right part
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _vInfoTextPlate(key: "Shift", value: "Value"),
                  _vInfoTextPlate(key: "Roll", value: "Value"),
                  _vInfoTextPlate(key: "Group", value: "Value"),
                  _vInfoTextPlate(key: "Religion", value: "Valdddd"),
                ],
              ), */
            ],
          ),
        ),
        AppSpacing.sm.height,
        Padding(
          padding: EdgeInsets.symmetric(
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
                      key: "Mother",
                      value: controller.stuProfileInfoModel.value.motherName!),
                  _vSingleColumTextPlate(key: "Phone", value: ""),
                  _vSingleColumTextPlate(key: "Nid", value: ""),
                  _vSingleColumTextPlate(key: "Bcn", value: ""),
                ],
              ),

              /*   /// Right part
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _vInfoTextPlate(key: "Shift", value: "Value"),
                  _vInfoTextPlate(key: "Roll", value: "Value"),
                  _vInfoTextPlate(key: "Group", value: "Value"),
                  _vInfoTextPlate(key: "Religion", value: "Valdddd"),
                ],
              ), */
            ],
          ),
        )
      ],
    );
  }

  vGaurdianInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ///heading
        _vPlainBlueBox(
          child: Text(
            "Guardian's information".toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColor.fontUsername),
          ),
        ),

        AppSpacing.sm.height,

        ///body
        Padding(
          padding: EdgeInsets.symmetric(
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
                  _vSingleColumTextPlate(key: "Name", value: ""),
                  _vSingleColumTextPlate(key: "Home", value: ""),
                ],
              ),
            ],
          ),
        ),
      ],
    );
    ;
  }

  vAcademicInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ///heading
        _vPlainBlueBox(
          child: Text(
            "Academic information".toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColor.fontUsername),
          ),
        ),

        AppSpacing.sm.height,

        ///body
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 4,
          ),
          child: StaggeredGrid.count(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            children: [
              /// Left part
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _vDoubleColumTextPlate(
                      key: "Year",
                      value: homeController
                          .profileInfoModel.value.academicInfo!.year!),
                  _vDoubleColumTextPlate(
                      key: "Class",
                      value: homeController
                          .profileInfoModel.value.academicInfo!.className!),
                  _vDoubleColumTextPlate(
                      key: "Section",
                      value: homeController
                          .profileInfoModel.value.academicInfo!.sectionName!),
                  _vDoubleColumTextPlate(key: "Gender", value: ""),
                ],
              ),

              /// Right part
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _vDoubleColumTextPlate(
                      key: "Shift",
                      value: controller.stuProfileInfoModel.value.academicInfo!
                              .shiftName ??
                          ""),
                  _vDoubleColumTextPlate(
                      key: "Roll",
                      value: (controller.stuProfileInfoModel.value.id ?? 0)
                          .toString()),
                  _vDoubleColumTextPlate(
                      key: "Group",
                      value: controller.stuProfileInfoModel.value.academicInfo!
                              .classGroupName ??
                          ""),
                  _vDoubleColumTextPlate(key: "Religion", value: ""),
                ],
              ),
            ],
          ),
        )
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
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                )),
          ),
          2.width,
          Text(": ".toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
              )),
          2.width,
          Expanded(
            flex: 2,
            child: Text(value.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
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
            flex: 1,
            child: Text(key.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                )),
          ),
          2.width,
          Text(": ".toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
              )),
          2.width,
          Expanded(
            flex: 3,
            child: Text(value.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                )),
          )
        ],
      ),
    );
  }
}
