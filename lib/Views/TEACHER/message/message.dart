import 'package:flutter/material.dart';
import 'package:school_management_system/Views/STUDENT/message/widgets.dart';
import 'package:school_management_system/Views/TEACHER/message/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

class TeachMessage extends StatelessWidget {
  const TeachMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Messages",
        child: BaseWidgetChild(
          child: Column(children: [
            TeachMessageWidgets.vMessageList(),
          ]),
        ));
  }
}
