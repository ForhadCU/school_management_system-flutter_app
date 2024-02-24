// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/home.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Utils/screen_size.dart';
import 'package:school_management_system/Views/Widgets/buttons.dart';
import 'package:school_management_system/Views/Widgets/text_fields.dart';
import 'package:school_management_system/Views/PUBLIC/notice/notice.dart';
import 'package:table_calendar/table_calendar.dart';

import '../dashboard/widgets/bottom_nav.dart';

class HomeAdvancedDesign extends StatefulWidget {
  const HomeAdvancedDesign({super.key});

  @override
  State<HomeAdvancedDesign> createState() => _HomeAdvancedDesignState();
}

class _HomeAdvancedDesignState extends State<HomeAdvancedDesign> {
  @override
  Widget build(BuildContext context) {
    final HomeController _controller = Get.find();
    GlobalKey<ScaffoldState> scafoldKey = GlobalKey<ScaffoldState>();

    int _pageIndex = 0;

    return SafeArea(
      child: Scaffold(
        key: scafoldKey,
        endDrawer: vEndDrawer(),
        // floatingActionButton: vFab(),
        // floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        // bottomNavigationBar: vBottomNav(),
        body: Obx(() => vHome(
              scafoldKey,
              _controller,
            )),
      ),
    );
  }

  vHome(GlobalKey<ScaffoldState> scafoldKey, HomeController controller) {
    return SingleChildScrollView(
      child: Column(
        children: [
          vTopbar(scafoldKey),
          AppSpacing.xl.height,
          vSlider(controller),
          AppSpacing.xl.height,
          vExplore(),
          AppSpacing.xl.height,
          vAcademicCalendar(),

          /// always bottom margin
          AppSpacing.xxl.height
        ],
      ),
    );
  }

  vSlider(HomeController controller) {
    return Container(
      margin: EdgeInsets.only(top: 4, bottom: 5),
      child: CarouselSlider(
          options: CarouselOptions(
            autoPlayAnimationDuration: Duration(milliseconds: 300),
            height: AppSpacing.noticeBannerHeight,
            autoPlay: true,
          ),
          items: List.generate(4, (index) => vBannerItem(controller)).toList()

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

  Widget vBannerItem(HomeController controller) {
    return Container(
      clipBehavior: Clip.hardEdge,
      // height: MyScreenSize.mGetHeight(context, 30),
      width: AppScreenSize.mGetWidth(context, 100),
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 4),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: kContainerNoticeBanner,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          vDateCard(controller),
          AppSpacing.md.width,
          vNotice(),
        ],
      ),
    );
  }

  Padding vTopbar(scafoldKey) {
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

  vDateCard(HomeController _controller) {
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
        child: SingleChildScrollView(
          child: Column(
              children: [
          DrawerHeader(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage(logoDemoSchool),
                width: AppSpacing.logoSizeDemoSchool + 20,
              ),
              AppSpacing.md.height,
              Text(
                tDemoSchoolName,
                style: kTitleLite,
              )
            ],
          )),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: AppButtons.vPrimaryButtonWithGradient(
                  onTap: () {
                    print("Click on Login");
                  },
                  text: "Log in"),
            ),
          ),
              ],
            ),
        ) /* ListView(
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
      ), */
        );
  }

/*   vBottomNav() {
    return HomeBottomNavBar(
      controller: _controller,
      /* 
      pageIndex: _pageIndex,
      fabLocation: FloatingActionButtonLocation.startDocked,
      shape: const CircularNotchedRectangle(),
      callback: (int pageIndex) {
        _controller.pageIndex.value = pageIndex;
        /*    setState(() {
          _pageIndex = pageIndex;
        }); */
      },
    */
    );
  }
 */
  vFab() {
    return FloatingActionButton(
      onPressed: () {},
      shape: CircleBorder(),
      backgroundColor: AppColor.orange900,
      child: Image(
        image: AssetImage(home_user),
        width: 24,
        height: 24,
        color: AppColor.white,
      ),
    );
  }

  vExplore() {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.primaryPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Explore",
            style: kWidgetlabel.copyWith(color: AppColor.orange900),
            // style: kTitleLite.copyWith(color: AppColor.orange900),
          ),
          AppSpacing.md.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /*  AppButtons.vCircularIconButton(
                  iconUri: login, text: "Login", onTap: () {}), */
              AppButtons.vCircularIconButton(
                  iconUri: noticeboard_colored_ic,
                  text: "Notice board",
                  onTap: () {
                    print("Clicke");
                    Get.toNamed(AppRoutes.notice);
                  }),
              AppButtons.vCircularIconButton(
                  iconUri: photo_gallery, text: "Gallery", onTap: () {}),
              AppButtons.vCircularIconButton(
                  iconUri: site_history1, text: "Site history", onTap: () {}),
              AppButtons.vCircularIconButton(
                  iconUri: contact_us, text: "Contact us", onTap: () {}),
            ],
          )
        ],
      ),
    );
  }

  vAcademicCalendar() {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.primaryPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Academic Calendar",
            style: kWidgetlabel.copyWith(color: AppColor.orange900),
            // style: kTitleLite.copyWith(color: AppColor.orange900),
          ),
          AppSpacing.sm.height,
          TableCalendar(
              headerStyle: HeaderStyle(titleCentered: true),
              calendarFormat: CalendarFormat.month,
              availableCalendarFormats: {CalendarFormat.month: "Month"},
              calendarStyle: CalendarStyle(
                  tableBorder:
                      TableBorder.all(color: AppColor.orange500, width: 1)),
              focusedDay: DateTime.now(),
              firstDay: DateTime.now().subtract(Duration(days: 300)),
              lastDay: DateTime.now()),
          AppSpacing.sm.height,
          Row(
            children: [
              AppSpacing.sm.width,
              vCalendarHint(label: 'Holiday', boxColor: AppColor.red),
              AppSpacing.sm.width,
              vCalendarHint(label: 'Event', boxColor: AppColor.green),
              AppSpacing.sm.width,
              vCalendarHint(
                  label: 'Examination', boxColor: AppColor.silverLakeBlue),
            ],
          )
        ],
      ),
    );
  }

  vCalendarHint({required String label, required Color boxColor}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// hint box
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(color: boxColor),
        ),
        AppSpacing.smh.width,
        Text(
          label,
          style: kLabel,
        )
      ],
    );
  }
}
