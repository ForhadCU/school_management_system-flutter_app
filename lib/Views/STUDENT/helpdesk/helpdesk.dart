import 'package:flutter/material.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';


class HelpDesk extends StatelessWidget {
  const HelpDesk({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "HelpDesk",
        child: BaseWidgetChild(
          child: Container(
            child: Text("HelpDesk"),
          ),
        ));
  }
}