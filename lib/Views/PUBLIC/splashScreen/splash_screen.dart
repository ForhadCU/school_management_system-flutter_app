import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Utils/int_extensions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.end ,
            children: [
              Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppSpacing.xxl.width,
              Text(
                "Welcome To",
                style: kTitle.copyWith(
                    fontSize: 20,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          AppSpacing.xl.height,
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
                height: 18,
                fit: BoxFit.contain,
              ),
            ],
          ),
            ],
          )),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image(
                  image: AssetImage(the_world),
                  height: 32,
                  width: 32,
                  fit: BoxFit.contain,
                ),
                AppSpacing.sm.width,
                Text(
                  "sister concern of ",
                  style: kBody.copyWith(
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "The World",
                  style: kBody.copyWith(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500),
                ),
                AppSpacing.xl.width,
              ],
            ),
          ),
          AppSpacing.xl.height,
        ],
      ),
    );
  }
}
