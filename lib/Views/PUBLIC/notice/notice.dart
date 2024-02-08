// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/PUBLIC/notice/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';
import 'package:school_management_system/Views/Widgets/custom_textfield.dart';

import '../../../Config/config.dart';
import '../../../Controller/PUBLIC/notice_controller.dart';

class Notice extends StatelessWidget {
  const Notice({super.key});
  @override
  Widget build(BuildContext context) {
    NoticeController controller = Get.find();

    return BaseWidget(
      title: "Notice Board",
      child: BaseWidgetChild(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          NoticeWidgets.vTopbar(),
          AppSpacing.xl.height,
          Expanded(child: NoticeWidgets.vNoticeList())
        ],
      )),
    );
  }
}
