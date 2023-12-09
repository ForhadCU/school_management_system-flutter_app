import 'package:flutter/material.dart';
import 'package:school_management_system/Config/constants/asset_location.dart';
import '../../../../Config/constants/constants.dart';
import '../widgets/slide_body.dart';

class SlideTile4 extends StatelessWidget {
  const SlideTile4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SlideBody(
      bgImageLoc: PublicAssetLocation.slide_bg_5,
        imageLoc: mark_sheet,
        title: tLauncherSlide5Title,
        subtitle: tLauncherSlide5SubTitle);
  }
}
