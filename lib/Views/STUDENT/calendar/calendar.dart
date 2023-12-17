import 'package:flutter/material.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';


class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Calendar",
        child: BaseWidgetChild(
          child: Container(
            child: Text("Calendar"),
          ),
        ));
  }
}