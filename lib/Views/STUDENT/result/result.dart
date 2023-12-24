import 'package:flutter/material.dart';
import 'package:school_management_system/Views/STUDENT/result/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "My Result".toUpperCase(),
        child: BaseWidgetChild(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ResultWidgets.vTopbar(),
              ],
            ),
          ),
        ));
  }
}
