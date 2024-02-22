import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Views/STUDENT/helpdesk/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../Controller/student_library.dart';
import 'package:school_management_system/Model/STUDENT/helpdesk/stu_helpdesk_model.dart';

import '../../../Config/config.dart';

class HelpDesk extends GetView<HelpDeskController> {
  
  const HelpDesk({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      title: "Help Desk",
      child: BaseWidgetChild(
        child: vParentList(),
      ),
    );
  }

  vParentList() {
    return Obx(() {
      // kLog("Length: ${controller.stuHelpdeskModelList.isEmpty}");
      return ListView.separated(
        shrinkWrap: true,
        itemCount: controller.stuHelpdeskModelList.isEmpty
            ? 0
            : controller.stuHelpdeskModelList.length,
        itemBuilder: ((context, index) {
          final stuHelpdeskModel = controller.stuHelpdeskModelList[index];
          return Column(
            children: [
              _vTopBar(text: stuHelpdeskModel.name ?? ''),
              _vChildList(
                  list: stuHelpdeskModel.eduSiteHelpDeskSetting!,
                  onTap: (int tappedIndex) {
                    kLog(tappedIndex);
                    print(
                        "Tapped : ${stuHelpdeskModel.eduSiteHelpDeskSetting![tappedIndex].helpTitle}");
                    controller.mTappedOnHelpDeskItem(
                        stuHelpdeskModel.eduSiteHelpDeskSetting![tappedIndex]);
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
    });
  }

  _vTopBar({required String text}) {
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
      {required Null Function(int tappedIndex) onTap,
      required List<EduSiteHelpDeskSetting> list}) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: ((context, index) {
          final EduSiteHelpDeskSetting eduSiteHelpDeskSetting = list[index];
          return GestureDetector(
            onTap: () => onTap(index),
            child: _vPlainBlueBox(
              child: Text(
                eduSiteHelpDeskSetting.helpTitle ?? '',
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
