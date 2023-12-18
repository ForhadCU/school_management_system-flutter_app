// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/home.dart';
import 'package:school_management_system/Utils/screen_size.dart';

class StuHomeBottomNavBar extends StatelessWidget {
  final HomeController controller;
  const StuHomeBottomNavBar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // final localizations = GalleryLocalizations.of(context)!;
    return BottomAppBar(
      color: AppColor.primaryColor,
      clipBehavior: Clip.antiAlias,

      // elevation: 5,
      // height: AppScreenSize.mGetHeight(context, 7),
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xl, vertical: AppSpacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    // controller.mUpdatePageIndex(0);
                    /* 
                    widget.callback(0);
                    setState(() {
                      tabColor1 = tabColor0;
                      tabColor0 = AppColor.white;
                    });
                  */
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /*  Icon(
                        Icons.home,
                        color: tabColor1,
                      ), */

                      Image(
                        image: AssetImage(home_user),
                        width: 16,
                        height: 16,
                        color: AppColor.white,
                      ),
                      const SizedBox(
                        height: AppSpacing.smh,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(color: AppColor.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    // controller.mUpdatePageIndex(1);

                    /* 
                    setState(() {
                      tabColor0 = tabColor1;
                      tabColor1 = AppColor.white;
                    });
                    widget.callback(1);
                  */
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image(
                        image: const AssetImage(noitce),
                        width: 16,
                        height: 16,
                        color: AppColor.white,
                      ),
                      const SizedBox(
                        height: AppSpacing.smh,
                      ),
                      Text(
                        "Notice",
                        style: TextStyle(color: AppColor.hintColor),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    /* 
                    setState(() {
                      tabColor0 = tabColor1;
                      tabColor1 = AppColor.white;
                    });
                    widget.callback(1);
                  */
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.notifications_outlined,
                        size: 20,
                        color: AppColor.hintColor,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Notification",
                        style: TextStyle(color: AppColor.hintColor),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    /* 
                    widget.callback(0);
                    setState(() {
                      tabColor1 = tabColor0;
                      tabColor0 = AppColor.white;
                    });
                  */
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /*  Icon(
                        Icons.home,
                        color: tabColor1,
                      ), */
                      Image(
                        image: const AssetImage(userLogin),
                        width: 16,
                        height: 16,
                        color: AppColor.hintColor,
                      ),
                      const SizedBox(
                        height: AppSpacing.smh,
                      ),
                      Text(
                        "Login",
                        style: TextStyle(color: AppColor.hintColor),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



/*   Color tabColor0 = Colors.white;
  Color tabColor1 = AppColor.hintColor; */

/*   void initState() {
    print("Nav call");
    switch (widget.pageIndex) {
      case 0:
        tabColor0 = AppColor.white;
        break;
      case 1:
        tabColor1 = AppColor.hintColor;
    }
    super.initState();
  } */

  

