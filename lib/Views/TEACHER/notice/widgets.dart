import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/student_library.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../../Config/config.dart';
import '../../../Routes/app_pages.dart';
import '../../../Utils/custom_utils.dart';
import '../../Widgets/custom_textfield.dart';

class TeachNoticeWidgets {
  // make this class singleton
  TeachNoticeWidgets._internal();
  static final TeachNoticeWidgets _singleton = TeachNoticeWidgets._internal();
  factory TeachNoticeWidgets() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances
  static final controller = StuNoticeController.to;
  static Widget vNoticeList() {
    return Obx(() => ListView.separated(
          shrinkWrap: true,
          itemCount: controller.noticeApiModel.value.data == null
              ? 0
              : controller.noticeApiModel.value.data!.length,
          itemBuilder: (context, index) {
            final data = controller.noticeApiModel.value.data![index];
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
                  Get.toNamed(AppRoutes.expandedStuNotice);
                });
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: Colors.white,
            );
          },
        ));
  }

  static Widget _vNoticeCard(
      {required String title,
      required String desc,
      required String date,
      required Color color,
      required Function onTap}) {
    return Container(
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
            StaggeredGridTile.fit(crossAxisCellCount: 1, child: _vDownload()),
          ],
        ));
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

  static Widget vTopbar() {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md / 2, horizontal: AppSpacing.md),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: AppColor.primaryColor),
      alignment: Alignment.centerLeft,
      child: StaggeredGrid.count(
        crossAxisCount: 7,
        crossAxisSpacing: AppSpacing.sm,
        mainAxisSpacing: AppSpacing.sm + 2,
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
                    onTap: () => controller.mSelectDateFrom(),
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
                    onTap: () => controller.mSelectDateTo(),
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
          StaggeredGridTile.fit(
            crossAxisCellCount: 7,
            child: CustomTextField(
              style: kBody,
              padding: const EdgeInsets.symmetric(
                vertical: AppSpacing.smh,
                horizontal: AppSpacing.sm,
              ),
              prefixIcon: Container(
                alignment: Alignment.centerLeft,
                width: 64,
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
          )
        ],
      ),
    );
  }

  static Widget _vLeftPart(
      String title, String desc, Color color, Function onTap, String date) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                    maxLines: 3,
                    style: kTitle.copyWith(
                      fontWeight: FontWeight.w500,
                      color: color,
                    ),
                    readOnly: true,
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
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
                          fontWeight: FontWeight.w500, color: color),
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

  static Widget _vDownload() {
    return const Icon(
      Icons.download,
      color: AppColor.dollarBill,
      size: 48,
    );
  }
}
