import 'package:flutter/material.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Views/STUDENT/profile/widgets.dart';
import 'package:school_management_system/Views/TEACHER/profile/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../home/widgets.dart';

class TeachProfile extends StatelessWidget {
  const TeachProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Profile", style: TextStyle(color: Colors.white),),
          elevation: 0,
          backgroundColor: AppColor.primaryColor,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        endDrawer: TeachHomeWidgets.vEndDrawer(),
        body: BaseWidgetChild(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TeachProfileWidgets.vYourInfo(),
                AppSpacing.xl.height,
                TeachProfileWidgets.vAcademicInfo(),
                AppSpacing.md.height,
                TeachProfileWidgets.vPersonalInfo(),
                AppSpacing.md.height,
              ],
            ),
          ),
        ));
  }
}
