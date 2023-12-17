import 'package:flutter/material.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';


class Website extends StatelessWidget {
  const Website({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Website",
        child: BaseWidgetChild(
          child: Container(
            child: Text("Website"),
          ),
        ));
  }
}