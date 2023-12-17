import 'package:flutter/material.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';


class StudentNotice extends StatelessWidget {
  const StudentNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Noitce Board",
        child: BaseWidgetChild(
          child: Container(
            child: Text("Notice Board"),
          ),
        ));
  }
}