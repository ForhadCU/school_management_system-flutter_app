import 'package:flutter/material.dart';
import 'package:school_management_system/Views/STUDENT/helpdesk/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

class HelpDeskDetails extends StatelessWidget {
  const HelpDeskDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Tutorial",
        child: BaseWidgetChild(
          child: SingleChildScrollView(
            child: HelpDeskDetailsWidgets.vTutorialCard(),
          ),
        ));
  }
}
