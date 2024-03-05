import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/TEACHER/routine/routine_controller.dart';
import 'package:school_management_system/Controller/common/common_controller.dart';
import 'package:school_management_system/Model/STUDENT/routine/period_type_model.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../../Config/config.dart';
import '../../../Model/TEACHER/version_year_shift_model.dart';
import '../../Widgets/buttons.dart';

class TeachRoutineWidgets {
  // make this class singleton
  TeachRoutineWidgets._internal();
  static final TeachRoutineWidgets _singleton = TeachRoutineWidgets._internal();
  factory TeachRoutineWidgets() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances
  static final _controller = TeachRoutineController.to;
  static final _commonController = CommonController.to;

}
