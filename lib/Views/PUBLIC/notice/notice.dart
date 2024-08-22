// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/PUBLIC/notice_controller.dart';
import 'package:school_management_system/Model/PUBLIC/notice/notice_api_model.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:school_management_system/Utils/custom_utils.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../../Config/config.dart';
import '../../Widgets/base_widget.dart';
import '../../Widgets/buttons.dart';

class Notice extends GetView<NoticeController> {
  Notice({super.key});
  late M m;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        m = M(constraints);
        return BaseWidget(
          title: "Notice Board",
          child: BaseWidgetChild(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              vTopbar(),
              AppSpacing.xl.height,
              Expanded(child: vNoticeList())
            ],
          )),
        );
      },
    );
  }

  vNoticeList() {
    return Obx(() => controller.isLoading.value
        ? Container()
        : controller.noticeApiModel.value.data == null ||
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
                      files: data.files,
                      title: data.noticeTitle ?? "",
                      desc: data.noticeDescription ?? "",
                      date: data.createdAt == null
                          ? ""
                          : Utils().getFormatedDateTime(
                              data.createdAt.toString(),
                              kAppDateFormatWithTime12),
                      color: AppColor.kNoticeListColorPlate[
                          index % (AppColor.kNoticeListColorPlate.length)],
                      onTapToExpand: () {
                        controller.mUpdateClickedNoticeModel(data);
                        print("clicked: $index");
                        Get.toNamed(AppRoutes.expandedNotice);
                      },
                      onTapToDownload: () async {
                        await controller.mDownloadNotice(
                            path: data.files!.first.path);
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
      required Function onTapToExpand,
      required Function onTapToDownload,
      List<FileElement>? files}) {
    return GestureDetector(
      onTap: () {
        onTapToExpand();
      },
      child: Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: kContainerPrimary.copyWith(
            color: color.withOpacity(.15),
          ),
          child: StaggeredGrid.count(
            crossAxisCount: 8,
            children: [
              StaggeredGridTile.fit(
                  crossAxisCellCount: 8,
                  child: _vLeftPart(title, desc, color, () {
                    onTapToExpand();
                  }, date)),
              /*  files == null || files.isEmpty
                  ? Container()
                  : StaggeredGridTile.fit(
                      crossAxisCellCount: 2,
                      child: /* _vGoInside */ _vDownload(() {
                        onTapToDownload();
                      }, color)), */
            ],
          )),
    );
  }

  Widget vTopbar() {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md, horizontal: AppSpacing.sm),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: AppColor.activeTab),
      alignment: Alignment.centerLeft,
      child: m.xs
          ? StaggeredGrid.count(
              crossAxisCount: 7,
              crossAxisSpacing: AppSpacing.sm,
              mainAxisSpacing: AppSpacing.md,
              children: [
                StaggeredGridTile.fit(
                  crossAxisCellCount: 1,
                  child: Container(
                    height: 28,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSpacing.smh),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Obx(() => Text(
                          controller.numOfNoticesInRange.value.toString(),
                          style: kTitle.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColor.silverLakeBlue),
                        )),
                  ),
                ),
                StaggeredGridTile.fit(
                  crossAxisCellCount: 6,
                  child: Container(
                    height: 28,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
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
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                StaggeredGridTile.fit(
                    crossAxisCellCount: 1,
                    child: Container(
                      alignment: Alignment.center,
                    )),
                /* StaggeredGridTile.fit(
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
          ), */
                StaggeredGridTile.fit(
                  crossAxisCellCount: 6,
                  child: Container(
                    height: 28,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
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
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
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
            )
          : StaggeredGrid.count(
              crossAxisCount: 7,
              crossAxisSpacing: AppSpacing.sm,
              mainAxisSpacing: AppSpacing.md,
              children: [
                StaggeredGridTile.fit(
                  crossAxisCellCount: 1,
                  child: Container(
                    height: 28,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSpacing.smh),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
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
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
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
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
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

/*   Widget _vDownload() {
    return const Icon(
      Icons.download,
      color: AppColor.dollarBill,
      size: 32,
    );
  } */

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

  _vDownload(Null Function() onTapToDownload, Color icColor) {
    return GestureDetector(
      onTap: () {
        onTapToDownload();
      },
      child: Container(
        alignment: Alignment.centerRight,
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        child: const Icon(
          Icons.download,
          color: AppColor.dollarBill,
          size: 32,
        ),
      ),
    );
  }
}
