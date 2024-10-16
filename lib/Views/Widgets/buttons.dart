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

  static Widget vPrimaryButtonWithGradient({
    required Function onTap,
    required String text,
    Color? bg,
    Color? textColor,
    LinearGradient? bgGradient,
    bool? isShadow,
  }) {
    return GestureDetector(
        onTap: () => onTap(),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xl, vertical: AppSpacing.sm),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(1, 1),
                  blurRadius: 2,
                )
              ],
              color: bg ?? Colors.white,
              gradient: bgGradient ?? AppColor.kBtnGradiantColor,
              borderRadius: BorderRadius.circular(AppSpacing.smh)),
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: kTitleLite.copyWith(
              color: textColor ?? AppColor.white,
            ),
          ),
        ));
  }

  static Widget vPrimaryButton({
    required Function onTap,
    required String text,
    Color? bg,
    Color? textColor,
    bool? isShadow,
  }) {
    return GestureDetector(
        onTap: () => onTap(),
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xl, vertical: AppSpacing.sm),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(1, 1),
                  blurRadius: 2,
                )
              ],
              color: bg ?? Colors.white,
              borderRadius: BorderRadius.circular(AppSpacing.smh)),
          child: Text(
            text,
            style: kTitleLite.copyWith(
              color: textColor ?? AppColor.white,
            ),
          ),
        ));
  }

  static Widget vDownloadButton({
    required Function onTap,
    required String text,
    Color? bg,
    Color? textColor,
    LinearGradient? bgGradient,
    bool? isShadow,
    double? horizontalPadding,
    double? verticalPadding,
  }) {
    return GestureDetector(
        onTap: () => onTap(),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? AppSpacing.md,
              vertical: verticalPadding ?? AppSpacing.smh),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(1, 1),
                  blurRadius: 2,
                )
              ],
              color: bg ?? Colors.white,
              gradient: bgGradient ?? AppColor.kDonwloadBtnGradiantColor,
              borderRadius: BorderRadius.circular(AppSpacing.smh)),
          child: Row(
            children: [
              Icon(
                Icons.download,
                color: AppColor.white,
                size: 16,
              ),
              AppSpacing.smh.width,
              Text(
                text,
                style: kBody.copyWith(
                  color: textColor ?? AppColor.white,
                ),
              ),
            ],
          ),
        ));
  }


  static Widget vInstituteSwitchButton({
    required Function onTap,
    required String text,
    Color? bg,
    Color? textColor,
    LinearGradient? bgGradient,
    bool? isShadow,
    double? horizontalPadding,
    double? verticalPadding,
  }) {
    return GestureDetector(
        onTap: () => onTap(),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? AppSpacing.xl,
              vertical: verticalPadding ?? AppSpacing.sm),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(1, 1),
                  blurRadius: 2,
                )
              ],
              color: bg ?? Colors.white,
              gradient: bgGradient ?? AppColor.kBtnGradiantColor,
              borderRadius: BorderRadius.circular(AppSpacing.smh)),
          child: Row(
            children: [
              Icon(
                Icons.autorenew,
                color: AppColor.white,
                size: 16,
              ),
              AppSpacing.smh.width,
              Text(
                text,
                style: kTitleLite.copyWith(
                  fontWeight: FontWeight.w500,
                  color: textColor ?? AppColor.white,
                ),
              ),
            ],
          ),
        ));
  }

  static Widget vUpdateButton({
    required Function onTap,
    required String text,
    Color? bg,
    Color? textColor,
    LinearGradient? bgGradient,
    bool? isShadow,
    double? horizontalPadding,
    double? verticalPadding,
  }) {
    return GestureDetector(
        onTap: () => onTap(),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? AppSpacing.md,
              vertical: verticalPadding ?? AppSpacing.sm),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(1, 1),
                  blurRadius: 2,
                )
              ],
              color: bg ?? Colors.white,
              gradient: bgGradient ?? AppColor.kDonwloadBtnGradiantColor,
              borderRadius: BorderRadius.circular(AppSpacing.smh)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.upload,
                color: AppColor.white,
                size: 16,
              ),
              AppSpacing.smh.width,
              Text(
                text,
                style: kBody.copyWith(
                  color: textColor ?? AppColor.white,
                ),
              ),
            ],
          ),
        ));
  }

  static Widget vNarrowButton({
    required Function onTap,
    required String text,
    Color? bg,
    Color? textColor,
    LinearGradient? bgGradient,
    bool? isShadow,
    double? horizontalPadding,
    double? verticalPadding,
  }) {
    return GestureDetector(
        onTap: () => onTap(),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? AppSpacing.sm,
              vertical: verticalPadding ?? AppSpacing.smh),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(1, 1),
                  blurRadius: 2,
                )
              ],
              color: bg ?? Colors.white,
              borderRadius: BorderRadius.circular(AppSpacing.smh)),
          child: Row(
            children: [
              Text(
                text,
                style: kBody.copyWith(
                  fontWeight: FontWeight.w500,
                  color: textColor ?? AppColor.white,
                ),
              ),
            ],
          ),
        ));
  }

  static Widget vViewButton({
    required Function onTap,
    required String text,
    Color? bg,
    Color? textColor,
    LinearGradient? bgGradient,
    bool? isShadow,
  }) {
    return GestureDetector(
        onTap: () => onTap(),
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(1, 1),
                  blurRadius: 2,
                )
              ],
              color: bg ?? Colors.white,
              gradient: bgGradient ?? AppColor.kDonwloadBtnGradiantColor,
              borderRadius: BorderRadius.circular(AppSpacing.smh)),
          child: Row(
            children: [
              Icon(
                Icons.insert_drive_file_outlined,
                color: AppColor.white,
                size: 16,
              ),
              AppSpacing.smh.width,
              Text(
                text,
                style: kBody.copyWith(
                  color: textColor ?? AppColor.white,
                ),
              ),
            ],
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
