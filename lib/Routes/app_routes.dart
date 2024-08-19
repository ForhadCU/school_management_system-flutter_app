import 'package:get/get.dart';
import 'package:school_management_system/Bindings/PUBLIC/academic_calendar.dart';
import 'package:school_management_system/Bindings/PUBLIC/contact.dart';
// import 'package:school_management_system/Bindings/PUBLIC/dashboard.dart';
import 'package:school_management_system/Bindings/PUBLIC/gallery.dart';
import 'package:school_management_system/Bindings/PUBLIC/home.dart';
import 'package:school_management_system/Bindings/PUBLIC/landing_binding.dart';
import 'package:school_management_system/Bindings/PUBLIC/launcher_slides.dart';
import 'package:school_management_system/Bindings/PUBLIC/login.dart';
import 'package:school_management_system/Bindings/PUBLIC/notice.dart';
import 'package:school_management_system/Bindings/PUBLIC/result.dart';
import 'package:school_management_system/Bindings/PUBLIC/search_school.dart';
import 'package:school_management_system/Bindings/PUBLIC/site_history.dart';
import 'package:school_management_system/Bindings/PUBLIC/splash_scr_binding.dart';
import 'package:school_management_system/Bindings/STUDENT/message/messages_binding.dart';
import 'package:school_management_system/Bindings/TEACHER/attendance/attendance_bindings.dart';
import 'package:school_management_system/Bindings/TEACHER/dashboard/dashboard_bindings.dart';
import 'package:school_management_system/Bindings/TEACHER/examAttandence/exam_attandence_bindings.dart';
import 'package:school_management_system/Bindings/TEACHER/examMarksEntry/exam_marks_entry_bindings.dart';
import 'package:school_management_system/Bindings/TEACHER/helpdesk/helpdesk_bindings.dart';
import 'package:school_management_system/Bindings/TEACHER/home/home_bindings.dart';
import 'package:school_management_system/Bindings/TEACHER/message/messages_binding.dart';
import 'package:school_management_system/Bindings/TEACHER/notice/notice_bindings.dart';
import 'package:school_management_system/Bindings/TEACHER/profile/profile_bindings.dart';
import 'package:school_management_system/Bindings/TEACHER/routine/routine_bindings.dart';
import 'package:school_management_system/Bindings/TEACHER/test/test_binding.dart';
import 'package:school_management_system/Bindings/test/test_binding.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:school_management_system/Views/PUBLIC/academicCalendar/academic_calendar.dart';
import 'package:school_management_system/Views/PUBLIC/contact/contact.dart';
import 'package:school_management_system/Views/PUBLIC/landing/landing.dart';
import 'package:school_management_system/Views/PUBLIC/login/pages/academic_group.dart';
import 'package:school_management_system/Views/PUBLIC/result/result.dart';
import 'package:school_management_system/Views/PUBLIC/splashScreen/splash_screen.dart';
import 'package:school_management_system/Views/STUDENT/classroom/subPages/classroom_details.dart';
import 'package:school_management_system/Views/STUDENT/dashboard/dashboard.dart';
import 'package:school_management_system/Views/PUBLIC/gallery/gallery.dart';
import 'package:school_management_system/Views/STUDENT/home_advanced_design/home.dart';
import 'package:school_management_system/Views/PUBLIC/launcherSlides/launcher_slides.dart';
import 'package:school_management_system/Views/PUBLIC/login/login.dart';
import 'package:school_management_system/Views/PUBLIC/notice/notice.dart';
import 'package:school_management_system/Views/PUBLIC/notification/notifications.dart';
import 'package:school_management_system/Views/PUBLIC/searchSchool/search_school.dart';
import 'package:school_management_system/Views/PUBLIC/siteHistory/about_us.dart';
import 'package:school_management_system/Views/STUDENT/message/message.dart';
import 'package:school_management_system/Views/STUDENT/message/pages/expanded_message.dart';
import 'package:school_management_system/Views/STUDENT/notice/pages/expanded_notice.dart';
import 'package:school_management_system/Views/TEACHER/attendance/attendance.dart';
import 'package:school_management_system/Views/TEACHER/dashboard/dashboard.dart';
import 'package:school_management_system/Views/TEACHER/examAttandence/exam_attandence.dart';
import 'package:school_management_system/Views/TEACHER/examMarksEntry/exam_marks_entry.dart';
import 'package:school_management_system/Views/TEACHER/helpdesk/helpdesk.dart';
import 'package:school_management_system/Views/TEACHER/helpdesk/subPages/helpdesk_details.dart';
import 'package:school_management_system/Views/TEACHER/home/home.dart';
import 'package:school_management_system/Views/TEACHER/message/message.dart';
import 'package:school_management_system/Views/TEACHER/notice/notice.dart';
import 'package:school_management_system/Views/TEACHER/notice/pages/expanded_notice.dart';
import 'package:school_management_system/Views/TEACHER/periodicAttendance/periodic_attendance.dart';
import 'package:school_management_system/Views/TEACHER/profile/profile.dart';
import 'package:school_management_system/Views/TEACHER/routine/routine.dart';
import 'package:school_management_system/Views/TEACHER/test/test.dart';
import '../Bindings/TEACHER/periodicAttndance/periodic_attnd_binding.dart';
import '../Views/PUBLIC/notice/pages/expanded_notice.dart';
import '../Views/STUDENT/helpdesk/subPages/helpdesk_details.dart';
import '../Views/TEACHER/message/pages/expanded_message.dart';
import '../Views/test/test.dart';
import 'package:school_management_system/Bindings/student_library.dart';
import 'package:school_management_system/Views/student_library.dart';

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

    /// SplashScreen
    GetPage(
        name: AppRoutes.splashScreen,
        binding: SplashScreenBindig(),
        page: () => SplashScreen()),

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
        name: AppRoutes.expandedNotice,
        binding: NoticeBinding(),
        page: () => ExpandedNotice()),
    GetPage(
        name: AppRoutes.expandedStuNotice,
        binding: StuNoticeBindings(),
        page: () => ExpandedStuNotice()),

    /// Gallery
    GetPage(
        name: AppRoutes.gallery,
        binding: GalleryBinding(),
        page: () => const Gallery()),

    /// SiteHistory
    GetPage(
        name: AppRoutes.siteHistory,
        binding: SiteHistoryBinding(),
        page: () => AboutUs()),

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
      page: () => HomeAdvancedDesign(),
    ),

    GetPage(
      name: AppRoutes.dashboard,
      binding: DashboardBindings(),
      page: () => const StuDashboard(),
    ),
    GetPage(
      name: AppRoutes.login,
      binding: LoginBinding(),
      page: () => Login(),
    ),
    GetPage(
      name: AppRoutes.academicGroup,
      binding: LoginBinding(),
      page: () => const AcademicGroupPage(),
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

    /// STUDENT
    GetPage(
      name: AppRoutes.attendance,
      binding: AttendanceBindings(),
      page: () => const StuAttendance(),
    ),
    GetPage(
      name: AppRoutes.calendar,
      binding: StuCalendarBindings(),
      page: () => const StuCalendar(),
    ),
    GetPage(
      name: AppRoutes.classroom,
      binding: ClassroomBindings(),
      page: () => const Classroom(),
    ),
    GetPage(
      name: AppRoutes.classroomDetails,
      binding: ClassroomBindings(),
      page: () => const ClassroomDetails(),
    ),
    /* GetPage(
      name: AppRoutes.dashboard,
      binding: DashboardBindings(),
      page: () => const StuDashboard(),
    ), */
    GetPage(
      name: AppRoutes.exam,
      binding: ExamBindings(),
      page: () => const Exam(),
    ),
    GetPage(
      name: AppRoutes.helpdesk,
      binding: HelpDeskBindings(),
      page: () => const HelpDesk(),
    ),
    GetPage(
      name: AppRoutes.helpdeskDetails,
      binding: HelpDeskBindings(),
      page: () => const HelpDeskDetails(),
    ),
    GetPage(
      name: AppRoutes.studentHome,
      binding: HomeBindings(),
      page: () => StuHome(),
    ),
    GetPage(
      name: AppRoutes.liveClass,
      binding: LiveClassBindings(),
      page: () => const LiveClass(),
    ),
    GetPage(
      name: AppRoutes.studentNotice,
      binding: StuNoticeBindings(),
      page: () => StudentNotice(),
    ),
    GetPage(
      name: AppRoutes.studentNoticeExpanded,
      binding: StuNoticeBindings(),
      page: () => ExpandedStuNotice(),
    ),
    GetPage(
      name: AppRoutes.studentNotification,
      binding: NotificationBindings(),
      page: () => StuNotification(),
    ),
    GetPage(
      name: AppRoutes.payments,
      binding: PaymentsBindings(),
      page: () => const StuPayments(),
    ),
    GetPage(
      name: AppRoutes.profile,
      binding: ProfileBindings(),
      page: () => Profile(),
    ),
    GetPage(
      name: AppRoutes.quiz,
      binding: QuizBindings(),
      page: () => const StuQuiz(),
    ),
    GetPage(
      name: AppRoutes.result,
      binding: ResultBindings(),
      page: () => const Result(),
    ),
    GetPage(
      name: AppRoutes.routine,
      binding: RoutineBindings(),
      page: () => const Routine(),
    ),
    GetPage(
      name: AppRoutes.subjects,
      binding: SubjectsBindings(),
      page: () => const StuSubjects(),
    ),
    GetPage(
      name: AppRoutes.website,
      binding: WebsiteBindings(),
      page: () => const Website(),
    ),
    GetPage(
      name: AppRoutes.stuMessage,
      binding: StuMessageBindings(),
      page: () => const StuMessage(),
    ),
    GetPage(
      name: AppRoutes.stuMessageExpand,
      binding: StuMessageBindings(),
      page: () => StuMessageExpand(),
    ),

    /// TEACHER
    GetPage(
        name: AppRoutes.teachHome,
        page: () => TeachHome(),
        binding: TeachHomeBindings()),
    GetPage(
        name: AppRoutes.teachDashboard,
        page: () => const TeachDashboard(),
        binding: TeachDashboardBindings()),
    GetPage(
        name: AppRoutes.teachProfile,
        page: () => TeachProfile(),
        binding: TeachProfileBindings()),
    GetPage(
        name: AppRoutes.teachNotice,
        page: () => TeachNotice(),
        binding: TeachNoticeBindings()),
    GetPage(
        name: AppRoutes.expandedTeachNotice,
        page: () => ExpandedTeachNotice(),
        binding: TeachNoticeBindings()),
    GetPage(
        name: AppRoutes.examMarksEntry,
        page: () => ExamMarksEntry(),
        binding: ExamMarksEntryBindings()),
    GetPage(
        name: AppRoutes.examAttendance,
        page: () => ExamAttendance(),
        binding: ExamAttendanceBindings()),
    GetPage(
        name: AppRoutes.teachRoutine,
        page: () => TeachRoutine(),
        binding: TeachRoutineBindings()),
    GetPage(
        name: AppRoutes.teachHelpdesk,
        page: () => const TeachHelpDesk(),
        binding: TeachHelpDeskBindings()),
    GetPage(
        name: AppRoutes.teachHelpdeskDetails,
        page: () => const TeachHelpDeskDetails(),
        binding: TeachHelpDeskBindings()),
    GetPage(
        name: AppRoutes.teachMessage,
        page: () => const TeachMessage(),
        binding: TeachMessageBindings()),
    GetPage(
        name: AppRoutes.teachMessageExpand,
        page: () => TeachMessageExpand(),
        binding: TeachMessageBindings()),
    GetPage(
        name: AppRoutes.teachPeriodicAttnd,
        page: () => const TeachPeriodicAttendance(),
        binding: TeachPeriodicAttendanceBindings()),
    GetPage(
        name: AppRoutes.teachAttendance,
        page: () => const TeachAttendance(),
        binding: TeachAttendanceBindings()),
    GetPage(
        name: AppRoutes.teachTest,
        page: () => const TeachTest(),
        binding: TeachTestBindings()),
    GetPage(
        name: AppRoutes.publicResult,
        page: () =>  PublicResult(),
        binding: PublicResultBinding()),
  ];
}
