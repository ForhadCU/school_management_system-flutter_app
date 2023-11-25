import 'package:flutter/material.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Utils/screen_size.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({
    super.key,
    required this.fabLocation,
    this.shape,
    required this.callback,
    required this.pageIndex,
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;
  final Function callback;
  final int pageIndex;

  static final centerLocations = <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
  ];

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  Color tabColor0 = Colors.white;
  Color tabColor1 = AppColor.hintColor;

  @override
  void initState() {
    print("Nav call");
    switch (widget.pageIndex) {
      case 0:
        tabColor0 = AppColor.white;
        break;
      case 1:
        tabColor1 = AppColor.hintColor;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final localizations = GalleryLocalizations.of(context)!;
    return BottomAppBar(
      color: AppColor.primaryColor,
      clipBehavior: Clip.antiAlias,
      shape: widget.shape,

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    widget.callback(0);
                    setState(() {
                      tabColor1 = tabColor0;
                      tabColor0 = AppColor.white;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.home,
                        color: tabColor0,
                      ),
                      const SizedBox(
                        height: AppSpacing.smh,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(color: tabColor0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      tabColor0 = tabColor1;
                      tabColor1 = AppColor.white;
                    });
                    widget.callback(1);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.notifications,
                        color: tabColor1,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Notification",
                        style: TextStyle(color: tabColor1),
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
