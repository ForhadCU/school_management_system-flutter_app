import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/STUDENT/dashboard/dashboard_controller.dart';
import 'package:school_management_system/Controller/TEACHER/dashboard/dashboard_controller.dart';

import '../../../Config/config.dart';

class TeachDashboard extends StatelessWidget {
  const TeachDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TeachDashboardController.to;
    return Scaffold(
      bottomNavigationBar: Obx(() => vBtmNav(controller)),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }

  vBtmNav(TeachDashboardController controller) {
    double iconWidth = 24;
    double iconHeight = 24;
    return BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        onTap: (value) => controller.mOnItemTapped(value),
        items: [
          BottomNavigationBarItem(
            backgroundColor: AppColor.primaryColor,
            icon: Image(
              image: const AssetImage(nav_home),
              width: iconWidth ,
              height: iconHeight ,
              color: Colors.grey.shade200,
            ),
            label: "Home",
            activeIcon:  Image(
              image: const AssetImage(nav_home),
              width: iconWidth ,
              height: iconHeight ,
              color: AppColor.white,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColor.primaryColor,
            icon: Image(
              image: const AssetImage(nav_notice),
              width: iconWidth ,
              height: iconHeight ,
              color: Colors.grey.shade200,
            ),
            label: "Notice",
            activeIcon:  Image(
              image: const AssetImage(nav_notice),
              width: iconWidth ,
              height: iconHeight ,
              color: AppColor.white,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColor.primaryColor,
            icon: Image(
              image: const AssetImage(nav_notification),
              width: iconWidth ,
              height: iconHeight ,
              color: Colors.grey.shade200,
            ),
            label: "Notification",
            activeIcon:  Image(
              image: const AssetImage(nav_notification),
              width: iconWidth ,
              height: iconHeight ,
              color: AppColor.white,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColor.primaryColor,
            icon: Image(
              image:  const AssetImage(nav_user),
              width: iconWidth ,
              height: iconHeight ,
              color: Colors.grey.shade200,
            ),
            label: "Profile",
            activeIcon:  Image(
              image: const AssetImage(nav_user),
              width: iconWidth ,
              height: iconHeight ,
              color: AppColor.white,
            ),
          ),
        ]);
  }
}
