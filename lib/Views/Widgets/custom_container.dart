import 'package:flutter/material.dart';
import 'package:school_management_system/Config/config.dart';

class CommonContainers {
  // make this class singleton
  CommonContainers._internal();
  static final CommonContainers _singleton = CommonContainers._internal();
  factory CommonContainers() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static vTabItemContainer({
    required String text,
    required bool isActive,
    Null Function()? onTap,
  }) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
          decoration: BoxDecoration(
            color: isActive
                ? AppColor.activeTab
                // : AppColor.secondaryColor.withOpacity(.8),
                : AppColor.inactiveTab,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5), topLeft: Radius.circular(5)),
          ),
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: kBody.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColor.white,
            ),
          )),
    );
  }
}
