import 'package:flutter/material.dart';
import '../config.dart';

// title Text
const TextStyle kPrimaryHeading = TextStyle(
    color: AppColor.primaryColor /* kTextColor */,
    fontSize: 20,
    fontWeight: FontWeight.w600);

const TextStyle kHeading = TextStyle(
    color: AppColor.textColor /* kTextColor */,
    fontSize: 22,
    fontWeight: FontWeight.w500);
const TextStyle kTitle = TextStyle(
    color: AppColor.textColor /* kTextColor */,
    fontSize: 18,
    fontWeight: FontWeight.w500);
const TextStyle kTitleLite = TextStyle(
    color: AppColor.textColor /* kTextColor */,
    fontSize: 16,
    fontWeight: FontWeight.w400);
const TextStyle kSubTitle = TextStyle(
    color: AppColor.textColor500 /* kTextColor */,
    fontSize: 14,
    fontWeight: FontWeight.w400);
const TextStyle kWidgetlabel = TextStyle(
    color: AppColor.textColor500 /* kTextColor */,
    fontSize: 14,
    fontWeight: FontWeight.w500);

// body Text
const TextStyle kBody = TextStyle(
    color: AppColor.textColor /* kTextColor */,
    fontSize: 14,
    fontWeight: FontWeight.w400);

// label Text
const TextStyle kLabel = TextStyle(
    color: AppColor.textColor /* kTextColor */,
    fontSize: 12,
    fontWeight: FontWeight.w400);
const TextStyle kLabelSmall = TextStyle(
  color: AppColor.textColor /* kTextColor */,
  fontSize: 8, /*   fontWeight: FontWeight.w300 */
);
const TextStyle kLabelError = TextStyle(
    color: AppColor.red /* kTextColor */,
    fontSize: 10,
    fontWeight: FontWeight.w400);
const TextStyle kLabelSuccess = TextStyle(
    color: AppColor.green /* kTextColor */,
    fontSize: 10,
    fontWeight: FontWeight.w400);

// Container decoration
BoxDecoration kContainerPrimary = BoxDecoration(
    color: AppColor.primaryColor, borderRadius: BorderRadius.circular(5));
BoxDecoration kContainerPrimaryWithGradient = BoxDecoration(
    gradient: AppColor.kBtnGradiantColor,
    borderRadius: BorderRadius.circular(5));
    BoxDecoration kContainerPrimaryWithGradientReverse = BoxDecoration(
    gradient: AppColor.kBtnGradiantColorReverse,
    borderRadius: BorderRadius.circular(5));

BoxDecoration kContainerNoticeBanner = BoxDecoration(
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        offset: Offset(.5, .5),
        blurRadius: 1,
      ),
    ],
    color: AppColor.white,
    border: Border.all(color: AppColor.orange500, width: 1),
    borderRadius: BorderRadius.circular(5));

BoxDecoration kContainerPlainWithBorder = BoxDecoration(
    color: AppColor.white,
    border: Border.all(color: AppColor.orange500, width: 1),
    borderRadius: BorderRadius.circular(5));

BoxDecoration kSecondaryContainer = BoxDecoration(
    color: AppColor.secondaryColor, borderRadius: BorderRadius.circular(5));
