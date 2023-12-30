import 'package:flutter/material.dart';
import 'package:school_management_system/Views/STUDENT/subjects/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

class StuSubjects extends StatelessWidget {
  const StuSubjects({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Subjects",
        child: BaseWidgetChild(
          child: Column(children: [
            StuSubjectsWidgets.vExamDocumentsTable(),
          ]),
        ));
  }
}
