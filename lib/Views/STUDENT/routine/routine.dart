import 'package:flutter/material.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';


class Routine extends StatelessWidget {
  const Routine({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Routine",
        child: BaseWidgetChild(
          child: Container(
            child: Text("Routine"),
          ),
        ));
  }
}