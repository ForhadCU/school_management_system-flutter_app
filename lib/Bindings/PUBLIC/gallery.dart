import 'package:get/get.dart';

import '../../Controller/PUBLIC/gallery_controller.dart';

class GalleryBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(GalleryController());
    Get.lazyPut(() => GalleryController());
  }
}
