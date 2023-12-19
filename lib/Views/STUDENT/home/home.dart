import 'package:flutter/material.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Views/STUDENT/home/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

class StuHome extends StatelessWidget {
  const StuHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        elevation: 0,
        backgroundColor: AppColor.white,
      ),
      endDrawer: StuHomeWidgets.vEndDrawer(),
      body: BaseWidgetChild(
        child: SingleChildScrollView(
          child: Column(
            children: [
              StuHomeWidgets.vBody(),
            ],
          ),
        ),
      ),
    );
  }
}
