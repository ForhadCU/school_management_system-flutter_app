import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/search_school.dart';

class SearchSchoolBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchSchoolController());
  }
}
