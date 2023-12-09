import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Config/constants/asset_location.dart';
import 'package:school_management_system/Config/constants/constants.dart';
import 'package:school_management_system/Controller/test/test_controller.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../Widgets/text_fields.dart';

class Test extends StatelessWidget {
  Test({super.key, this.height, this.width});
  final double? height;
  final double? width;

  TestController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(AppSpacing.md),

            /// Code here....

            child: Container()
          ),
        ));
  }
}
