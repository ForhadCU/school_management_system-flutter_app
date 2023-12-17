import 'package:flutter/material.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';


class Exam extends StatelessWidget {
  const Exam({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Exam",
        child: BaseWidgetChild(
          child: Container(
            child: Text("Exam"),
          ),
        ));
  }
}