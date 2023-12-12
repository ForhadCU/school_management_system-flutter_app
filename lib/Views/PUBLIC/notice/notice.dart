// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/notice.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';
import 'package:school_management_system/Views/Widgets/custom_textfield.dart';

import '../../../Config/config.dart';

class Notice extends StatelessWidget {
  const Notice({super.key});
  @override
  Widget build(BuildContext context) {
    NoticeController controller = Get.find();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notice Board"),
          elevation: 0,
          backgroundColor: AppColor.white,
        ),
        body: BaseWidgetChild(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _vTopbar(controller),
            AppSpacing.xl.height,
            Expanded(child: _vNoticeList())
          ],
        )),
      ),
    );
  }

  Widget _vNoticeCard(
      {required String title,
      required String desc,
      required Color color,
      required Function onTap}) {
    return GestureDetector(
      onTap: () {},
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
                  child: vLeftPart(title, desc, color, onTap)),
              StaggeredGridTile.fit(crossAxisCellCount: 1, child: vDownload()),
            ],
          )),
    );
  }

  Widget _vDropdown(NoticeController controller) {
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

  Widget _vNoticeList() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return _vNoticeCard(
            title: "Title $index",
            desc: "This is description one",
            color: AppColor.kNoticeListColorPlate[
                index % (AppColor.kNoticeListColorPlate.length)],
            onTap: () {});
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.white,
        );
      },
    );
  }

  _vTopbar(NoticeController controller) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: AppSpacing.md / 2, horizontal: AppSpacing.md),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: AppColor.primaryColor),
      alignment: Alignment.centerLeft,
      child: StaggeredGrid.count(
        crossAxisCount: 7,
        crossAxisSpacing: AppSpacing.sm,
        mainAxisSpacing: AppSpacing.sm,
        children: [
          StaggeredGridTile.fit(
            crossAxisCellCount: 1,
            child: Container(
              height: 28,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Text(
                "23",
                style: kTitle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColor.silverLakeBlue),
              ),
            ),
          ),
          StaggeredGridTile.fit(
            crossAxisCellCount: 3,
            child: Container(
              height: 28,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
              decoration: BoxDecoration(
                  color: AppColor.topaz,
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                "Wed, 10 Oct 2023",
                style: kBody.copyWith(
                    fontWeight: FontWeight.w500, color: Colors.black),
              ),
            ),
          ),
          StaggeredGridTile.fit(
            crossAxisCellCount: 3,
            child: Container(
              height: 28,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
              decoration: BoxDecoration(
                  color: AppColor.topaz,
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                "Wed, 10 Oct 2023",
                style: kBody.copyWith(
                    fontWeight: FontWeight.w500, color: Colors.black),
              ),
            ),
          ),
          StaggeredGridTile.fit(
            crossAxisCellCount: 7,
            child: CustomTextField(
              style: kBody,
              padding: EdgeInsets.symmetric(
                vertical: AppSpacing.smh,
                horizontal: AppSpacing.sm,
              ),
              prefixIcon: Container(
                alignment: Alignment.centerLeft,
                width: 64,
                margin: EdgeInsets.only(right: AppSpacing.sm),
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                decoration: BoxDecoration(
                    border: Border(
                        right:
                            BorderSide(color: AppColor.kGray500, width: .5))),
                child: Text(
                  "Active",
                  style: kBody,
                ),
              ),
              suffixIcon: Icon(
                Icons.search,
                color: AppColor.kGray500,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget vLeftPart(String title, String desc, Color color, Function onTap) {
    return Column(
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
                  controller: TextEditingController(text: kDummyNotice),
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
                    "Dec 12, 2023",
                    style: kBody.copyWith(
                        fontWeight: FontWeight.w500, color: color),
                  ),
                  (AppSpacing.smh).width,
                  Text(
                    "03:50 PM",
                    style: kBody.copyWith(
                        fontWeight: FontWeight.w500, color: color),
                  ),
                ],
              ),
              // AppTexts.vClickableText(text: "Read more...", onTap: () {}),
            ],
          ),
        ]);
  }

  Widget vDownload() {
    return Container(
      child: Icon(
        Icons.download,
        color: AppColor.dollarBill,
        size: 48,
      ),
    );
  }
}
