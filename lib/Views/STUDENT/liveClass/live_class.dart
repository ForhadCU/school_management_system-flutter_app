import 'package:flutter/material.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';


class LiveClass extends StatelessWidget {
  const LiveClass({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "LiveClass",
        child: BaseWidgetChild(
          child: Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text("Comming soon..."),
            ),
          ),
        ));
  }
}