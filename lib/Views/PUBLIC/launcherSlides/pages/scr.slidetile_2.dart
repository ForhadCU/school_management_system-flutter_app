import 'package:flutter/material.dart';
import 'package:school_management_system/Config/constants/asset_location.dart';
import 'package:school_management_system/Config/constants/constants.dart';

import '../widgets/slide_body.dart';

class SlideTile2 extends StatelessWidget {
  const SlideTile2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SlideBody(
        imageLoc: routines,
        title: tLauncherSlide3Title,
        subtitle: tLauncherSlide3SubTitle);
  }
}
