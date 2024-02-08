import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/login_controller.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/Widgets/buttons.dart';

class LoginWidgets {
  // make this class singleton
  LoginWidgets._internal();
  static final LoginWidgets _singleton = LoginWidgets._internal();
  factory LoginWidgets() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static final _controller = LoginController.to;

  static vAcademicGroupList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Choose your acdemic group",
          style: kBody.copyWith(fontWeight: FontWeight.bold),
        ),
        AppSpacing.sm.height,
        Obx(() => ListView.builder(
            shrinkWrap: true,
            itemCount: _controller.academicGroupList.length,
            itemBuilder: ((context, index) {
              return Row(
                children: [
                  Obx(() => Radio(
                        value: _controller
                            .academicGroupList[index].academicGroupName,
                        groupValue: _controller.selectedAcademicGroupName.value,
                        onChanged: (value) {
                          _controller.mUpdateAcademicGroupSelection(
                              value!, _controller.academicGroupList[index]);
                        },
                        activeColor: AppColor.activeTab,
                      )),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _controller
                                  .academicGroupList[index].academicGroupName ??
                              "",
                          style: kBody.copyWith(color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            })))
      ],
    );
  }

  static vNextButton() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
        width: AppScreenSize.mGetWidth(kGlobContext, 50),
        child: AppButtons.vPrimaryButtonWithGradient(
            onTap: () async {
              await _controller.mSaveAcademicGroupToLocal();
              _controller.mGoToHome();
            },
            text: "Go"),
      )
    ]);
  }
}
