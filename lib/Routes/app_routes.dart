import 'package:get/get.dart';
import 'package:school_management_system/Bindings/test/test_binding.dart';
import 'package:school_management_system/Routes/app_pages.dart';

import '../Views/test/test.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    /// Auth
    /*  GetPage(name: AppRoutes.login,
    binding: ,
     page: page) */

    /// Test
    GetPage(
      name: AppRoutes.test,
      binding: TestBinding(),
      page: () => const Test(),
    )
  ];
}
