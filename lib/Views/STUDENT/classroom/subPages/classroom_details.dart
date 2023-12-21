import 'package:flutter/material.dart';
import 'package:school_management_system/Views/STUDENT/classroom/widgets.dart';

import '../../../Widgets/base_widget.dart';

class ClassroomDetails extends StatelessWidget {
  const ClassroomDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Tutorial",
        child: BaseWidgetChild(
          child: SingleChildScrollView(
            child: ClassroomDetailsWidgets.vTutorialCard(),
          ),
        ));
  }
}
