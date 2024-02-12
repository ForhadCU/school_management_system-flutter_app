import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../Config/config.dart';
import '../../../Controller/TEACHER/home/home_controller.dart';
import '../home/widgets.dart';

class TeachNotification extends StatelessWidget {
  const TeachNotification({super.key});

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    final controller = TeachHomeController.to;
    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: const Text(
                "Noitce Board",
                style: TextStyle(color: Colors.white),
              ),
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: AppColor.primaryColor,
              actions: [
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
                        controller.selectedAcademicGroup.value
                                .academicGroupName ??
                            "",
                        style: kBody.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      )),
                ),
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
            endDrawer: TeachHomeWidgets.vEndDrawer(),
            body: BaseWidgetChild(
              child: Container(
                child: Text("Notification"),
              ),
            )));
  }
}
