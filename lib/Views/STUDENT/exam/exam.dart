import 'package:flutter/material.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/STUDENT/exam/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../Config/config.dart';

class Exam extends StatelessWidget {
  const Exam({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Exam Document",
        child: BaseWidgetChild(
          child: Column(children: [
            StuExamWidgets.vTopbar(),
            AppSpacing.md.height,
            StuExamWidgets.vExamDocumentsTable(),
          ]),
        ));
  }
}
