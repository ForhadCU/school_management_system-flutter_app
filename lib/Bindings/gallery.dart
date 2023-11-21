import 'package:get/get.dart';

import '../Controller/gallery.dart';

class GalleryBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(GalleryController());
  }
}