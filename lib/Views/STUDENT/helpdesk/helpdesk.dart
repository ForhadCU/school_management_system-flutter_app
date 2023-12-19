import 'package:flutter/material.dart';
import 'package:school_management_system/Views/STUDENT/helpdesk/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

class HelpDesk extends StatelessWidget {
  const HelpDesk({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Help Desk",
        child: BaseWidgetChild(
            child: HelpDeskWidgets.vParentList(),
          ),
        );
  }
}
