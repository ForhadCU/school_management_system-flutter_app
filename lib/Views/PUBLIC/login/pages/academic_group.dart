import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/login_controller.dart';
import 'package:school_management_system/Views/PUBLIC/login/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

class AcademicGroupPage extends GetView<LoginController> {
  const AcademicGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Select Academic Group",
        child: BaseWidgetChild(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LoginWidgets.vAcademicGroupList(),
              LoginWidgets.vNextButton(),
            ],
          ),
        ));
  }
}
