import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Singletones/app_data.dart';
import 'package:school_management_system/Utils/custom_utils.dart';
import 'package:school_management_system/Utils/int_extensions.dart';

import '../../../Controller/PUBLIC/gallery_controller.dart';

class GalleryWidget {
  static final GalleryWidget _singleton = GalleryWidget._internal();
  GalleryWidget._internal();
  factory GalleryWidget() {
    return _singleton;
  }
  static final controller = GalleryController.to;
  static Widget vTopBar(GalleryController controler) {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      crossAxisSpacing: AppSpacing.md,
      children: [
        StaggeredGridTile.fit(
            crossAxisCellCount: 1,
            child: Obx(() => GestureDetector(
                  onTap: () => controller.isPhotoViewByAlbums.value = false,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.sm, horizontal: AppSpacing.sm),
                    decoration: !controller.isPhotoViewByAlbums.value
                        ? kContainerPrimary
                        : kContainerPrimary.copyWith(
                            color: AppColor.kGray700.withOpacity(.5)),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.camera,
                          size: 24,
                          color: AppColor.secondaryColor,
                        ),
                        AppSpacing.md.width,
                        Expanded(
                            child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.sm,
                              vertical: AppSpacing.sm),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "All Photos",
                            style: TextStyle(
                                color: !controller.isPhotoViewByAlbums.value
                                    ? Colors.black
                                    : AppColor.kGray700.withOpacity(.5)),
                          ),
                        ))
                      ],
                    ),
                  ),
                ))),
        StaggeredGridTile.fit(
            crossAxisCellCount: 1,
            child: Obx(() => GestureDetector(
                  onTap: () => controller.isPhotoViewByAlbums.value = true,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.sm, horizontal: AppSpacing.sm),
                    decoration: controller.isPhotoViewByAlbums.value
                        ? kContainerPrimary
                        : kContainerPrimary.copyWith(
                            color: AppColor.kGray700.withOpacity(.5)),
                    child: Row(
                      children: [
                        const Image(
                          image: AssetImage(PublicAssetLocation.ic_gallery),
                          width: 24,
                          height: 24,
                          color: AppColor.secondaryColor,
                        ),
                        AppSpacing.md.width,
                        Expanded(
                            child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.sm,
                              vertical: AppSpacing.sm),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "Albums",
                            style: TextStyle(
                                color: controller.isPhotoViewByAlbums.value
                                    ? Colors.black
                                    : AppColor.kGray700.withOpacity(.5)),
                          ),
                        ))
                      ],
                    ),
                  ),
                ))),
      ],
    );
  }

  static vDividerAndFilter(GalleryController controler) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Expanded(
            child: Divider(
          color: AppColor.secondaryColor,
        )),
        AppSpacing.md.width,
        const Text(
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
        padding:  const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm, vertical: AppSpacing.smh / 2),
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
          items: <String>["Date"].map<DropdownMenuItem<String>>((String value) {
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
      child: Obx(() => !controller.isPhotoViewByAlbums.value
          ? StaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: AppSpacing.md,
              crossAxisSpacing: AppSpacing.md,
              children: List.generate(controler.fileElementList.length,
                  (gridViewIndex) {
                kLog(AppData.eduWorldErpHostname +
                    controler.fileElementList[gridViewIndex].path!);
                return GestureDetector(
                    onTap: () {
                      controller.mGetClickedImageDetails(controler
                          .fileElementList[gridViewIndex].imageableId!);
                      _vShowImageDialog(
                        AppData.eduWorldErpHostname +
                            controler.fileElementList[gridViewIndex].path!,
                        controler.clickedImageDetails.value.eventTitle!,
                        controler.clickedImageDetails.value.eventDescription!,
                        controler.fileElementList[gridViewIndex].createdAt!,
                      );
                    },
                    child: CachedNetworkImage(
                      imageUrl: AppData.eduWorldErpHostname +
                          controler.fileElementList[gridViewIndex].path!,
                      height: 100,
                      fit: BoxFit.fill,
                    ) /* const Image(
                              image: AssetImage(
                                  PublicAssetLocation.sample_gallery_image),
                              height: 100,
                              fit: BoxFit.fitHeight,
                              // color: AppColor.secondaryColor,
                            ), */
                    );
              }).toList(),
            )

          /// for photo viewing by albums
          : ListView.builder(
              itemCount: controller.galleryDataModelList.isEmpty
                  ? 0
                  : controler.galleryDataModelList.length,
              shrinkWrap: true,
              itemBuilder: (context, listViewIndex) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controler.galleryDataModelList[listViewIndex].eventTitle
                            .toString(),
                        style: kBody.copyWith(fontWeight: FontWeight.w600),
                      ),
                      AppSpacing.smh.height,
                      Text(
                        Utils().getTimeFromTimeStamp(
                            controler
                                .galleryDataModelList[listViewIndex].createdAt
                                .toString(),
                            kAppDateFormatWithTime12),
                        style: kLabel.copyWith(
                            color: AppColor.kGray700.withOpacity(.8)),
                      ),
                                            AppSpacing.sm.height,

                      StaggeredGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: AppSpacing.md,
                        crossAxisSpacing: AppSpacing.md,
                        children: List.generate(
                            controler.galleryDataModelList[listViewIndex]
                                        .files !=
                                    null
                                ? controler.galleryDataModelList[listViewIndex]
                                    .files!.length
                                : 0, (gridViewIndex) {
                          kLog(AppData.eduWorldErpHostname +
                              controler.galleryDataModelList[listViewIndex]
                                  .files![gridViewIndex].path!);
                          return GestureDetector(
                              onTap: () {
                                _vShowImageDialog(
                                  AppData.eduWorldErpHostname +
                                      controler
                                          .galleryDataModelList[listViewIndex]
                                          .files![gridViewIndex]
                                          .path!,
                                  controler.galleryDataModelList[listViewIndex]
                                      .eventTitle!,
                                  controler.galleryDataModelList[listViewIndex]
                                      .eventDescription!,
                                  controler.galleryDataModelList[listViewIndex]
                                      .files![gridViewIndex].createdAt!,
                                );
                              },
                              child: CachedNetworkImage(
                                imageUrl: AppData.eduWorldErpHostname +
                                    controler
                                        .galleryDataModelList[listViewIndex]
                                        .files![gridViewIndex]
                                        .path!,
                                height: 100,
                                fit: BoxFit.fill,
                              ));
                        }).toList(),
                      ),
                    ],
                  ),
                );
              },
            )),
    );
  }

  static _vShowImageDialog(
      String imgUrl, String title, String desc, DateTime dateTime) {
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
                  CachedNetworkImage(imageUrl: imgUrl),
                  AppSpacing.sm.height,
                  Text(
                    title,
                    style: kBody.copyWith(fontWeight: FontWeight.w600),
                  ),
                  AppSpacing.smh.height,
                  Text(
                    Utils().getTimeFromTimeStamp(
                        dateTime.toString(), kAppDateFormatWithDayMonth),
                    style: kLabel.copyWith(
                        color: AppColor.kGray700.withOpacity(.8)),
                  ),
                  AppSpacing.sm.height,
                  Text(
                    desc,
                    style: kBody,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
