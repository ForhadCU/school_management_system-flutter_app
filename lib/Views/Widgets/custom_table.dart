import 'package:flutter/material.dart';

import 'package:school_management_system/Config/config.dart';

TabBar customTabBar({required List<Widget> tabs, bool isScrollable = true}) {
  return TabBar(
      isScrollable: isScrollable,
      labelColor: Colors.white,
      labelStyle: kTitleLite,
      unselectedLabelStyle: kTitleLite,
      unselectedLabelColor: AppColor.kTextColorLite,
      labelPadding:
          const EdgeInsets.only(bottom: 15, top: 8, left: 16, right: 16),
      indicatorPadding: const EdgeInsets.only(bottom: 5),
      dividerColor: AppColor.kTextColor,
      indicatorSize: TabBarIndicatorSize.label,
      tabAlignment: TabAlignment.start,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 2,
          color: Colors.white,
        ),
      ),
      tabs: tabs);
}
