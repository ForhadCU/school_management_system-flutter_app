
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/student_library.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Utils/utils.dart';

class ClassroomWidgets {
  // make this class singleton
  ClassroomWidgets._internal();
  static final ClassroomWidgets _singleton = ClassroomWidgets._internal();
  factory ClassroomWidgets() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances
  static final controller = ClassroomController.to;

  static vTopbar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.helpDeskTopbar,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                  color: AppColor.frenchSkyBlue100,
                  /*  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                  child: DropdownButton<String>(
                    dropdownColor: AppColor
                        .frenchSkyBlue100, // Set dropdown fill color to white
                    underline: Container(),
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem<String>(
                        value: 'Option 1',
                        child: Text('Option 1'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Option 2',
                        child: Text('Option 2'),
                      ),
                    ],
                    onChanged: (value) {},
                    hint: const Text('Video Type'),
                  ),
                ),
              ),
              AppSpacing.sm.width,
              Expanded(
                flex: 1,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                  color: AppColor.frenchSkyBlue100,
                  /*    decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                  child: DropdownButton<String>(
                    dropdownColor: AppColor
                        .frenchSkyBlue100, // Set dropdown fill color to white

                    underline: Container(),
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem<String>(
                        value: 'Option A',
                        child: Text('Option A'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Option B',
                        child: Text('Option B'),
                      ),
                    ],
                    onChanged: (value) {},
                    hint: const Text('Subject'),
                  ),
                ),
              ),
            ],
          ),
          (AppSpacing.sm + 2).height,
          const Row(
            children: [
              Expanded(
                flex: 1,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: AppColor.white,
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search...',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  static vTestWidget() {}

  static vVideoList() {
    return Expanded(
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.classroomDetails);
              },
              child: _vItem(),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: AppSpacing.sm,
              color: AppColor.white,
            );
          },
          itemCount: 10),
    );
  }

  static _vItem() {
    return Container(
      height: AppScreenSize.mGetHeight(kGlobContext, 12),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColor.classroomItemBg,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(1, 1),
            )
          ]),
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
      child: Row(
        children: [
          const Column(
            children: [
              Expanded(
                child: Image(
                  image: AssetImage("assets/images/ytb_logo.png"),
                  width: 100,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          AppSpacing.sm.width,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                kDummyBanglaText.substring(0,90),
                style: kBody.copyWith(fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Subject : ".toUpperCase(),
                        style: kLabel,
                      ),
                      Text(
                        "Science".toUpperCase(),
                        style: kLabel,
                      ),
                    ],
                  ),
                  const Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "12 Sep 2018",
                        style: kLabel,
                      )
                    ],
                  ))
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  static vDocuments() {
    return Container();
  }
}

class ClassroomDetailsWidgets {
  // make this class singleton
  ClassroomDetailsWidgets._internal();
  static final ClassroomDetailsWidgets _singleton =
      ClassroomDetailsWidgets._internal();
  factory ClassroomDetailsWidgets() {
    return _singleton;
  }

  static vTutorialCard() {
    return Column(
      children: [
        _vTopBar(text: "Clicked Item title from Help Desk"),
        _vPlainBlueBox(
          child: _vBody(),
        )
      ],
    );
  }

  static _vTopBar({required String text}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm, vertical: AppSpacing.sm + 2),
      decoration: const BoxDecoration(
          color: AppColor.helpDeskTopbar,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          )),
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.w500, fontSize: 18, color: AppColor.white),
      ),
    );
  }

  static Container _vPlainBlueBox({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
      decoration: const BoxDecoration(color: AppColor.frenchSkyBlue100),
      child: child,
    );
  }

  static _vBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _vUserCard(),
        AppSpacing.md.height,
        Container(
          width: double.infinity,
          height: AppScreenSize.mGetHeight(kGlobContext, 25),
          decoration: const BoxDecoration(color: AppColor.secondaryColor),
          child: Image(image: AssetImage("assets/images/ytb_logo.png",), fit: BoxFit.fill,),
        ),
        AppSpacing.md.height,
        _vTopicDesc(),
        AppSpacing.md.height,
        _vDocuments(),
      ],
    );
  }

  static _vUserCard() {
    return Container(
      height: AppScreenSize.mGetHeight(kGlobContext, 10),
      width: double.infinity,
      color: Colors.transparent,
      child: Row(
        children: [
          const Column(
            children: [
              Expanded(
                child: Image(
                  image: AssetImage("assets/images/sample_gallery_image.jpg"),
                  width: 80,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          AppSpacing.sm.width,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "User name".toUpperCase(),
                style: kLabel.copyWith(
                    fontWeight: FontWeight.w400, color: AppColor.fontUsername),
              ),
              AppSpacing.smh.height,
              Row(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Topic For : ",
                        style: kLabel.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Class : ",
                        style: kLabel.copyWith(fontSize: 12),
                      ),
                      Text(
                        "XI",
                        style: kLabel.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                  2.width,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Subject : ",
                        style: kLabel.copyWith(fontSize: 12),
                      ),
                      Text(
                        "Science",
                        style: kLabel.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              1.height,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Current Date : ",
                    style: kLabel.copyWith(fontSize: 12),
                  ),
                  Text(
                    "12 Sep 2012",
                    style: kLabel.copyWith(fontSize: 12),
                  ),
                ],
              ),
              1.height,
              Row(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Publish Date : ",
                        style: kLabel.copyWith(fontSize: 12),
                      ),
                      Text(
                        "12 Sep 2012",
                        style: kLabel.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }

  static _vTopicDesc() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///heading
        Text(
          "Topic Description",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: AppColor.fontUsername),
        ),
        AppSpacing.sm.height,

        ///body
        Text(
          "This is description overview. This is descripiton overview. This is descripition ooverview",
          style: kBody,
        )
      ],
    );
  }

  static _vDocuments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///heading
        Text(
          "Documents",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: AppColor.fontUsername),
        ),

        AppSpacing.sm.height,
        ListView.separated(
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
                decoration: BoxDecoration(
                    color: AppColor.documentItembg,
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(
                      "documnet file $index.Docx",
                      style: kBody.copyWith(color: Colors.white),
                    )),
                    AppSpacing.smh.width,
                    Icon(
                      Icons.download,
                      color: AppColor.white,
                      size: 24,
                    )
                  ],
                ),
              );
            }),
            separatorBuilder: (context, index) {
              return Divider(
                color: AppColor.frenchSkyBlue100,
                height: AppSpacing.smh,
              );
            },
            itemCount: 5)

        ///body
      ],
    );
  }
  // codes start from here
  // All methods should be static to maintain singleton instances
}
