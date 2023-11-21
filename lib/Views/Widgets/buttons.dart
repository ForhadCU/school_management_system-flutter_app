import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Utils/spacing.dart';

class AppButtons {
  AppButtons._internal();
  static final AppButtons _singletone = AppButtons._internal();
  factory AppButtons() {
    return _singletone;
  }

  static Widget vPrimaryButton(
      {required Function onTap, required String text}) {
    return GestureDetector(
        onTap: () => onTap(),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.xl, vertical: AppSpacing.smh),
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(AppSpacing.smh)),
          child: Text(
            text,
            style: kTitle.copyWith(
              color: AppColor.white,
            ),
          ),
        ));
  }

  static vPrimaryButtonWithoutColor({
    required Function onTap,
    required String text,
  }) {
    return GestureDetector(
        onTap: () => onTap(),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.xl, vertical: AppSpacing.smh),
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.primaryColor, width: 2),
              color: AppColor.white,
              borderRadius: BorderRadius.circular(AppSpacing.smh)),
          child: Text(
            text,
            style: kTitle.copyWith(
              color: AppColor.primaryColor,
            ),
          ),
        ));
  }

  static vPrimaryButtonUnderlined({
    required Function onTap,
    required String text,
  }) {
    return GestureDetector(
        onTap: () => onTap(),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.smh, vertical: AppSpacing.smh),
          decoration:const BoxDecoration(
              // border: Border.all(color: AppColor.primaryColor, width: 2),
              color: AppColor.white,
              // borderRadius: BorderRadius.circular(AppSpacing.sm)
              ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: kTitle.copyWith(
                  color: AppColor.primaryColor,
                ),
              ),
              const SizedBox(
                width: 32,
                child: Divider(
                  height: .5,
                  thickness: .5,
                  color: AppColor.primaryColor,
                ),
              )
            ],
          ),
        ));
  }
}
