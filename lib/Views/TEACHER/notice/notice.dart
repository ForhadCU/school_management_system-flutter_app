import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/TEACHER/notice/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../Config/config.dart';
import '../../../Controller/TEACHER/home/home_controller.dart';
import '../../../Model/PUBLIC/login/academic_group_model.dart';
import '../home/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/TEACHER/notice/notice_controller.dart';
import 'package:school_management_system/Controller/student_library.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../../Config/config.dart';
import '../../../Routes/app_pages.dart';
import '../../../Utils/custom_utils.dart';
import '../../Widgets/buttons.dart';
import '../../Widgets/custom_textfield.dart';

class TeachNotice extends GetView<TeachNoticeController> {

  TeachNotice({super.key});
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final homeController = TeachHomeController.to;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: const Text(
                "Noitce Board",
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
                child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                vTopbar(),
                AppSpacing.xl.height,
                Expanded(child: vNoticeList())
              ],
            ))));
  }

  Widget vEndDrawer() {
    kLog("ImgUrl: " +
        Utils.mMakeUserImageUrl(
            imageLoc: homeController.profileInfoModel.value.photo ?? "",
            alisName: controller.siteListModel.value.siteAlias ?? ""));
    kLog("Designation: ${homeController.designition.value}");
    kLog("Imageloc: ${homeController.profileInfoModel.value.photo}");
    kLog("alisName: ${controller.siteListModel.value.siteAlias}");
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
                      child: /* cachedNetworkImage(
                          "fccdc.theworld.com.bd/uploads/1707576530.jpeg"
                          /*  Utils.mMakeUserImageUrl(
                              imageLoc:
                                  controller.profileInfoModel.value.photo ??
                                      "",
                              alisName:
                                  controller.siteListModel.value.siteAlias ??
                                      "") */
                          ,
                          width: AppScreenSize.mGetWidth(kGlobContext, 23),
                          // height: AppScreenSize.mGetHeight(kGlobContext, 13),
                          fit: BoxFit.fill,
                        ) */

                          Image(
                        image: AssetImage(StudentAssetLocation.user),
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
            ListView.separated(
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

    vNoticeList() {
    return Obx(() => controller.noticeApiModel.value.data == null ||
            controller.noticeApiModel.value.data!.isEmpty
        ? Container(
            alignment: Alignment.center,
            child: Text(
              "No notice found!",
              style: kBody.copyWith(color: Colors.amber),
            ),
          )
        : ListView.separated(
            controller: controller.noticeListScrollCntrlr.value,
            shrinkWrap: true,
            itemCount: controller.noticeApiModel.value.data == null
                ? 0
                : controller.noticeList.length,
            itemBuilder: (context, index) {
              final data = controller.noticeList[index];
              return _vNoticeCard(
                  title: data.noticeTitle!,
                  desc: data.noticeDescription!,
                  date: Utils().getTimeFromTimeStamp(
                      data.createdAt.toString(), kAppDateFormatWithTime12),
                  color: AppColor.kNoticeListColorPlate[
                      index % (AppColor.kNoticeListColorPlate.length)],
                  onTap: () {
                    controller.mUpdateClickedNoticeModel(data);
                    print("clicked: $index");
                    Get.toNamed(AppRoutes.expandedTeachNotice);
                  });
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                color: Colors.white,
              );
            },
          ));
  }

   Widget _vNoticeCard(
      {required String title,
      required String desc,
      required String date,
      required Color color,
      required Function onTap}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: kContainerPrimary.copyWith(
            color: color.withOpacity(.15),
          ),
          child: StaggeredGrid.count(
            crossAxisCount: 7,
            children: [
              StaggeredGridTile.fit(
                  crossAxisCellCount: 6,
                  child: _vLeftPart(title, desc, color, () {
                    onTap();
                  }, date)),
              StaggeredGridTile.fit(
                  crossAxisCellCount: 1,
                  child: _vGoInside(() {
                    onTap();
                  }, color) /* _vDownload() */),
            ],
          )),
    );
  }

  Widget _vDropdown(StuNoticeController controller) {
    return Obx(
      () => DropdownButton<String>(
        value: controller.dropdownValue.value,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 12,
        elevation: 10,
        // style: kBody.copyWith(fontWeight: FontWeight.w500),
        focusColor: AppColor.white,
        dropdownColor: Colors.white,
        isDense: true,
        underline: Container(
          height: 2,
          color: Colors.white,
        ),
        onChanged: (String? newValue) {
          controller.mUpdateDropdownValue(newValue!);
        },
        items: <String>["Recent", "Older"]
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: kBody.copyWith(fontWeight: FontWeight.w500),
            ),
          );
        }).toList(),
      ),
    );
  }

   Widget vTopbar() {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md, horizontal: AppSpacing.sm),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: AppColor.activeTab),
      alignment: Alignment.centerLeft,
      child: StaggeredGrid.count(
        crossAxisCount: 7,
        crossAxisSpacing: AppSpacing.sm,
        mainAxisSpacing: AppSpacing.md,
        children: [
          StaggeredGridTile.fit(
            crossAxisCellCount: 1,
            child: Container(
              height: 28,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.smh),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Obx(() => Text(
                    controller.numOfNoticesInRange.value.toString(),
                    style: kTitle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColor.silverLakeBlue),
                  )),
            ),
          ),
          StaggeredGridTile.fit(
            crossAxisCellCount: 3,
            child: Container(
              height: 28,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
              decoration: BoxDecoration(
                  color: AppColor.topaz,
                  borderRadius: BorderRadius.circular(5)),
              child: Obx(() => GestureDetector(
                    onTap: () async {
                      await controller.mSelectDateFrom();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          size: 16,
                          color: AppColor.kGray100,
                        ),
                        (AppSpacing.smh / 2).width,
                        Text(
                          controller.mGetFormatDate(controller.dateFrom),
                          style: kBody.copyWith(
                              fontWeight: FontWeight.w500, color: Colors.black),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          /*  StaggeredGridTile.fit(
              crossAxisCellCount: 1,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "to",
                  style: kLabel,
                ),
              )), */
          StaggeredGridTile.fit(
            crossAxisCellCount: 3,
            child: Container(
              height: 28,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
              decoration: BoxDecoration(
                  color: AppColor.topaz,
                  borderRadius: BorderRadius.circular(5)),
              child: Obx(() => GestureDetector(
                    onTap: () async {
                      await controller.mSelectDateTo();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          size: 16,
                          color: AppColor.kGray100,
                        ),
                        (AppSpacing.smh / 2).width,
                        Text(
                          controller.mGetFormatDate(controller.dateTo),
                          style: kBody.copyWith(
                              fontWeight: FontWeight.w500, color: Colors.black),
                        ),
                      ],
                    ),
                  )),
            ),
          ),

          /// Searchbar
          StaggeredGridTile.fit(
            crossAxisCellCount: 7,
            child: _vGetResultBtn(),
          ) /*   StaggeredGridTile.fit(
            crossAxisCellCount: 7,
            child: CustomTextField(
              style: kBody,
              padding: const EdgeInsets.symmetric(
                vertical: AppSpacing.smh,
                horizontal: AppSpacing.sm,
              ),
              prefixIcon: Container(
                alignment: Alignment.center,
                width: 80,
                margin: const EdgeInsets.only(right: AppSpacing.sm),
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                decoration: const BoxDecoration(
                    border: Border(
                        right:
                            BorderSide(color: AppColor.kGray500, width: .5))),
                child: const Text(
                  "Active",
                  style: kBody,
                ),
              ),
              suffixIcon: const Icon(
                Icons.search,
                color: AppColor.kGray500,
              ),
            ),
          ) */
        ],
      ),
    );
  }

   _vGetResultBtn() {
    return AppButtons.vPrimaryButtonWithGradient(
      onTap: () async {
        controller.mResetList();
        await controller.mGetNoticesInRange();
      },
      text: "Get",
    );
  }

   Widget _vLeftPart(
      String title, String desc, Color color, Function onTap, String date) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /*   Expanded(
                  child: Text(
                    "Notice Title",
                    overflow: TextOverflow.ellipsis,
                    style: kTitle.copyWith(color: color),
                  ),
                ), */
                Expanded(
                  child: TextFormField(
                    onTap: () {
                      onTap();
                    },
                    controller: TextEditingController(text: title),
                    maxLines: 1,
                    style: kBody.copyWith(
                      fontWeight: FontWeight.w500,
                      color: color,
                    ),
                    readOnly: true,
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(0)),
                  ),
                ),
                /* MenuItemButton(
                        child: Icon(
                      Icons.more_vert,
                      color: AppColor.kNoticeListColorPlate[0],
                    )) */
              ],
            ),
            /*   AppSpacing.sm.height,
            TextFormField(
              controller: TextEditingController(text: kDummyText),
              maxLines: 3,
              style: kBody.copyWith(color: color),
              readOnly: true,
              textAlign: TextAlign.left,
              decoration: const InputDecoration(
                  border: InputBorder.none, contentPadding: EdgeInsets.all(0)),
            ), */
            AppSpacing.md.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      date,
                      style: kBody.copyWith(
                          fontWeight: FontWeight.w300, color: color),
                    ),
                    /* (AppSpacing.smh).width,
                    Text(
                      "03:50 PM",
                      style: kBody.copyWith(
                          fontWeight: FontWeight.w500, color: color),
                    ), */
                  ],
                ),
                // AppTexts.vClickableText(text: "Read more...", onTap: () {}),
              ],
            ),
          ]),
    );
  }

   Widget _vDownload() {
    return const Icon(
      Icons.download,
      color: AppColor.dollarBill,
      size: 32,
    );
  }

   _vGoInside(Null Function() onTap, Color icColor) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.arrow_forward_ios,
            color: icColor.withOpacity(.4),
            // color: AppColor.activeTab,
            size: 24,
          ),
        ],
      ),
    );
  }

  
  
}
