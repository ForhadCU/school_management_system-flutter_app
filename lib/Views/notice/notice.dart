// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/notice.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../Config/config.dart';
import '../Widgets/text_fields.dart';

class Notice extends StatelessWidget {
  Notice({super.key});
  NoticeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            // title: Text("Notice Board"),
            elevation: 0,
            backgroundColor: AppColor.white,
          ),
          body: BaseWidget(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Notice Board",
                      style: kHeading,
                    ),
                    _vDropdown()
                  ],
                ),
                AppSpacing.xl.height,
                _vNoticeList()
              ],
            ),
          )),
        ),
      ),
    );
  }

  Widget _vNoticeCard(
      {required String title,
      required String desc,
      required Color color,
      required Function onTap}) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: kContainerPrimary.copyWith(
          color: color.withOpacity(.15),
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Notice Title",
                      overflow: TextOverflow.ellipsis,
                      style: kTitle.copyWith(color: color),
                    ),
                  ),
                  /* MenuItemButton(
                      child: Icon(
                    Icons.more_vert,
                    color: AppColor.kNoticeListColorPlate[0],
                  )) */
                ],
              ),
              AppSpacing.sm.height,
              TextFormField(
                controller: TextEditingController(text: kDummyText),
                maxLines: 3,
                style: kBody.copyWith(color: color),
                readOnly: true,
                textAlign: TextAlign.left,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(0)),
              ), 
              AppSpacing.md.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "December 12, 2023",
                    style: kBody.copyWith(
                        fontWeight: FontWeight.w500, color: color),
                  ),
                  AppTexts.vClickableText(text: "Read more...", onTap: () {}),
                ],
              ),
            ]),
      ),
    );
  }

  Widget _vDropdown() {
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
            onTap: () {
              
            });
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.white,
        );
      },
    );
  }
}
