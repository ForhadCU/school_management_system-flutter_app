import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

String kDummyText =
    "Lorem ipsum dolor sit amet consectetur. Adipiscing mauris urna nisl aliquam nibh. Et elementum dignissim dictum nuncquis consequat tristique vulputate. A et odio varius et viverra dis risus";
Logger kLogger = Logger();
// Globel context
BuildContext kGlobContext = Get.context!;

// calander dialog
const String kNormal = "normal";
const String kCustom = "custom";

//appStrings
const String kAppName = 'Freelancer app';
const String kLoading = 'Loading...';
const String kFilter = "filter";
const String kDownload = "download";
const String kReload = "reload";
const String kCancel = "cancel";
const String kAssign = "assign";
const String kTopUp = "topup";
const String kDeduction = "deduction";
//login-screen
const String kLoginSkipButton = 'skip';
const String kLoginJoinGoec = 'Join GO EC and make';
const String kLoginRevolutions = 'Revolutions';

const String kLoginButtonGoogle = 'Google';
const String kLoginButtonFacebook = 'Facebook';
const String kLoginButtonPhone = 'Login with Phone';
const String kLoginTermsAndPrivay = 'Login with Phone';

///***4 Launcher Slides*/
const String tLauncherSlide1title = 'Multiple Logins';
const String tLauncherSlide1Subtitle =
    'Multiple Login Facility for Convinence of multiple users';
const String tLauncherSlide2Title = 'Notice Board';
const String tLauncherSlide2SubTitle = 'Easy Notice Exchange between Parties';
const String tLauncherSlide3Title = 'Routines';
const String tLauncherSlide3SubTitle =
    'Assigning and Viewing are just a Tap away';
const String tLauncherSlide4Title = 'Attendance';
const String tLauncherSlide4SubTitle =
    'Attendance can now be taken with few simple taps';
const String tLauncherSlide5Title = 'Mark Sheet';
const String tLauncherSlide5SubTitle =
    'Convinently get your students marksheet right in your smart phone';
const String tSkip = "Skip";
const String tNext = "Next";
const String tFinish = "Finish";
const String tSchoolClgeList = "School/College List";
const String tSearchSchoolClge = "Search for your school/college...";

///***Home */
const String tLogin = "Login";
const String tDemoSchoolName = "Demo Model School Name";
const String tNotice = "Login";
const String tGallery = "Gallery";
const String tSiteHistory = "Site History";
const String tContactUs = "Contact Us";
const String tAcademicCal = "Academic Calander";
const String tHoliday = "Holiday";
const String tEvent = "Event";
const String tExamination = "Examination";
const String tSeeMore = "See More";
const String tReadMore = "Read More";
const String tSeeAll = "See All";
const String tDots3 = "...";

///**Bottom Navigation bar */




kLog(dynamic value) {
      kLog(value.toString());

/*   if (kDebugMode) {
    kLog(value.toString());
  } */
}
