import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
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
                      /* try {
                        if (await Permission.storage.request().isGranted) {
                          kLog('permission granted');

                          /*     await file.writeAsBytes(response);
          pdfFilePath.value = filePath; */
                          /* pdfPath.set(file.path);
            showBottomSheet(context!, invoiceRef, pdfPath.value); */
                        } else {
                          Map<Permission, PermissionStatus> statuses = await [
                            Permission.storage,
                          ].request();
                          kLog(statuses[Permission.storage].toString());
                          await Permission.storage.request();
                          kLog('request permission');
                        }
                      } catch (error) {
                        kLog(error);
                      } */
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
            Expanded(
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
                        label: "Live Class".toUpperCase()))),
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
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: _vIconButton(
                        onTap: () => Get.toNamed(AppRoutes.website),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
            Expanded(child: Container()),
            Expanded(child: Container()),
          ],
        ),
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

  static Widget vEndDrawer() {
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
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 82, 86, 143),
                        borderRadius: BorderRadius.circular(4)),
                    // color: Colors.orange,
                    child: Image(
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
                          "${controller.profileInfoModel.value.firstName} ${controller.profileInfoModel.value.lastName}",
                          style: kBody.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                        AppSpacing.sm.height,
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            controller.designition.value.capitalizeFirst ?? "",
                            style: kBody.copyWith(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        AppSpacing.smh.height,
                        Container(
                          alignment: Alignment.center,
                          // margin: EdgeInsets.symmetric(vertical: 14),
                          padding: EdgeInsets.symmetric(
                              vertical: AppSpacing.smh,
                              horizontal: AppSpacing.sm),
                          // color: Colors.red,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border:
                                  Border.all(color: Colors.white, width: .5),
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            controller.selectedAcademicGroup.value
                                    .academicGroupName ??
                                "",
                            style: kBody.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              /*   child: Table(columnWidths: {
                0: IntrinsicColumnWidth(),
                // 1: in(),
              }, children: [
                TableRow(children: [
                  /// column 1: follow column 2
                  Container(
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    // color: Colors.orange,
                    child: Image(
                      image: AssetImage(StudentAssetLocation.admin),
                      // width: 80,
                      height: 100,
                      fit: BoxFit.fill,
                      color: Colors.black,
                    ),
                  ),

                  /// column 2: Independent in increasing height
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${controller.profileInfoModel.value.firstName} ${controller.profileInfoModel.value.lastName}",
                          style: kBody.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                        AppSpacing.sm.height,
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            controller.designition.value.capitalizeFirst ?? "",
                            style: kBody.copyWith(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ), /* 
                        AppSpacing.sm.height,
                        Container(
                          alignment: Alignment.center,
                          // margin: EdgeInsets.symmetric(vertical: 14),
                          padding: EdgeInsets.symmetric(
                              vertical: AppSpacing.smh,
                              horizontal: AppSpacing.sm),
                          // color: Colors.red,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border:
                                  Border.all(color: Colors.white, width: .5),
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            controller.selectedAcademicGroup.value
                                    .academicGroupName ??
                                "",
                            style: kBody.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ), */
                        /* ListView.separated(
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (context, index) => Container(
                            alignment: Alignment.center,
                            height: 50,
                            color: Colors.blue,
                            child: Text(
                              "Item $index",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.black.withOpacity(.5),
                            height: 1,
                          ),
                        ), */
                      ],
                    ),
                  ),

                  /// column 3: follow column 2
                  /*  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.red,
                        child: Text('Expadable widget'),
                      )), */
                ]),
              ]),
             */
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
                                decoration: BoxDecoration(
                                    // gradient: AppColor.kVerticalCovexGradiant
                                    color: AppColor.activeTab),
                                child: Row(
                                  children: [
                                    Image(
                                      image: AssetImage(controller
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
                                    image: AssetImage(controller
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
        )));
  }

  static void vLogoutDialog() {
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
                          await controller.mLogutUser();
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
