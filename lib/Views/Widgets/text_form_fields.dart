import 'package:flutter/material.dart';

import '../../Config/config.dart';
import '../../Config/constants/constants.dart';

class AppTextFormFileds {
  AppTextFormFileds._internal();
  static final AppTextFormFileds _singleton = AppTextFormFileds._internal();
  factory AppTextFormFileds() {
    return _singleton;
  }

  static Widget vSearchInputField(
      {required String hintText, TextEditingController? controller}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl, vertical: AppSpacing.mdh),
        hintText: hintText,
        hintStyle: kBody.copyWith(color: const Color.fromARGB(255, 97, 97, 97)),
        fillColor: AppColor.orange100,
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.orange300),
            borderRadius: BorderRadius.circular(AppSpacing.xl)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.orange300),
            borderRadius: BorderRadius.circular(AppSpacing.xl)),
      ),
    );
  }
}
