// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/home.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Utils/screen_size.dart';
import 'package:school_management_system/Views/Widgets/text_fields.dart';

import 'bottom_nav.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController _controller = Get.find();
  GlobalKey<ScaffoldState> scafoldKey = GlobalKey<ScaffoldState>();

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafoldKey,
      endDrawer: vEndDrawer(),
      floatingActionButton: vFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: vBottomNav(),
      body: Column(
        children: [
          vTopbar(),
          AppSpacing.xl.height,
          vSlider(),
        ],
      ),
    );
  }

  vSlider() {
    return Container(
      margin: EdgeInsets.only(top: 4, bottom: 5),
      child: CarouselSlider(
          options: CarouselOptions(
            autoPlayAnimationDuration: Duration(milliseconds: 300),
            height: AppSpacing.noticeBannerHeight,
            autoPlay: true,
          ),
          items: List.generate(4, (index) => vBannerItem()).toList()

          /* bookingList.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return InkWell(
                  onTap: () {
                    /* Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return FoodDescScreen(food: i);
                    })); */
                  },
                  child: _vBannerItem(i));
            },
          );
        }).toList(), */
          ),
    );
  }

  Widget vBannerItem() {
    return Container(
      // alignment: Alignment.center,
      clipBehavior: Clip.hardEdge,
      // height: MyScreenSize.mGetHeight(context, 30),
      width: AppScreenSize.mGetWidth(context, 100),
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 4),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: kContainerNoticeBanner,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          vDateCard(),
          AppSpacing.md.width,
          vNotice(),
        ],
      ),
    );
  }

  Padding vTopbar() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage("assets/logos/demo_school.png"),
                width: AppSpacing.logoSizeDemoSchool,
                height: AppSpacing.logoSizeDemoSchool,
                fit: BoxFit.fill,
                
              ),
              IconButton(
                  onPressed: () => scafoldKey.currentState?.openEndDrawer(),
                  icon: Image(
                    image: AssetImage(menu),
                    width: 24,
                    height: 24,
                    fit: BoxFit.fill,
                  )),
            ],
          ),
          AppSpacing.sm.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Nasirabad Govt. High School",
                style: kTitleLite,
              ),
            ],
          ),
        ],
      ),
    );
  }

  vDateCard() {
    return Container(
      height:
          AppSpacing.noticeBannerHeight - (AppSpacing.noticeBannerHeight / 2),
      width: AppSpacing.dateCardWidth,
      decoration: kContainerPlainWithBorder.copyWith(
          color: AppColor.orange50,
          border: Border.all(width: .2, color: AppColor.orange100)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          /// month
          Container(
            alignment: Alignment.center,
            width: AppSpacing.dateCardWidth,
            color: AppColor.dateCardTopBg,
            padding: EdgeInsets.all(AppSpacing.smh / 2),
            child: Text(
              _controller.monthName.value,
              style: kSubTitle.copyWith(color: AppColor.white),
            ),
          ),

          /// Day
          Expanded(
              child: Container(
            alignment: Alignment.center,
            width: AppSpacing.dateCardWidth,
            padding: EdgeInsets.all(AppSpacing.smh / 2),
            child: Text(
              _controller.dayNumber.value.toString(),
              style: kHeading,
            ),
          ))
        ],
      ),
    );
  }

  vNotice() {
    return Expanded(
        child: Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Notice Title",
          style: kTitleLite.copyWith(color: AppColor.orange900),
        ),
        AppSpacing.sm.height,
        TextFormField(
          controller: TextEditingController(text: kDummyText),
          maxLines: 3,
          style: kBody.copyWith(color: AppColor.textColor500),
          readOnly: true,
          textAlign: TextAlign.left,
          decoration: const InputDecoration(
              border: InputBorder.none, contentPadding: EdgeInsets.all(0)),
        ),
        AppSpacing.md.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppTexts.vClickableText(text: "Read more", onTap: () {}),
          ],
        ),
      ]),
    ));
  }

  vEndDrawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Container(
            decoration: kContainerPrimary,
          )),
          ListTile(
            title: Text(
              "Item 1",
              style: kSubTitle,
            ),
          ),
          Divider(
            color: AppColor.orange300,
          ),
          ListTile(
            title: Text(
              "Item 1",
              style: kSubTitle,
            ),
          ),
          Divider(
            color: AppColor.orange300,
          ),
          ListTile(
            title: Text(
              "Item 1",
              style: kSubTitle,
            ),
          ),
          /*  Divider(
              color: AppColor.orange300,
            ), */
        ],
      ),
    );
  }

  vBottomNav() {
    return HomeBottomNavBar(
      pageIndex: _pageIndex,
      fabLocation: FloatingActionButtonLocation.centerDocked,
      shape: const CircularNotchedRectangle(),
      callback: (int pageIndex) {
        setState(() {
          _pageIndex = pageIndex;
        });
      },
    );
  }

  vFab() {
    return FloatingActionButton(
      onPressed: () {},
      shape: CircleBorder(),
      backgroundColor: AppColor.orange900,
      child: Icon(
        Icons.arrow_upward,
        color: AppColor.white,
      ),
    );
  }
}
