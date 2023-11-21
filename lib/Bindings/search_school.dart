import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchSchoolBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchController());
  }
}
