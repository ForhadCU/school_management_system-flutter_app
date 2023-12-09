import 'package:flutter/material.dart';
import 'package:school_management_system/Config/constants/asset_location.dart';
import 'package:school_management_system/Config/constants/constants.dart';
import 'package:school_management_system/Views/PUBLIC/launcherSlides/widgets/slide_body.dart';

class SlideTile1 extends StatelessWidget {
  const SlideTile1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SlideBody(
              bgImageLoc: PublicAssetLocation.slide_bg_2,

        imageLoc: notice_board_logo,
        title: tLauncherSlide2Title,
        subtitle: tLauncherSlide2SubTitle);
  }
}
