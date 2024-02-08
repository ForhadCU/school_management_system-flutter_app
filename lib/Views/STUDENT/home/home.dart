import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/student_library.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Views/STUDENT/home/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

class StuHome extends StatelessWidget {
  const StuHome({super.key});

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    final controller = StuHomeController.to;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColor.primaryColor,
        actions: [/* 
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 14),
            padding: EdgeInsets.symmetric(
                vertical: AppSpacing.smh, horizontal: AppSpacing.sm),
            // color: Colors.red,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.white, width: .5),
                borderRadius: BorderRadius.circular(4)),
            child: Obx(() => Text(
                  controller.selectedAcademicGroup.value.academicGroupName ??
                      "",
                  style: kBody.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500),
                )),
          ), */
          /* SizedBox(
            width: 48,
          ), */
          IconButton(
              icon: new Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                _scaffoldKey.currentState!.openEndDrawer();
              }),
        ],
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
