import 'package:flutter/material.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';


class Attendance extends StatelessWidget {
  const Attendance({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Attendance",
        child: BaseWidgetChild(
          child: Container(
            child: Text("Attendance"),
          ),
        ));
  }
}