import 'package:flutter/material.dart';
import 'package:school_management_system/Config/constants/asset_location.dart';
import 'package:school_management_system/Config/constants/constants.dart';
import 'package:school_management_system/Views/PUBLIC/launcherSlides/widgets/slide_body.dart';


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
