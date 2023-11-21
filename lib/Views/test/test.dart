// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Config/constants/asset_location.dart';
import 'package:school_management_system/Config/constants/constants.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: ListTile(
          leading: CircleAvatar(
            radius: AppSpacing.logoSizeDemoSchool,
            backgroundImage: AssetImage(logoDemoSchool)
          ),
          title: Text(tDemoSchoolName, style: kTitle,),
          subtitle: Text("This will be address of this school"),
        ),
      ),
    );
  }
}
