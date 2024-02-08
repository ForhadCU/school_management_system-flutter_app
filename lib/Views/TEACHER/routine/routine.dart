import 'package:flutter/material.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/STUDENT/routine/widgets.dart';
import 'package:school_management_system/Views/TEACHER/routine/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../Config/config.dart';

class TeachRoutine extends StatelessWidget {
  const TeachRoutine({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Routine",
        child: BaseWidgetChild(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TeachRoutineWidgets.vTopbar(),
                AppSpacing.xl.height,
                TeachRoutineWidgets.vDownloadBtns(),
                AppSpacing.md.height,
                TeachRoutineWidgets.vRoutinePdf(),
              ],
            ),
          ),
        ));
  }
}
