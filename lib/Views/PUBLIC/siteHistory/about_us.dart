import 'package:flutter/material.dart';
import 'package:school_management_system/Controller/PUBLIC/about_us_controller.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/PUBLIC/siteHistory/widgets.dart';

import '../../../Config/config.dart';
import '../../Widgets/base_widget.dart';
import '../../Widgets/top_bar_banner.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AboutUsController.to;
    return BaseWidget(
      title: tAboutUs,
      child: BaseWidgetChild(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // vSchollNameBanner(),
            InstitueBanaer(
                iconUrl: controller.siteListModel.value.siteLogo,
                title:
                    controller.siteListModel.value.siteName ?? tDemoSchoolName),
            (AppSpacing.md).height,
            AboutUsWidgets.vBody(),
          ],
        ),
      )),
    );
  }
}
