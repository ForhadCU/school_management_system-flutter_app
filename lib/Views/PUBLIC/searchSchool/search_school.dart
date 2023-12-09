import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Views/Widgets/text_form_fields.dart';
import 'package:school_management_system/Views/PUBLIC/searchSchool/widgets.dart';

class SearchSchool extends StatelessWidget {
  const SearchSchool({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          /// title
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                 vertical: AppSpacing.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tSchoolClgeList,
                  style: kTitle.copyWith(color: AppColor.primaryColor),
                ),
              ],
            ),
          ),

          /// searchbar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: AppTextFormFileds.vSearchInputField(
                hintText: tSearchSchoolClge),
          ),
          AppSpacing.md.height,

          /// Result List
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SchoolResultListItem(
                      onTap: () {
                        Get.toNamed(AppRoutes.landing);
                      },
                      schoolName: tDemoSchoolName,
                      schoolAdress: "Cox's Bazar Sadar, Chittagong");
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 2,
                    thickness: 1,
                    color: AppColor.orange300,
                  );
                },
                itemCount: 20),
          )
        ],
      ),
    );
  }
}
