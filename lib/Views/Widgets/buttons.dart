import 'package:flutter/material.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Utils/int_extensions.dart';

import '../../Config/styles/spacing.dart';

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
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xl, vertical: AppSpacing.smh),
          decoration: BoxDecoration(
              // color: AppColor.primaryColor,
              gradient: AppColor.kBtnGradiantColor,
              borderRadius: BorderRadius.circular(AppSpacing.smh)),
          child: Text(
            text,
            style: kTitle.copyWith(
              color: AppColor.white,
            ),
          ),
        ));
  }

  static Widget vPrimaryButtonWithoutColor({
    required Function onTap,
    required String text,
  }) {
    return GestureDetector(
        onTap: () => onTap(),
        child: Container(
          padding: const EdgeInsets.symmetric(
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

  static vCircularIconButton({
    String? text,
    required String iconUri,
    required Function onTap,
  }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: AppSpacing.circularIconButtonHeight,
            width: AppSpacing.circularIconButtonWidth,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColor.orange50),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(AppSpacing.sm + 2),
            child: Image(
              image: AssetImage(iconUri),
              fit: BoxFit.fill,
            ),
          ),
          AppSpacing.sm.height,
          Text(
            text ?? "",
            style: kLabel,
          )
        ],
      ),
    );
  }

  static vPrimaryButtonUnderlined({
    required Function onTap,
    required String text,
  }) {
    return GestureDetector(
        onTap: () => onTap(),
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.smh, vertical: AppSpacing.smh),
          decoration: const BoxDecoration(
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
                width: 38,
                child: Divider(
                  height: 1,
                  thickness: .5,
                  color: AppColor.primaryColor,
                ),
              )
            ],
          ),
        ));
  }
}
