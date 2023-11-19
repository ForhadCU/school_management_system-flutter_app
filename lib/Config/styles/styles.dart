
// title Text
import 'package:flutter/material.dart';

import '../config.dart';

const TextStyle kTitleSmaller = TextStyle(
    color: AppColor.primaryColor /* kTextColor */,
    fontSize: 14,
    fontWeight: FontWeight.w500);

// body Text
const TextStyle kBodySmall = TextStyle(
    color: AppColor.secondaryColor /* kTextColor */,
    fontSize: 12,
    fontWeight: FontWeight.w400);

// label Text
const TextStyle kLabelSmall = TextStyle(
    color: AppColor.secondaryColor /* kTextColor */,
    fontSize: 12,
    fontWeight: FontWeight.w400);


// Container decoration
BoxDecoration kPrimaryContainer = BoxDecoration(
    color: AppColor.primaryColor, borderRadius: BorderRadius.circular(5));
BoxDecoration kSecondaryContainer = BoxDecoration(
    color: AppColor.secondaryColor, borderRadius: BorderRadius.circular(5));

