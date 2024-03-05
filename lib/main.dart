import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Config/themes/theme.dart';
import 'package:school_management_system/Utils/local_notification.dart';
import 'Controller/base_controller.dart';
import 'Routes/app_pages.dart';
import 'Routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(BaseController());
  await LocalNotification().mInit();

  // Get.put(CommonController());
  // appData.token = await getString('token') ?? '';
  // kLog(appData.token);
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 500)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = AppColor.primaryColor.withOpacity(.8)
    // ..backgroundColor = AppColor.primaryColor.withOpacity(.8)
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.black.withOpacity(0.4)
    ..userInteractions = true
    ..dismissOnTap = false /*  ..customAnimation = CustomAnimation() */;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: ((context, child) {
          return GetMaterialApp(
            defaultTransition: Transition.noTransition,
            transitionDuration: const Duration(milliseconds: 500),
            title: kAppName,
            debugShowCheckedModeBanner: false,
            builder: EasyLoading.init(),
            theme: themeData,
            initialRoute: AppRoutes.splashScreen,
            // initialRoute: AppRoutes.launcherSlides,
            // initialRoute: AppRoutes.teachDashboard,
            // initialRoute: AppRoutes.test,
            getPages: AppPages.pages,
            // home: const BasePage(),
          );
        }));
  }
}
