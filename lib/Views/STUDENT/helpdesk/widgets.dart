import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/student_library.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../../Config/config.dart';

class HelpDeskWidgets {
  // make this class singleton
  HelpDeskWidgets._internal();
  static final HelpDeskWidgets _singleton = HelpDeskWidgets._internal();
  factory HelpDeskWidgets() {
    return _singleton;
  }

  // codes start from here
  // All methods should be static to maintain singleton instances
  static final _controller = HelpDeskController.to;

  static vParentList() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: ((context, index) {
        return Column(
          children: [
            _vTopBar(text: "This is topbar title"),
            _vChildList(
                list: [
                  "item 1",
                  "item 2",
                  "item 3",
                  "item 4",
                ],
                onTap: (int tappedIndex) {
                  print("Tapped $tappedIndex");
                  _controller.mTappedOnHelpDeskItem();
                }),
          ],
        );
      }),
      separatorBuilder: (BuildContext copagentext, int index) {
        return const Divider(
          color: AppColor.white,
          height: AppSpacing.md,
        );
      },
    );
  }

  static _vTopBar({required String text}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm, vertical: AppSpacing.sm + 2),
      decoration: const BoxDecoration(
          color: AppColor.helpDeskTopbar,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          )),
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.w500, fontSize: 18, color: AppColor.white),
      ),
    );
  }

  static _vChildList(
      {required List<String> list,
      required Null Function(int tappedIndex) onTap}) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () => onTap(index),
            child: _vPlainBlueBox(
              child: Text(
                list[index],
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColor.fontUsername),
              ),
            ),
          );
        }),
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.white,
            height: AppSpacing.smh,
          );
        },
        itemCount: list.length);
  }

  static Container _vPlainBlueBox({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
      decoration: const BoxDecoration(color: AppColor.frenchSkyBlue100),
      child: child,
    );
  }
}

class HelpDeskDetailsWidgets {
  // make this class singleton
  HelpDeskDetailsWidgets._internal();
  static final HelpDeskDetailsWidgets _singleton =
      HelpDeskDetailsWidgets._internal();
  factory HelpDeskDetailsWidgets() {
    return _singleton;
  }

  static vTutorialCard() {
    return Column(
      children: [
        _vTopBar(text: "Clicked Item title from Help Desk"),
        _vPlainBlueBox(
          child: _vBody(),
        )
      ],
    );
  }

  static _vTopBar({required String text}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm, vertical: AppSpacing.sm + 2),
      decoration: const BoxDecoration(
          color: AppColor.helpDeskTopbar,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          )),
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.w500, fontSize: 18, color: AppColor.white),
      ),
    );
  }

  static Container _vPlainBlueBox({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
      decoration: const BoxDecoration(color: AppColor.frenchSkyBlue100),
      child: child,
    );
  }

  static _vBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: AppScreenSize.mGetHeight(kGlobContext, 25),
          decoration: BoxDecoration(color: AppColor.secondaryColor),
        ),
        AppSpacing.md.height,
        Text("This is text data"),
      ],
    );
  }
  // codes start from here
  // All methods should be static to maintain singleton instances
}
