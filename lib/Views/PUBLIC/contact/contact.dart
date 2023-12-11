import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/contact.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/PUBLIC/contact/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';
import 'package:school_management_system/Views/Widgets/custom_textfield.dart';
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
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Contact Us",
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: BaseWidget(
            child: SingleChildScrollView(
          child: Column(
            children: [
              InstitueBanaer(iconUrl: demo_school, title: tDemoSchoolName),
              AppSpacing.xl.height,
              ContactWidget().vInfo(controller),
              AppSpacing.md.height,
              ContactWidget().vMap(controller),
              AppSpacing.md.height,
              ContactWidget().vSites(controller),
              // _vSites(controller),
            ],
          ),
        )),
      ),
    );
  }
}
