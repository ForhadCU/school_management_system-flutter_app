import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';

class AppDialogs {
  static final AppDialogs _singleton = AppDialogs._internal();
  factory AppDialogs() {
    return _singleton;
  }
  AppDialogs._internal();
/* 
    tariffPopUp() {
    Get.dialog(
        AlertDialog(
          backgroundColor:AppColor.secondaryDarkColor,
          contentPadding: const EdgeInsets.all(0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
          content: Container(
            padding: EdgeInsets.all(20.w),
            height: 490.h,
            width: 348.w,
            decoration: const BoxDecoration(),

         
          ),
        ),
        barrierDismissible: false);
  } */
}
