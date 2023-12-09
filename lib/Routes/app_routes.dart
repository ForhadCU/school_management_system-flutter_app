import 'package:get/get.dart';
import 'package:school_management_system/Bindings/academic_calendar.dart';
import 'package:school_management_system/Bindings/contact.dart';
import 'package:school_management_system/Bindings/dashboard.dart';
import 'package:school_management_system/Bindings/gallery.dart';
import 'package:school_management_system/Bindings/home.dart';
import 'package:school_management_system/Bindings/landing_binding.dart';
import 'package:school_management_system/Bindings/launcher_slides.dart';
import 'package:school_management_system/Bindings/login.dart';
import 'package:school_management_system/Bindings/notice.dart';
import 'package:school_management_system/Bindings/search_school.dart';
import 'package:school_management_system/Bindings/site_history.dart';
import 'package:school_management_system/Bindings/test/test_binding.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:school_management_system/Views/PUBLIC/academicCalendar/academic_calendar.dart';
import 'package:school_management_system/Views/PUBLIC/contact/contact.dart';
import 'package:school_management_system/Views/PUBLIC/landing/landing.dart';
import 'package:school_management_system/Views/STUDENT/dashboard/dashboard.dart';
import 'package:school_management_system/Views/PUBLIC/gallery/gallery.dart';
import 'package:school_management_system/Views/STUDENT/home/home.dart';
import 'package:school_management_system/Views/PUBLIC/launcherSlides/launcher_slides.dart';
import 'package:school_management_system/Views/PUBLIC/login/login.dart';
import 'package:school_management_system/Views/PUBLIC/notice/notice.dart';
import 'package:school_management_system/Views/PUBLIC/notification/notifications.dart';
import 'package:school_management_system/Views/PUBLIC/searchSchool/search_school.dart';
import 'package:school_management_system/Views/PUBLIC/siteHistory/site_history.dart';
import '../Views/PUBLIC/notice/pages/expanded_notice.dart';
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
      page: () => Test(),
    ),

    /// Laucher Slides
    GetPage(
        name: AppRoutes.launcherSlides,
        binding: LaucherSlidesBinding(),
        page: () => LauncherSlidesScreen()),

    /// Search School
    GetPage(
        name: AppRoutes.searchSchool,
        binding: SearchSchoolBinding(),
        page: () => SearchSchool()),

    /// Notice
    GetPage(
        name: AppRoutes.notice, binding: NoticeBinding(), page: () => Notice()),
    GetPage(
        name: AppRoutes.notice,
        binding: NoticeBinding(),
        page: () => ExpandedNotice()),

    /// Gallery
    GetPage(
        name: AppRoutes.gallery,
        binding: GalleryBinding(),
        page: () => const Gallery()),

    /// SiteHistory
    GetPage(
        name: AppRoutes.siteHistory,
        binding: SiteHistoryBinding(),
        page: () => SiteHistory()),

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
      name: AppRoutes.home,
      binding: HomeBinding(),
      page: () => Home(),
    ),

    GetPage(
      name: AppRoutes.dashboard,
      binding: DashboardBinding(),
      page: () => const Dashboard(),
    ),
    GetPage(
      name: AppRoutes.login,
      binding: LoginBinding(),
      page: () => const Login(),
    ),
    GetPage(
      name: AppRoutes.notice,
      binding: NoticeBinding(),
      page: () => const Notifications(),
    ),
    GetPage(
      name: AppRoutes.landing,
      binding: LandingBinding(),
      page: () => const Landing(),
    ),
  ];
}
