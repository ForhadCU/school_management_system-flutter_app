import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/login_controller.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/Widgets/buttons.dart';
import 'package:school_management_system/Views/Widgets/top_bar_banner.dart';
import '../../../Config/config.dart';
import '../../../Routes/app_pages.dart';
import '../../Widgets/base_widget.dart';

class Login extends GetView<LoginController> {
  
  Login({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      title: "Login",
      /* appBar: AppBar(
          title: Text("Notice Board"),
          elevation: 0,
          backgroundColor: AppColor.white,
        ), */
      child: BaseWidgetChild(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => InstitueBanaer(
                  iconUrl: controller.siteListModel.value.siteLogo,
                  title: controller.siteListModel.value.siteName ??
                      tDemoSchoolName)),
              // vSchollNameBanner(controller),
              (AppSpacing.xxl * 2).height,
              vBody(controller, formKey),
            ],
          ),
        ),
      )),
    );
  }

  vSchollNameBanner(LoginController controller) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/logos/demo_school.png"),
              width: 48 * 2,
              height: 48 * 2,
              fit: BoxFit.fill,
            ),
          ],
        ),
        AppSpacing.sm.height,
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Nasirabad Govt. High School",
              style: kHeading,
            ),
          ],
        ),
      ],
    );
  }

  Widget vBody(LoginController controller, GlobalKey<FormState> formKey) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Obx(() => Visibility(
              visible: controller.isLoginViewVisible.value,
              child: vLogin(controller, formKey))),
          Obx(() => Visibility(
              visible: !controller.isLoginViewVisible.value,
              child: vForgotPassword(controller, formKey))),
        ],
      ),
    );
  }

  vLogin(LoginController controller, GlobalKey<FormState> formKey) {
    return Column(
      children: [
        TextFormField(
            controller: controller.textEditingControllerUsernameOrEmail,
            validator: (p0) =>
                p0 == null || p0.isEmpty ? "Username or Email required" : null,
            style: kBody,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                vertical: AppSpacing.smh,
                horizontal: AppSpacing.sm,
              ),
              hintText: "Username or Email",
              prefixIcon: Icon(
                Icons.person,
                color: AppColor.kGray500,
              ),
            )),
        AppSpacing.xl.height,
        TextFormField(
          controller: controller.textEditingControllerPassword,
          validator: (p0) =>
              p0 == null || p0.isEmpty ? "Password required" : null,
          style: kBody,
          obscureText: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(
              vertical: AppSpacing.smh,
              horizontal: AppSpacing.sm,
            ),
            hintText: "Password",
            prefixIcon: Icon(
              Icons.security,
              color: AppColor.kGray500,
            ),
          ),
        ),
        AppSpacing.xxl.height,
        AppButtons.vPrimaryButtonWithGradient(
            onTap: () async {
              if (formKey.currentState!.validate()) {
                await controller.mUserLogin();
              }
            },
            text: "Login"),
        /* AppSpacing.xxl.height,
        GestureDetector(
          onTap: () {
            controller.isLoginViewVisible.value = false;
          },
          child: Text(
            "Forgot Password?",
            style: kBody.copyWith(
              color: AppColor.silverLakeBlue,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
        ) */
      ],
    );
  }

  Widget vForgotPassword(
      LoginController controller, GlobalKey<FormState> formKey) {
    return Column(
      children: [
        TextFormField(
            controller: controller.textEditingControllerUsernameOrEmail,
            validator: (p0) =>
                p0 == null || p0.isEmpty ? "Username or Email required" : null,
            style: kBody,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                vertical: AppSpacing.smh,
                horizontal: AppSpacing.sm,
              ),
              hintText: "Username or Email",
              prefixIcon: Icon(
                Icons.person,
                color: AppColor.kGray500,
              ),
            )),
        AppSpacing.xxl.height,
        Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.xl),
            child: AppButtons.vPrimaryButtonWithGradient(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    showSuccess("Sent");
                    controller.isLoginViewVisible.value = true;
                  }
                },
                text: "Send")),
        AppSpacing.xxl.height,
        GestureDetector(
          onTap: () {
            controller.isLoginViewVisible.value = true;
          },
          child: Text(
            "Back",
            style: kBody.copyWith(
              color: AppColor.silverLakeBlue,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }
}
