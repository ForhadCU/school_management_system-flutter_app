import 'package:flutter/material.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';


class Classroom extends StatelessWidget {
  const Classroom({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Classroom",
        child: BaseWidgetChild(
          child: Container(
            child: Text("Classroom"),
          ),
        ));
  }
}