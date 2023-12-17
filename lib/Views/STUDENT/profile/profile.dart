import 'package:flutter/material.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';


class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        title: "Profile",
        child: BaseWidgetChild(
          child: Container(
            child: Text("Profile"),
          ),
        ));
  }
}