import 'package:flutter/material.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Views/STUDENT/home/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

class StuHome extends StatelessWidget {
  const StuHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColor.primaryColor,
      ),
      endDrawer: StuHomeWidgets.vEndDrawer(),
      body: BaseWidgetChild(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppSpacing.md.height,
              StuHomeWidgets.vBody(),
            ],
          ),
        ),
      ),
    );
  }
}
