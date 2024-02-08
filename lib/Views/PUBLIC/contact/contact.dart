import 'package:flutter/material.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/PUBLIC/contact_controller.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/PUBLIC/contact/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';
import 'package:school_management_system/Views/Widgets/top_bar_banner.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ContactController.to;
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: BaseWidget(
        title: "Contact Us",
        child: BaseWidgetChild(
            child: SingleChildScrollView(
          child: Column(
            children: [
              InstitueBanaer(
                  iconUrl: controller.siteListModel.value.siteLogo,
                  title: controller.siteListModel.value.siteName!),
              AppSpacing.xl.height,
              ContactWidget().vInfo(),
              AppSpacing.md.height,
              ContactWidget().vMap(),
              AppSpacing.md.height,
              ContactWidget().vSites(),
              // _vSites(controller),
            ],
          ),
        )),
      ),
    );
  }
}
