import 'package:flutter/material.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Views/STUDENT/classroom/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

class Classroom extends StatelessWidget {
  const Classroom({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Classroom",
        child: BaseWidgetChild(
            child: Column(
          children: [
            ClassroomWidgets.vTopbar(),
            AppSpacing.md.height,
            ClassroomWidgets.vVideoList(),
           
          ],
        )));
  }
}
