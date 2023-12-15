import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Model/PUBLIC/gallery/image_gallery_api_model.dart';

import '../../Model/response_model.dart';
import '../../Utils/utils.dart';

class GalleryApi {
  // make this class singleton
  GalleryApi._internal();
  static final GalleryApi _singleton = GalleryApi._internal();
  factory GalleryApi() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  static Future<List<Datum>> mGetGalleryData(
      Map<String, dynamic> payLoad) async {
    ResponseModel res =
        await CallAPI.getPublicData(ApiEndpoint.imageGallery, payLoad);
    // kLogger.d(res.body['result']);
    if (res.statusCode == 200) {
      print("Successfully read data");
      ImageGalleryApiModel imageGalleryApiModel =
          ImageGalleryApiModel.fromMap(res.body);
      kLog("image Gallery length " +
          imageGalleryApiModel.galleryList!.data!.length.toString());
      return imageGalleryApiModel.galleryList!.data!;
      // return [];
    } else {
      return <Datum>[];
    }
  }
}
