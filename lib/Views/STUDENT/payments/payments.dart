import 'package:flutter/material.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';


class Payments extends StatelessWidget {
  const Payments({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Payments",
        child: BaseWidgetChild(
          child: Container(
            child: Text("Payments"),
          ),
        ));
  }
}