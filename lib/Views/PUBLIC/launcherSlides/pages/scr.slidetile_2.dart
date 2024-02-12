import 'package:flutter/material.dart';
import 'package:school_management_system/Config/constants/asset_location.dart';
import 'package:school_management_system/Config/constants/constants.dart';

import '../widgets/slide_body.dart';

class SlideTile2 extends StatelessWidget {
  const SlideTile2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SlideBody(
        bgImageLoc: PublicAssetLocation.slide_bg_3,
        imageLoc: mark_sheet,
        title: tLauncherSlide3Title,
        subtitleList: tLauncherSlide3SubTitleList);
  }
}
