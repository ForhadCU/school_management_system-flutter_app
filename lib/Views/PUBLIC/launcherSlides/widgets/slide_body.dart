import 'package:flutter/material.dart';
import 'package:school_management_system/Config/constants/constants.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../../Config/config.dart';
import '../../../../Config/constants/asset_location.dart';
import '../../../../Config/styles/spacing.dart';
import '../../../../Utils/screen_size.dart';

class SlideBody extends StatelessWidget {
  final String bgImageLoc;
  final String imageLoc;
  final String title;
  final List<String> subtitleList;
  const SlideBody(
      {super.key,
      required this.imageLoc,
      required this.title,
      required this.subtitleList,
      required this.bgImageLoc});

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: AppScreenSize.mGetHeight(context, 100),
        child: Column(
      children: [
        Container(
          height: AppScreenSize.mGetHeight(context, 60),
          // color: Colors.amber,
          alignment: Alignment.center,
          child: Stack(alignment: AlignmentDirectional.center, children: [
            Image(
              image: AssetImage(bgImageLoc),
              // width: AppScreenSize.mGetWidth(context, 80),
              height: AppScreenSize.mGetHeight(context, 60),
              fit: BoxFit.fill,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(edu_world_logo),
                      width:48,
                      height: 48,
                      fit: BoxFit.contain,
                    ),
                    AppSpacing.sm.width,
                    Text(
                      "EDU WORLD Apps",
                      style: kTitle.copyWith(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Image(
                  image: AssetImage(imageLoc),
                  width: AppScreenSize.mGetWidth(context, 60),
                  // height: AppScreenSize.mGetHeight(context, 20),
                  fit: BoxFit.contain,
                ),
                Text(
                  title.toUpperCase(),
                  style: kBody.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ]),
        ),
        SizedBox(
          // height: AppSpacing.xl,
          // height: AppScreenSize.mGetHeight(context, 60) + 24,
          height: 24,
        ),
        /*  Text(
          title,
          style: kTitle.copyWith(
            color: AppColor.primaryColor,
          ),
        ),
        SizedBox(
          height: AppSpacing.sm,
        ), */
        Expanded(
            child: Container(
          height: AppScreenSize.mGetHeight(context, 30),
          margin: EdgeInsets.symmetric(horizontal: 28),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: subtitleList.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(StudentAssetLocation.tickMark),
                      width: AppScreenSize.mGetWidth(context, 5),
                      height: AppScreenSize.mGetHeight(context, 5),
                      color: Colors.green,
                      fit: BoxFit.contain,
                    ),
                    AppSpacing.md.width,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            subtitleList[index],
                            style: kBody.copyWith(
                              color: Colors.black,
                            ),
                            // softWrap: true,
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }),
        )),
      ],
    ));
  }
}
