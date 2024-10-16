import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/PUBLIC/search_school_controller.dart';
import 'package:school_management_system/Model/PUBLIC/searchSchool/site_list_model.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Views/Widgets/user_cached_network_image.dart';

import '../../../Config/config.dart';
import '../../../Routes/app_pages.dart';
import '../../../Singletones/app_data.dart';
import '../../Widgets/site_cached_network_image.dart';

class SchoolResultListItem extends StatelessWidget {
  const SchoolResultListItem(
      {super.key,
      required this.schoolName,
      required this.schoolAdress,
      this.imageUri,
      required this.onTap});

  final String schoolName;
  final String schoolAdress;
  final String? imageUri;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap(),
      leading: imageUri != null
          ? siteCachedNetworkImage(
              imageUri!,
              width: 48,
              fit: BoxFit.fill,
            )
          : const CircleAvatar(
              radius: AppSpacing.logoSizeDemoSchool,
              backgroundImage: AssetImage(logoDemoSchool)),
      /*     CachedNetworkImage(
              imageUrl: imageUri!,
              width: 48,
              height: 48,
              fit: BoxFit.fill,
            )
          : const CircleAvatar(
              radius: AppSpacing.logoSizeDemoSchool,
              backgroundImage: AssetImage(logoDemoSchool)), */
      title: Text(
        schoolName,
        style: kTitleLite,
      ),
      // subtitle: Text("This will be address of this school"),
      subtitle: Text(schoolAdress),
    );
  }
}

class SearchSchoolWidget {
  // make this class singleton
  SearchSchoolWidget._internal();
  static final SearchSchoolWidget _singleton = SearchSchoolWidget._internal();
  factory SearchSchoolWidget() {
    return _singleton;
  }

  static final _controller = SearchSchoolController.to;
  static final GlobalKey<FormState> _formKey = GlobalKey();

  static vTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm, vertical: AppSpacing.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tSchoolClgeList,
            style: kTitle.copyWith(color: AppColor.primaryColor),
          ),
        ],
      ),
    );
  }

  static vSearchBar() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        child: Column(
          children: [
            TextFormField(
              key: _formKey,
              controller: _controller.textEditingControllerSearchSite,
              onChanged: (value) {
                if (value.length > 2) {
                  AppData.debouncer.run(() {
                    _controller.mGetSearchResult(value);
                  });
                } else {
                  _controller.mClearCurrentSearchList();
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

  static vSiteList() {
    return Obx(() => _controller.searchedSitesList.isEmpty
        ? Container()
        : ListView.separated(
            itemCount: _controller.searchedSitesList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final SitelistModel sitelistModel =
                  _controller.searchedSitesList[index];
              return SchoolResultListItem(
                  onTap: () {
                    _controller.mSetSiteListModel(sitelistModel);
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

  static vWarningMassege() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(
            "Type at least 3 letters*",
            style: TextStyle(color: Colors.deepOrange, fontSize: 13),
          ),
        ],
      ),
    );
  }
  // codes start from here
  // All methods should be static to maintain singleton instances
}
