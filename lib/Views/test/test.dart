// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:school_management_system/Config/config.dart';

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
        child: Column(
          children: [
            Text(
              "This is heading",
              style: kHeading,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "This is title",
              style: kTitle,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "This is subtitle",
              style: kSubTitle,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "This is body",
              style: kBody,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "This is label",
              style: kLabel,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "This is error",
              style: kLabelError,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "This is success",
              style: kLabelSuccess,
            ),
          ],
        ),
      ),
    );
  }
}
