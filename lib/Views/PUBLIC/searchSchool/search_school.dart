import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/PUBLIC/search_school_controller.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Views/PUBLIC/searchSchool/widgets.dart';

class SearchSchool extends StatelessWidget {
  const SearchSchool({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SearchSchoolController.to;
    return SafeArea(
        child: Obx(
      () => !controller.isAllSitesLoaded.value
          ? Container()
          : Column(
              children: [
                /// title
                SearchSchoolWidget.vTitle(),

                /// searchbar
                SearchSchoolWidget.vSearchBar(),

                AppSpacing.md.height,

                /// Result List
                Expanded(
                  child: SearchSchoolWidget.vSiteList(),
                )
              ],
            ),
    ));
  }
}
