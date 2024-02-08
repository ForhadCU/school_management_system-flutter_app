import 'package:flutter/material.dart';
import 'package:school_management_system/Views/TEACHER/examMarksEntry/widgets.dart';

import '../../../Config/config.dart';
import '../../../Utils/utils.dart';
import '../../Widgets/base_widget.dart';

class ExamMarksEntry extends StatelessWidget {
  const ExamMarksEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        M m = M(constraints);
        return BaseWidget(
            title: "Exam Marks Entry",
            // endDrawer: TeachHomeWidgets.vEndDrawer(),
            child: BaseWidgetChild(
              child: Column(
                children: [
                  // ExamMarksEntryWidgets.vTabBar(),
                  ExamMarksEntryWidgets.vSubjectBasedMarkEntry(),
                  /*   ExamMarksEntryWidgets.vSubjectBasedMarksEntryTopbar(),
        AppSpacing.md.height,
        ExamMarksEntryWidgets.vSubjectBasedMarksEntryTable(),
        AppSpacing.sm.height,
         ExamMarksEntryWidgets.vUpdateBtn(), */
                  // ExamMarksEntryWidgets.vStudentBasedMarkEntry(),
                ],
              ),
            ));
      },
    );
  }
}
