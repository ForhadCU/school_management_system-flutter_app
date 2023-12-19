import 'package:flutter/material.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/STUDENT/notice/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../Config/config.dart';

class StudentNotice extends StatelessWidget {
  const StudentNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Noitce Board",
        child: BaseWidgetChild(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            NoticeWidgets.vTopbar(),
            AppSpacing.xl.height,
            Expanded(child: NoticeWidgets.vNoticeList())
          ],
        )));
  }
}
