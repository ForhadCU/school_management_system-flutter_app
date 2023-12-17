import 'package:flutter/material.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';


class Notification extends StatelessWidget {
  const Notification({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Title",
        child: BaseWidgetChild(
          child: Container(
            child: Text("Notification"),
          ),
        ));
  }
}