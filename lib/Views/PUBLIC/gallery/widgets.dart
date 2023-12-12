import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/gallery.dart';
import 'package:school_management_system/Utils/int_extensions.dart';

class GalleryWidget {
  static final GalleryWidget _singleton = GalleryWidget._internal();
  GalleryWidget._internal();
  factory GalleryWidget() {
    return _singleton;
  }
  final controller = GalleryController.to;
  static Widget vTopBar(GalleryController controler) {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      crossAxisSpacing: AppSpacing.md,
      children: [
        StaggeredGridTile.fit(
            crossAxisCellCount: 1,
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: AppSpacing.sm, horizontal: AppSpacing.sm),
              decoration: kContainerPrimary,
              child: Row(
                children: [
                  Icon(
                    Icons.camera,
                    size: 24,
                    color: AppColor.secondaryColor,
                  ),
                  AppSpacing.md.width,
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: Text("All Photos"),
                  ))
                ],
              ),
            )),
        StaggeredGridTile.fit(
            crossAxisCellCount: 1,
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: AppSpacing.sm, horizontal: AppSpacing.sm),
              decoration: kContainerPrimary,
              child: Row(
                children: [
                  Image(
                    image: AssetImage(PublicAssetLocation.gallery),
                    width: 24,
                    height: 24,
                    color: AppColor.secondaryColor,
                  ),
                  AppSpacing.md.width,
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: Text("Albums"),
                  ))
                ],
              ),
            )),
      ],
    );
  }

  static vDividerAndFilter(GalleryController controler) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
            child: Divider(
          color: AppColor.secondaryColor,
        )),
        AppSpacing.md.width,
        Text(
          "Sort by",
          style: kLabel,
        ),
        AppSpacing.sm.width,
        _vDropdown(controler),
      ],
    );
  }

  static _vDropdown(GalleryController controler) {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.sm, vertical: AppSpacing.smh/2),
        color: AppColor.secondaryColor,
        child: DropdownButton<String>(
          value: controler.dropdownValue.value,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 12,
          // elevation: 10,
          // style: kBody.copyWith(fontWeight: FontWeight.w500),
          dropdownColor: AppColor.secondaryColor,
          isDense: true,
          underline: Container(),
          onChanged: (String? newValue) {
            controler.mUpdateDropdownValue(newValue!);
          },
          items: <String>["Date", "Item 2"]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              alignment: AlignmentDirectional.center,
              value: value,
              child: Text(
                value,
                style: kBody.copyWith(
                  color: AppColor.white, /* fontWeight: FontWeight.w500 */
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  static vPhotos(GalleryController controler) {
    return Expanded(
      child: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: AppSpacing.md,
          crossAxisSpacing: AppSpacing.md,
          children: List.generate(
              30,
              (index) => GestureDetector(
                    onTap: () {
                      _vShowImageDialog();
                    },
                    child: Image(
                      image:
                          AssetImage(PublicAssetLocation.sample_gallery_image),
                      height: 100,
                      fit: BoxFit.fitHeight,
                      // color: AppColor.secondaryColor,
                    ),
                  )).toList(),
        ),
      ),
    );
  }

  static _vShowImageDialog() {
    return showDialog(
        context: (kGlobContext),
        builder: (kGlobContext) {
          return Dialog(
            // backgroundColor: ,

            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                      image:
                          AssetImage(PublicAssetLocation.sample_gallery_image)),
                  AppSpacing.sm.height,
                  Text(
                    "Image title",
                    style: kBody.copyWith(fontWeight: FontWeight.w600),
                  ),
                  AppSpacing.smh.height,
                  Text(
                    "This is image description",
                    style: kBody,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
