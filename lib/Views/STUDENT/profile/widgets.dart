/* import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/student_library.dart';
import 'package:school_management_system/Model/STUDENT/profile/stu_profile_info_model.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../../Utils/custom_utils.dart';
import '../../Widgets/cached_network_image.dart';

class ProfileWidgets {
  // make this class singleton
  ProfileWidgets._internal();
  static final ProfileWidgets _singleton = ProfileWidgets._internal();
  factory ProfileWidgets() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances
  static final _controller = StuProfileController.to;
  static final homeController = StuHomeController.to;
  static final ProfileInfoModel studentProfileInfoModel =
      _controller.stuProfileInfoModel.value;

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
    return _vPlainBlueBox(
        child: Row(
      children: [
        Obx(() {
          homeController.profileInfoModel.value.photo != null &&
                  _controller.siteListModel.value.siteAlias != null
              ? kLog(Utils.mMakeUserImageUrl(
                  imageLoc: homeController.profileInfoModel.value.photo!,
                  alisName: /* fccdc.theworld.com.bd/uploads/1707576530.jpeg */
                      _controller.siteListModel.value.siteAlias!))
              : null;
          return homeController.profileInfoModel.value.photo != null &&
                      _controller.siteListModel.value.siteAlias != null
                  ? cachedNetworkImage(
                      // "fccdc.theworld.com.bd/uploads/1707576530.jpeg"
                      Utils.mMakeUserImageUrl(
                          imageLoc:
                              homeController.profileInfoModel.value.photo!,
                          alisName: /* fccdc.theworld.com.bd/uploads/1707576530.jpeg */
                              _controller.siteListModel.value.siteAlias!),
                      width: AppScreenSize.mGetWidth(kGlobContext, 23),
                      // height: AppScreenSize.mGetHeight(kGlobContext, 13),
                      fit: BoxFit.fill,
                    )
                  : Container(
                      child: Text("Loading"),
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
              ;
        }),
        AppSpacing.md.width,
        Expanded(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  studentProfileInfoModel.firstName == null
                      ? ""
                      : studentProfileInfoModel.firstName!.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColor.fontUsername,
                    fontSize: 16,
                  ),
                ),
                Text(
                  studentProfileInfoModel.lastName == null
                      ? ""
                      : studentProfileInfoModel.lastName!.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColor.fontUsername,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            AppSpacing.sm.height,
            Row(
              children: [
                Text(
                  "UserName".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Text(
                  " : ".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Expanded(
                  child: Text(
                    studentProfileInfoModel.username == null
                        ? ""
                        : studentProfileInfoModel.username!.toUpperCase(),
                    softWrap: true,
                    style: TextStyle(
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
                   studentProfileInfoModel. == null
                      ? ""
                      : studentProfileInfoModel.username!
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
  }

  static vParentsInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ///heading
        _vPlainBlueBox(
          child: Text(
            "Parent's information".toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColor.fontUsername),
          ),
        ),

        AppSpacing.sm.height,

        ///body
        Padding(
          padding: EdgeInsets.symmetric(
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
                      key: "Father",
                      value: studentProfileInfoModel.fatherName!),
                  _vSingleColumTextPlate(key: "Phone", value: ""),
                  _vSingleColumTextPlate(key: "Nid", value: ""),
                  _vSingleColumTextPlate(key: "Bcn", value: ""),
                ],
              ),

              /*   /// Right part
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _vInfoTextPlate(key: "Shift", value: "Value"),
                  _vInfoTextPlate(key: "Roll", value: "Value"),
                  _vInfoTextPlate(key: "Group", value: "Value"),
                  _vInfoTextPlate(key: "Religion", value: "Valdddd"),
                ],
              ), */
            ],
          ),
        ),
        AppSpacing.sm.height,
        Padding(
          padding: EdgeInsets.symmetric(
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
                      key: "Mother",
                      value: studentProfileInfoModel.motherName!),
                  _vSingleColumTextPlate(key: "Phone", value: ""),
                  _vSingleColumTextPlate(key: "Nid", value: ""),
                  _vSingleColumTextPlate(key: "Bcn", value: ""),
                ],
              ),

              /*   /// Right part
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _vInfoTextPlate(key: "Shift", value: "Value"),
                  _vInfoTextPlate(key: "Roll", value: "Value"),
                  _vInfoTextPlate(key: "Group", value: "Value"),
                  _vInfoTextPlate(key: "Religion", value: "Valdddd"),
                ],
              ), */
            ],
          ),
        )
      ],
    );
  }

  static vGaurdianInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ///heading
        _vPlainBlueBox(
          child: Text(
            "Guardian's information".toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColor.fontUsername),
          ),
        ),

        AppSpacing.sm.height,

        ///body
        Padding(
          padding: EdgeInsets.symmetric(
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
                  _vSingleColumTextPlate(key: "Name", value: ""),
                  _vSingleColumTextPlate(key: "Home", value: ""),
                ],
              ),
            ],
          ),
        ),
      ],
    );
    ;
  }

  static vAcademicInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ///heading
        _vPlainBlueBox(
          child: Text(
            "Academic information".toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColor.fontUsername),
          ),
        ),

        AppSpacing.sm.height,

        ///body
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 4,
          ),
          child: StaggeredGrid.count(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            children: [
              /// Left part
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _vDoubleColumTextPlate(
                      key: "Year",
                      value: studentProfileInfoModel.academicInfo!.year!),
                  _vDoubleColumTextPlate(
                      key: "Class",
                      value: studentProfileInfoModel.academicInfo!.className!),
                  _vDoubleColumTextPlate(
                      key: "Section",
                      value:
                          studentProfileInfoModel.academicInfo!.sectionName!),
                  _vDoubleColumTextPlate(key: "Gender", value: ""),
                ],
              ),

              /// Right part
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _vDoubleColumTextPlate(
                      key: "Shift",
                      value: studentProfileInfoModel.academicInfo!.shiftName!),
                  _vDoubleColumTextPlate(
                      key: "Roll",
                      value: studentProfileInfoModel.id!.toString()),
                  _vDoubleColumTextPlate(
                      key: "Group",
                      value: studentProfileInfoModel
                          .academicInfo!.classGroupName!),
                  _vDoubleColumTextPlate(key: "Religion", value: ""),
                ],
              ),
            ],
          ),
        )
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
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                )),
          ),
          2.width,
          Text(": ".toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
              )),
          2.width,
          Expanded(
            flex: 2,
            child: Text(value.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
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
            flex: 1,
            child: Text(key.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                )),
          ),
          2.width,
          Text(": ".toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
              )),
          2.width,
          Expanded(
            flex: 3,
            child: Text(value.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                )),
          )
        ],
      ),
    );
  }
}
 */