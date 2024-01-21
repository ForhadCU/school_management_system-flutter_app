import 'package:flutter/material.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Views/STUDENT/profile/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../home/widgets.dart';

class TeachProfile extends StatelessWidget {
  const TeachProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          elevation: 0,
          backgroundColor: AppColor.white,
        ),
        endDrawer: TeachHomeWidgets.vEndDrawer(),
        body: BaseWidgetChild(
          child: SingleChildScrollView(
            child: Column(
              children: [/* 
                ProfileWidgets.vYourInfo(),
                AppSpacing.xl.height,
                ProfileWidgets.vAcademicInfo(),
                AppSpacing.md.height,
                ProfileWidgets.vParentsInfo(),
                AppSpacing.md.height,
                ProfileWidgets.vGaurdianInfo(),
                AppSpacing.md.height,
              */ ],
            ),
          ),
        ));
  }
}
