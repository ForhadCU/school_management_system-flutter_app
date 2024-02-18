import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/TEACHER/home/home_controller.dart';
import 'package:school_management_system/Controller/TEACHER/profile/profile_controller.dart';
import 'package:school_management_system/Controller/student_library.dart';
import 'package:school_management_system/Model/STUDENT/profile/stu_profile_info_model.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/Widgets/cached_network_image.dart';

import '../../../Utils/custom_utils.dart';

class TeachProfileWidgets {
  // make this class singleton
  TeachProfileWidgets._internal();
  static final TeachProfileWidgets _singleton = TeachProfileWidgets._internal();
  factory TeachProfileWidgets() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances
  static final _controller = TeachProfileController.to;
  static final homeController = TeachHomeController.to;

  static Container _vPlainBlueBox({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm, vertical: AppSpacing.md),
      decoration:
          BoxDecoration(color: AppColor.frenchSkyBlue100.withOpacity(.5)),
      child: child,
    );
  }

  static vYourInfo() {
    return Obx(() {
      kLog(
          "ImgUrlProfile: ${Utils.mMakeUserImageUrl(imageLoc: homeController.profileInfoModel.value.photo ?? "", alisName: /* fccdc.theworld.com.bd/uploads/1707576530.jpeg */
              _controller.siteListModel.value.siteAlias ?? "")}");
      return _vPlainBlueBox(
          child: Row(
        children: [
          cachedNetworkImage(
            // "fccdc.theworld.com.bd/uploads/1707576530.jpeg"
            Utils.mMakeUserImageUrl(
                imageLoc: homeController.profileInfoModel.value.photo ?? "",
                alisName: /* fccdc.theworld.com.bd/uploads/1707576530.jpeg */
                    _controller.siteListModel.value.siteAlias ?? ""),
            width: AppScreenSize.mGetWidth(kGlobContext, 23),
            // height: AppScreenSize.mGetHeight(kGlobContext, 13),
            fit: BoxFit.fill,
          ) /* Image(
          image: AssetImage(
            StudentAssetLocation.user,
          ),
          color: Colors.black45,
          // image: CachedNetworkImage(imageUrl: controller.stuProfileInfoModel.value.),
          width: 64,
          height: 70,
          fit: BoxFit.cover,
        ) */
          ,
          AppSpacing.md.width,
          Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    homeController.profileInfoModel.value.firstName == null
                        ? ""
                        : homeController.profileInfoModel.value.firstName!
                            .toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColor.fontUsername,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    homeController.profileInfoModel.value.lastName == null
                        ? ""
                        : " ${homeController.profileInfoModel.value.lastName!.toUpperCase()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColor.fontUsername,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              AppSpacing.sm.height,
              Row(
                children: [
                  /* Text(
                  "UserName".toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  " : ".toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ), */
                  Expanded(
                    child: Text(
                      _controller.userDesignition.value.capitalizeFirst ?? "",
                      softWrap: true,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              AppSpacing.sm.height,
              Row(
                children: [
                  Text(
                    "UserName".capitalizeFirst ?? "",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    " : ".toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      homeController.profileInfoModel.value.username == null
                          ? ""
                          : homeController.profileInfoModel.value.username!
                              .toUpperCase(),
                      softWrap: true,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ), /* 
            AppSpacing.smh.height,
            Row(
              children: [
                Text(
                  "Phone".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  " : ".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Expanded(
                  child: Text(
                   controller.stuProfileInfoModel.value. == null
                      ? ""
                      : controller.stuProfileInfoModel.value.username!
                          .toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            AppSpacing.smh.height, */
            ],
          ))
        ],
      ));
    });
  }

  static vPersonalInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ///heading
        _vPlainBlueBox(
          child: Text(
            "Personal information".toUpperCase(),
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColor.fontUsername),
          ),
        ),

        AppSpacing.sm.height,

        ///body
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          child: StaggeredGrid.count(
            crossAxisCount: 1,
            crossAxisSpacing: 2,
            children: [
              /// Left part
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _vSingleColumTextPlate(
                      key: "Name",
                      value:
                          "${homeController.profileInfoModel.value.firstName} ${homeController.profileInfoModel.value.lastName}"),
                  _vSingleColumTextPlate(
                      key: "Father ",
                      value:
                          "${homeController.profileInfoModel.value.fatherName}"),
                  _vSingleColumTextPlate(
                      key: "Mother ",
                      value:
                          "${homeController.profileInfoModel.value.motherName}"),
                  _vSingleColumTextPlate(
                      key: "Present Address",
                      value: homeController.profileInfoModel.value.address!
                                  .presentAddress!.districtName ==
                              ""
                          ? ""
                          : "${homeController.profileInfoModel.value.address!.presentAddress!.districtName} , ${homeController.profileInfoModel.value.address!.presentAddress!.divisionName}"),
                  _vSingleColumTextPlate(
                      key: "Permanent Address",
                      value: homeController.profileInfoModel.value.address!
                                  .permanentAddress!.districtName ==
                              ""
                          ? ""
                          : "${homeController.profileInfoModel.value.address!.permanentAddress!.districtName}, ${homeController.profileInfoModel.value.address!.permanentAddress!.divisionName}"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  static vAcademicInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ///heading
        _vPlainBlueBox(
          child: Text(
            "Academic information".toUpperCase(),
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColor.fontUsername),
          ),
        ),

        AppSpacing.sm.height,

        ///body
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          child: StaggeredGrid.count(
            crossAxisCount: 1,
            crossAxisSpacing: 2,
            children: [
              /// Left part
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _vSingleColumTextPlate(
                      key: "Office Id",
                      value:
                          homeController.profileInfoModel.value.username ?? ""),
                  _vSingleColumTextPlate(
                      key: "Blood Group",
                      value: homeController.profileInfoModel.value.bladeGroup ??
                          ""),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Padding _vDoubleColumTextPlate(
      {required String key, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.smh),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(key.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                )),
          ),
          2.width,
          Text(": ".toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              )),
          2.width,
          Expanded(
            flex: 2,
            child: Text(value.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                )),
          )
        ],
      ),
    );
  }

  static Padding _vSingleColumTextPlate(
      {required String key, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.smh),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(key.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                )),
          ),
          2.width,
          Text(": ".toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              )),
          2.width,
          Expanded(
            flex: 4,
            child: Text(value.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                )),
          )
        ],
      ),
    );
  }
}
