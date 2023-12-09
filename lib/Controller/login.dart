import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  TextEditingController textEditingControllerUsernameOrEmail =
      TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();

  var isLoginViewVisible = true.obs;
}
