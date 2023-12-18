import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Utils/utils.dart';

class ProfileWidgets {
  // make this class singleton
  ProfileWidgets._internal();
  static final ProfileWidgets _singleton = ProfileWidgets._internal();
  factory ProfileWidgets() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

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
        Image(
          image: AssetImage(userLogin),
          width: 64,
          height: 64,
          fit: BoxFit.fill,
        ),
        AppSpacing.md.width,
        Expanded(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your name".toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColor.fontUsername,
                fontSize: 20,
              ),
            ),
            AppSpacing.sm.height,
            Row(
              children: [
                Text(
                  "UserName".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                Text(
                  " : ".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                Expanded(
                  child: Text(
                    "2234343489".toUpperCase(),
                    softWrap: true,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            AppSpacing.smh.height,
            Row(
              children: [
                Text(
                  "Phone".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                Text(
                  " : ".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                Expanded(
                  child: Text(
                    "018197872373".toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            AppSpacing.smh.height,
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
                fontSize: 18,
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
                  _vSingleColumTextPlate(key: "Father", value: "Value"),
                  _vSingleColumTextPlate(key: "Phone", value: "Value"),
                  _vSingleColumTextPlate(key: "Nid", value: "Value"),
                  _vSingleColumTextPlate(key: "Bcn", value: "Value"),
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
                  _vSingleColumTextPlate(key: "Mother", value: "Value"),
                  _vSingleColumTextPlate(key: "Phone", value: "Value"),
                  _vSingleColumTextPlate(key: "Nid", value: "Value"),
                  _vSingleColumTextPlate(key: "Bcn", value: "Value"),
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
                fontSize: 18,
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
                  _vSingleColumTextPlate(key: "Name", value: "Value"),
                  _vSingleColumTextPlate(key: "Home", value: "Value"),
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
                fontSize: 18,
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
                  _vDoubleColumTextPlate(key: "Year", value: "Value"),
                  _vDoubleColumTextPlate(key: "Class", value: "Value"),
                  _vDoubleColumTextPlate(key: "Section", value: "Value"),
                  _vDoubleColumTextPlate(key: "Gender", value: "Value"),
                ],
              ),

              /// Right part
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _vDoubleColumTextPlate(key: "Shift", value: "Value"),
                  _vDoubleColumTextPlate(key: "Roll", value: "Value"),
                  _vDoubleColumTextPlate(key: "Group", value: "Value"),
                  _vDoubleColumTextPlate(key: "Religion", value: "Valdddd"),
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
                  fontSize: 16,
                )),
          ),
          2.width,
          Text(": ".toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              )),
          2.width,
          Expanded(
            flex: 2,
            child: Text(value.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
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
                  fontSize: 16,
                )),
          ),
          2.width,
          Text(": ".toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              )),
          2.width,
          Expanded(
            flex: 3,
            child: Text(value.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                )),
          )
        ],
      ),
    );
  }
}
