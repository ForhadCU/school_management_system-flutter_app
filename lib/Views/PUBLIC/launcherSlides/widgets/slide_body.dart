import 'package:flutter/material.dart';
import 'package:school_management_system/Config/constants/constants.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../../Config/config.dart';
import '../../../../Config/constants/asset_location.dart';
import '../../../../Config/styles/spacing.dart';
import '../../../../Utils/screen_size.dart';

class SlideBody extends StatelessWidget {
  final String bgImageLoc;
  final String imageLoc;
  final String title;
  final String subtitle;
  const SlideBody(
      {super.key,
      required this.imageLoc,
      required this.title,
      required this.subtitle, required this.bgImageLoc});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        Image(
          image: AssetImage(bgImageLoc),
          // width: AppScreenSize.mGetWidth(context, 80),
          height: AppScreenSize.mGetHeight(context, 70),
          fit: BoxFit.fill,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              // height: AppSpacing.xl,
              height: AppScreenSize.mGetHeight(context, 70) + 24,
            ),
            Text(
              title,
              style: kTitle.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
            SizedBox(
              height: AppSpacing.sm,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(text: subtitle),
                    maxLines: 2,
                    style: kSubTitle.copyWith(color: AppColor.textColor500),
                    readOnly: true,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(0)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ));
  }
}
