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
        bgImageLoc: PublicAssetLocation.slide_bg_1,
        imageLoc: mark_sheet,
        title: tLauncherSlide1title,
        subtitleList: tLauncherSlide1SubtitleList);
  }
}
