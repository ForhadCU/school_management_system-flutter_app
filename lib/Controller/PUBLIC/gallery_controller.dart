import 'package:get/get.dart';
import 'package:school_management_system/Api/PUBLIC/gallery_api.dart';
import 'package:school_management_system/Model/PUBLIC/gallery/image_gallery_api_model.dart';
import 'package:school_management_system/Singletones/app_data.dart';
import 'package:school_management_system/Utils/api%20structure/payloads.dart';

import '../../Model/PUBLIC/searchSchool/site_list_model.dart';
import 'landing_controller.dart';

class GalleryController extends GetxController {
  static GalleryController get to => Get.find();

  var siteListModel = SitelistModel().obs;
  var galleryDataModelList = <Datum>[].obs;
  var fileElementList = <FileElement>[].obs;
  var clickedImageDetails = Datum().obs;
  var pagination = 0.obs;
  var isPhotoViewByAlbums = false.obs;

  var dropdownValue = Rxn<String>();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    _mInitiatevalue();
    await mGetGalleryData();
    galleryDataModelList.isNotEmpty ? mGetAllPhotos() : null;
  }

  mGetAllPhotos() {
    fileElementList.clear();
    for (var galleryModel in galleryDataModelList) {
      galleryModel.files != null
          ? {
              for (var fileElement in galleryModel.files!)
                {fileElementList.add(fileElement)}
            }
          : null;
    }
  }

  mSwitchPhotoView({required bool isPhotoViewByAlbums}) {
    this.isPhotoViewByAlbums.value = isPhotoViewByAlbums;
  }

  mGetClickedImageDetails(int imageable_id) {
    clickedImageDetails.value =
        galleryDataModelList.where((p0) => p0.id == imageable_id).first;
  }

  void _mInitiatevalue() {
    dropdownValue.value = "Date";
    siteListModel.value = LandingController.to.siteListModel.value;
    print("site id: ${siteListModel.value.id}");
  }

  void mUpdateDropdownValue(String s) {
    dropdownValue.value = s;
  }

  mGetGalleryData() async {
    galleryDataModelList.value = await GalleryApi.mGetGalleryData(
        PayLoads.imageGallery(
            api_access_key: AppData.api_access_key,
            site_id: siteListModel.value.id.toString(),
            paginate: pagination.toString()));
  }
}
