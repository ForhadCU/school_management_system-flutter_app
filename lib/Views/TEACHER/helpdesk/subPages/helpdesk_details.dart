import 'package:flutter/material.dart';
import 'package:school_management_system/Views/TEACHER/helpdesk/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

class TeachHelpDeskDetails extends StatelessWidget {
  const TeachHelpDeskDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Tutorial",
        child: BaseWidgetChild(
          child: SingleChildScrollView(
            child: TeachHelpDeskDetailsWidgets.vTutorialCard(),
          ),
        ));
  }
}
