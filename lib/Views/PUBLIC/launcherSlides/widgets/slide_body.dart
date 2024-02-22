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
                      height: 48,
                      width: 48,
                      fit: BoxFit.contain,
                    ),
                    AppSpacing.sm.width,
                    Image(
                      image: AssetImage(edu_world_txt),
                      height: 14,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                Image(
                  image: AssetImage(imageLoc),
                  width: AppScreenSize.mGetWidth(context, 45),
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
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: subtitleList.length,
            itemBuilder: (context, index) {
              return Table(columnWidths: const {
                0: IntrinsicColumnWidth()
              }, children: [
                TableRow(children: [
                  /// column 1: follow column 2
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Image(
                          image: AssetImage(done),
                          width: 18,
                          height: 18,
                          // color: Colors.green,
                          fit: BoxFit.fill,
                        ),
                      )),

                  /// column 2: Independent in increasing height
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10,),
                          child: Text(subtitleList[index],
                     
                              style: kBody.copyWith(
                                color: Colors.black,
                              ))),
                    ],
                  ),
                ]),
              ]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                height: 10,
                color: Colors.transparent,
              );
            },
          ),
        )),
      ],
    ));
  }
}
