import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/STUDENT/dashboard/dashboard_controller.dart';

import '../../../Config/config.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = DashboardController.to;
    return Scaffold(
      
      bottomNavigationBar: Obx(() => vBtmNav(controller)),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }

  vBtmNav(DashboardController controller) {
    return BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        onTap: (value) => controller.mOnItemTapped(value),
        items: [
          BottomNavigationBarItem(
            backgroundColor: AppColor.primaryColor,
            icon: Image(
              image: const AssetImage(nav_home),
              width: 16,
              height: 16,
              color: Colors.grey.shade200,
            ),
            label: "Home",
            activeIcon: const Image(
              image: AssetImage(nav_home),
              width: 16,
              height: 16,
              color: AppColor.white,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColor.primaryColor,
            icon: Image(
              image: const AssetImage(nav_notice),
              width: 16,
              height: 16,
              color: Colors.grey.shade200,
            ),
            label: "Notice",
            activeIcon: const Image(
              image: AssetImage(nav_notice),
              width: 16,
              height: 16,
              color: AppColor.white,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColor.primaryColor,
            icon: Image(
              image: const AssetImage(nav_notification),
              width: 16,
              height: 16,
              color: Colors.grey.shade200,
            ),
            label: "Notification",
            activeIcon: const Image(
              image: AssetImage(nav_notification),
              width: 16,
              height: 16,
              color: AppColor.white,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColor.primaryColor,
            icon: Image(
              image: const AssetImage(nav_user),
              width: 16,
              height: 16,
              color: Colors.grey.shade200,
            ),
            label: "Login",
            activeIcon: const Image(
              image: AssetImage(nav_user),
              width: 16,
              height: 16,
              color: AppColor.white,
            ),
          ),
        ]);
  }
}
