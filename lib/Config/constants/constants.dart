import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

String kDummyText =
    "Lorem ipsum dolor sit amet consectetur. Adipiscing mauris urna nisl aliquam nibh. Et elementum dignissim dictum nuncquis consequat tristique vulputate. A et odio varius et viverra dis risus";
String kDummyBanglaText =
    "জীবন থেকে পাওয়া শিক্ষা ও অভিজ্ঞতা প্রত্যেক ব্যক্তির কাছে ভিন্ন ও নতুন আর জীবন থেকে পাওয়া এই বিবিধ অভিজ্ঞতার মাধ্যমেই আমরা জ্ঞান লাভ করি, আমাদের দিগন্তকে প্রসারিত করি এবং আমাদের অস্তিত্বের প্রকৃত অর্থ আবিষ্কার করি। আজকে আমরা আমাদের প্রতিবেদনে পরিবেশন করতে চলেছি জীবন নিয়ে কিছু বিখ্যাত ও প্রাসঙ্গিক উক্তি, ক্যাপশন, স্ট্যাটাস যা আপনাদের জীবনের প্রতিটি পদক্ষেপে অনুপ্রাণিত করবে।";
String kDummyNotice =
    '২০২৩ - ২-২৪ শিক্ষাবর্ষের একাদশ শ্রেণিতে ভর্তির জন্য নির্বাচিত ছাত্রছাত্রীদের ভর্তির নির্দেশনামূলক বিজ্ঞপ্তি';
Logger kLogger = Logger();
// Globel context
BuildContext kGlobContext = Get.context!;

// calander dialog
const String kNormal = "normal";
const String kCustom = "custom";

// Key
const String kSiteListModel = "siteListModel";
const String kToken = 'token';
const String kUserType = 'userType';
const String kAcademicGroup = 'academicGroup';
const String kApi_access_key = 'api_access_key';
const String student = "student";
const String teacher = "teacher";

//appStrings
const String kAppName = 'Edu World App';
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
const String tLauncherSlide1title = 'As a employee';
const String tLauncherSlide1Subtitle =
    'Multiple Login Facility for Convinence of multiple users';
const List<String> tLauncherSlide1SubtitleList = [
  'Attendance monitoring',
  'Online fee payment record',
  'Exam & result maintaining and many more'
];
const String tLauncherSlide2Title = 'Multiple Logins';
const String tLauncherSlide2SubTitle = 'Easy Notice Exchange between Parties';
const List<String> tLauncherSlide2SubTitleList = [
  'Different types of user can easily access',
  'Easy to use, fast and easy access'
];
const String tLauncherSlide3Title = 'As a student';
const String tLauncherSlide3SubTitle =
    'Assigning and Viewing are just a Tap away';
const List<String> tLauncherSlide3SubTitleList = [
  'All updated information as per last announcement',
  'View latest attendance info',
  'View informations including daily routine, notices, exam results and much more'
];
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
const String tAboutUs = "About Us";
const String tContactUs = "Contact Us";
const String tAcademicCal = "Academic Calander";
const String tHoliday = "Holiday";
const String tEvent = "Event";
const String tExamination = "Examination";
const String tSeeMore = "See More";
const String tReadMore = "Read More";
const String tSeeAll = "See All";
const String tDots3 = "...";

const String kAppDateFormat = "dd/MM/yyyy";

/// 24 hours AM/PM
// const String kAppDateWithTimeFormat = "dd-MM-yyyy kk:mm:a";
/// 12 hours AM/PM
const String kAppDateFormatWithTime12 = "dd-MM-yyyy h:mm a";
const String kAppTimeFormat12 = "h:mm a";
const String kAppDateFormatWithDayMonth = "d MMM";

const String kApiDateFormat = "yyyy-MM-dd";

///**Bottom Navigation bar */

kLog(Object value) {
  if (kDebugMode) {
    print(value.toString());
  }
}
