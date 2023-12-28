import 'package:flutter/material.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Views/STUDENT/result/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../Utils/utils.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        M m = M(constraints);
        return BaseWidget(
            title: "My Result".toUpperCase(),
            child: BaseWidgetChild(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ResultWidgets.vTopbar(m),
                    AppSpacing.xl.height,
                    ResultWidgets.vDownloadBtns(),
                    AppSpacing.md.height,
                    ResultWidgets.vResultPdf(),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
