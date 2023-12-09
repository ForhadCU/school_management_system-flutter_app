import 'package:flutter/material.dart';
import 'package:school_management_system/Config/constants/constants.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../../Config/config.dart';
import '../../../../Config/constants/asset_location.dart';
import '../../../../Config/styles/spacing.dart';
import '../../../../Utils/screen_size.dart';

class SlideBody extends StatelessWidget {
  final String imageLoc;
  final String title;
  final String subtitle;
  const SlideBody(
      {super.key,
      required this.imageLoc,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(imageLoc),
            height: AppScreenSize.mGetHeight(kGlobContext, 24),
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: AppSpacing.xl,
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
    );
  }
}
