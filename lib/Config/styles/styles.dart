import 'package:flutter/material.dart';
import 'package:school_management_system/Config/constants/constants.dart';
import 'package:school_management_system/Utils/screen_size.dart';

import '../config.dart';

// title Text
const TextStyle kPrimaryHeading = TextStyle(
    color: AppColor.primaryColor /* kTextColor */,
    fontSize: 20,
    fontWeight: FontWeight.w600);

const TextStyle kHeading = TextStyle(
    color: AppColor.textColor /* kTextColor */,
    fontSize: 18,
    fontWeight: FontWeight.w600);
const TextStyle kTitle = TextStyle(
    color: AppColor.textColor /* kTextColor */,
    fontSize: 16,
    fontWeight: FontWeight.w600);
const TextStyle kSubTitle = TextStyle(
    color: AppColor.textColor /* kTextColor */,
    fontSize: 14,
    fontWeight: FontWeight.w500);

// body Text
const TextStyle kBody = TextStyle(
    color: AppColor.textColor /* kTextColor */,
    fontSize: 12,
    fontWeight: FontWeight.w500);

// label Text
const TextStyle kLabel = TextStyle(
  color: AppColor.textColor /* kTextColor */,
  fontSize: 11, /*   fontWeight: FontWeight.w300 */
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
BoxDecoration kPrimaryContainer = BoxDecoration(
    color: AppColor.primaryColor, borderRadius: BorderRadius.circular(5));
BoxDecoration kSecondaryContainer = BoxDecoration(
    color: AppColor.secondaryColor, borderRadius: BorderRadius.circular(5));
