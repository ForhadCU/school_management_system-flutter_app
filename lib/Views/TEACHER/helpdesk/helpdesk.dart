import 'package:flutter/material.dart';
import 'package:school_management_system/Views/STUDENT/helpdesk/widgets.dart';
import 'package:school_management_system/Views/TEACHER/helpdesk/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

class TeachHelpDesk extends StatelessWidget {
  const TeachHelpDesk({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      title: "Help Desk",
      child: BaseWidgetChild(
        child: TeachHelpDeskWidgets.vParentList(),
      ),
    );
  }
}
