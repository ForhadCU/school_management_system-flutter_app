import 'package:flutter/material.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Config/constants/asset_location.dart';
import 'package:school_management_system/Config/constants/constants.dart';

class Test extends StatelessWidget {
  const Test({super.key,  this.height,  this.width});
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          height: height ?? AppSpacing.noticeBannerHeight - (AppSpacing.noticeBannerHeight/2),
          width: width ?? 100,
          decoration: BoxDecoration(
            color: AppColor.orange500
          ),
        ),
      ),
    );
  }
}
