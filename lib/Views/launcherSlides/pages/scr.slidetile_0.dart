import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Config/constants/asset_location.dart';
import 'package:school_management_system/Config/constants/constants.dart';
import 'package:school_management_system/Controller/base_controller.dart';
import 'package:school_management_system/Utils/spacing.dart';
import 'package:school_management_system/Views/launcherSlides/widgets/slide_body.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Utils/screen_size.dart';

class SlideTile0 extends StatelessWidget {
 const SlideTile0({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SlideBody(
        imageLoc: multiple_login,
        title: tLauncherSlide1title,
        subtitle: tLauncherSlide1Subtitle);
  }
}
