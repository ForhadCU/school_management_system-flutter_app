import 'package:flutter/material.dart';
import 'package:school_management_system/Singletones/app_data.dart';

import '../../Config/config.dart';
import '../../Config/constants/constants.dart';

class AppTextFormFileds {
  AppTextFormFileds._internal();
  static final AppTextFormFileds _singleton = AppTextFormFileds._internal();
  factory AppTextFormFileds() {
    return _singleton;
  }

  static Widget vSearchInputField(
      {required String hintText,
      required TextEditingController controller,
      required Function onChanged(String value)}) {
    return TextFormField(
      controller: controller,
      onChanged: (value) {
        return AppData.debouncer.run(() {
          onChanged(value);
        });
      },
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl, vertical: AppSpacing.mdh),
        hintText: hintText,
        hintStyle: kBody.copyWith(color: const Color.fromARGB(255, 97, 97, 97)),
        fillColor: AppColor.secondaryColor.withOpacity(.5),
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.secondaryColor.withOpacity(.5),
            ),
            borderRadius: BorderRadius.circular(AppSpacing.xl)),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColor.secondaryColor.withOpacity(.5)),
            borderRadius: BorderRadius.circular(AppSpacing.xl)),
      ),
    );
  }
}
