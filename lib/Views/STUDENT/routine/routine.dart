import 'package:flutter/material.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/STUDENT/routine/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../Config/config.dart';

class Routine extends StatelessWidget {
  const Routine({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Routine",
        child: BaseWidgetChild(
          child: Container(
            child: Column(
              children: [
                RoutineWidgets.vTopbar(),
                AppSpacing.xl.height,
                RoutineWidgets.vDownloadBtns(),
                AppSpacing.md.height,
                RoutineWidgets.vRoutinePdf(),
              ],
            ),
          ),
        ));
  }
}
