import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/TEACHER/test/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../Config/config.dart';
import '../../../Controller/TEACHER/test/test_ctrlr.dart';

class TeachTest extends GetView<TeachTestCtrlr> {
  const TeachTest({super.key});

  @override
  Widget build(BuildContext context) {
    // final TeachTestCtrlr testController = TeachTestCtrlr.to;

    return BaseWidget(
        title: "Test",
        child: BaseWidgetChild(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => TeachTestWidgets()
                    .vTextView(valueText: controller.textValue.value)),
                // Obx(() => Text(testController.textValue.toString())),
                AppSpacing.md.height,
                TeachTestWidgets.vListView(),
              ],
            ),
          ),
        ));
  }
}
