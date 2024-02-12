import 'package:flutter/material.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/STUDENT/notice/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../Config/config.dart';
import '../home/widgets.dart';

class StudentNotice extends StatelessWidget {
  const StudentNotice({super.key});

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();

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
        body: BaseWidgetChild(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            NoticeWidgets.vTopbar(),
            AppSpacing.xl.height,
            Expanded(child: NoticeWidgets.vNoticeList())
          ],
        )),
      ),
    );
  }
}
