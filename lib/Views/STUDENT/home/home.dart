import 'package:flutter/material.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Home",
        child: BaseWidgetChild(
          child: Container(
            child: Text("Home"),
          ),
        ));
  }
}
