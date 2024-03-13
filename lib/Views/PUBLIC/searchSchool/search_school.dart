import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Views/PUBLIC/searchSchool/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../Controller/PUBLIC/search_school_controller.dart';
import '../../../Model/PUBLIC/searchSchool/site_list_model.dart';
import '../../../Singletones/app_data.dart';

class SearchSchool extends GetView<SearchSchoolController> {
  SearchSchool({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      () => controller.isFetchingSiteData.value
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        color: AppColor.primaryColor.withOpacity(.5),
                        strokeWidth: 2,
                      )),
                  AppSpacing.sm.height,
                  Text(
                    "Please wait",
                    style: kBody.copyWith(color: Colors.black45),
                  )
                ],
              ),
            )
          : !controller.isAllSitesLoaded.value
              ? Center(
                  child: Text(
                    "Not Found",
                    style: kBody.copyWith(color: Colors.black45),
                  ),
                )
              : Column(
                  children: [
                    /// title
                    vTitle(),

                    /// searchbar
                    vSearchBar(),

                    AppSpacing.md.height,

                    /// Result List
                    Expanded(
                      child: vSiteList(),
                    )
                  ],
                ),
    ));
  }

  vTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm, vertical: AppSpacing.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tSchoolClgeList.toUpperCase(),
            style: kTitle.copyWith(color: AppColor.primaryColor),
          ),
        ],
      ),
    );
  }

  vSearchBar() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        child: Column(
          children: [
            TextFormField(
              key: _formKey,
              controller: controller.textEditingControllerSearchSite,
              onChanged: (value) {
                if (value.length > 2) {
                  controller.isLoading.value = true;
                  AppData.debouncer.run(() {
                    controller.isVisibleCharWarning.value = false;
                    controller.mGetSearchResult(value);
                    controller.isLoading.value = false;
                  });
                } else {
                  controller.isVisibleCharWarning.value = true;
                  controller.mClearCurrentSearchList();
                }
              },
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.mdh, vertical: AppSpacing.mdh),
                hintText: "Search your institution here",
                hintStyle: kBody.copyWith(
                    color: const Color.fromARGB(255, 97, 97, 97)),
                fillColor: AppColor.secondaryColor.withOpacity(.5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.secondaryColor.withOpacity(.5),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColor.secondaryColor.withOpacity(.5)),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            AppSpacing.sm.height,
            vWarningMassege(),
          ],
        ));
  }

  vWarningMassege() {
    return Obx(() => Visibility(
          visible: controller.isVisibleCharWarning.value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  "Type at least 3 letters*",
                  style: TextStyle(color: Colors.deepOrange, fontSize: 13),
                ),
              ],
            ),
          ),
        ));
  }

  vSiteList() {
    return Obx(() => !controller.isLoading.value &&
            !controller.isVisibleCharWarning.value &&
            controller.searchedSitesList.isEmpty
        ? Center(
            child: Text(
              "No Result Found",
              style: kBody.copyWith(color: Colors.black45),
            ),
          )
        : controller.isLoading.value
            ? Center(
                child: SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: AppColor.primaryColor.withOpacity(.5),
                      strokeWidth: 2,
                    )),
              )
            : ListView.separated(
                itemCount: controller.searchedSitesList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final SitelistModel sitelistModel =
                      controller.searchedSitesList[index];
                  return SchoolResultListItem(
                      onTap: () {
                        controller.mSetSiteListModel(sitelistModel);
                      },
                      imageUri: AppData.hostNameFull + sitelistModel.siteLogo!,
                      schoolName: sitelistModel.siteName ?? "N/A",
                      schoolAdress: sitelistModel.address ?? "N/A");
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 2,
                    thickness: 1,
                    color: AppColor.secondaryColor.withOpacity(.5),
                  );
                },
              ));
  }
}
