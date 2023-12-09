import 'package:flutter/material.dart';
import 'package:school_management_system/Config/constants/asset_location.dart';
import '../../../../Config/constants/constants.dart';
import '../widgets/slide_body.dart';

class SlideTile3 extends StatelessWidget {
  const SlideTile3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SlideBody(
        imageLoc: attendance,
        title: tLauncherSlide4Title,
        subtitle: tLauncherSlide4SubTitle);
  }
}
