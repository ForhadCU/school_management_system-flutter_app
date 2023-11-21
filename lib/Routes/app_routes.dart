import 'package:get/get.dart';
import 'package:school_management_system/Bindings/academic_calendar.dart';
import 'package:school_management_system/Bindings/contact.dart';
import 'package:school_management_system/Bindings/gallery.dart';
import 'package:school_management_system/Bindings/home.dart';
import 'package:school_management_system/Bindings/launcher_slides.dart';
import 'package:school_management_system/Bindings/notice.dart';
import 'package:school_management_system/Bindings/search_school.dart';
import 'package:school_management_system/Bindings/site_history.dart';
import 'package:school_management_system/Bindings/test/test_binding.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:school_management_system/Views/academicCalendar/academic_calendar.dart';
import 'package:school_management_system/Views/contact/contact.dart';
import 'package:school_management_system/Views/gallery/gallery.dart';
import 'package:school_management_system/Views/home/home.dart';
import 'package:school_management_system/Views/launcherSlides/launcher_slides.dart';
import 'package:school_management_system/Views/notice/notice.dart';
import 'package:school_management_system/Views/searchSchool/search_school.dart';

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
    ),

    /// Laucher Slides
    GetPage(
        name: AppRoutes.launcherSlides,
        binding: LaucherSlidesBinding(),
        page: () => const LauncherSlidesScreen()),

    /// Search School
    GetPage(
        name: AppRoutes.searchSchool,
        binding: SearchSchoolBinding(),
        page: () => const SearchSchool()),

    /// Notice
    GetPage(
        name: AppRoutes.notice,
        binding: NoticeBinding(),
        page: () => const Notice()),

    /// Gallery
    GetPage(
        name: AppRoutes.gallery,
        binding: GalleryBinding(),
        page: () => const Gallery()),

    /// SiteHistory
    GetPage(
        name: AppRoutes.siteHistory,
        binding: SiteHistoryBinding(),
        page: () => const Notice()),

    /// Contact
    GetPage(
        name: AppRoutes.contact,
        binding: ContactBinding(),
        page: () => const Contact()),

    /// AcademicCalendar
    GetPage(
        name: AppRoutes.academicCalendar,
        binding: AcademicCalendarBinding(),
        page: () => const AcademicCalendar()),

    /// Home
    GetPage(
        name: AppRoutes.home, binding: HomeBinding(), page: () => const Home()),
  ];
}
