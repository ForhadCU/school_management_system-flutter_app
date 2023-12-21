import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/themes/theme.dart';
import 'Config/constants/constants.dart';
import 'Controller/base_controller.dart';
import 'Routes/app_pages.dart';
import 'Routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(BaseController());
  // appData.token = await getString('token') ?? '';
  // kLog(appData.token);
  runApp(const MyApp());
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
            initialRoute: AppRoutes.launcherSlides,
            // initialRoute: AppRoutes.test,
            getPages: AppPages.pages,
            // home: const BasePage(),
          );
        }));
  }
}
