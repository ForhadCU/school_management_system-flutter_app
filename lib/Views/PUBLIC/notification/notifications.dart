import 'package:flutter/material.dart';

import '../../../Config/config.dart';
import '../../STUDENT/home/widgets.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: const Text(
                "Notifications",
                style: TextStyle(color: Colors.white),
              ),
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: AppColor.primaryColor,
              actions: [
                /* 
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
            body: const Center(
              child: Text("Notification"),
            )));
  }
}
