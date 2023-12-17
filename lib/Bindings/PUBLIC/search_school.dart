import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/PUBLIC/search_school_controller.dart';

class SearchSchoolBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchSchoolController());
  }
}
