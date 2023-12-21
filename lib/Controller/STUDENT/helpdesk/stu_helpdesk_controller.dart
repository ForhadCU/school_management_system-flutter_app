import 'package:get/get.dart';
import 'package:school_management_system/Api/STUDENT/helpdesk/stu_helpdesk_api.dart';
import 'package:school_management_system/Model/STUDENT/helpdesk/stu_helpdesk_model.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../Api/STUDENT/profile/stu_profile_api.dart';
import '../../../Config/config.dart';
import '../../../Model/PUBLIC/searchSchool/site_list_model.dart';
import '../../../Utils/utils.dart';

class HelpDeskController extends GetxController {
  static HelpDeskController get to => Get.find();

  /// variable declaration
  var token = "".obs;
  var siteListModel = SitelistModel().obs;
  var stuHelpdeskModelList = <StuHelpDeskModel>[].obs;
  var clickedEduSiteHelpDeskSetting = EduSiteHelpDeskSetting().obs;
  late Rx<YoutubePlayerController> youtubePlayerController;

  @override
  void onInit() async {
    super.onInit();
    await _mInitialization();
    await _mGetProfileInfo();
    /* youtubePlayerController = YoutubePlayerController(
      initialVideoId: '',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    ).obs; */
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// code goes here
  mTappedOnHelpDeskItem(EduSiteHelpDeskSetting eduSiteHelpDeskSetting) {
    clickedEduSiteHelpDeskSetting.value = eduSiteHelpDeskSetting;
    _mInitializeYtbPlayerController();
    Get.toNamed(AppRoutes.helpdeskDetails);
  }

  _mInitialization() async {
    token.value = await AppLocalDataFactory.mGetToken();
    siteListModel.value = await AppLocalDataFactory.mGetSiteListModel();
  }

  _mGetProfileInfo() async {
    stuHelpdeskModelList.value =
        await HelpdeskApi.mGetStuHelpDeskModelList({}, token.value);
    kLog("stuHelpdeskModelList Length: ${stuHelpdeskModelList.length}");
  }

  void _mInitializeYtbPlayerController() {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          clickedEduSiteHelpDeskSetting.value.videoLink ?? "")!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    ).obs;
  }
}
