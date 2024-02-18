import 'package:get/get.dart';
import 'package:school_management_system/Api/STUDENT/helpdesk/stu_helpdesk_api.dart';
import 'package:school_management_system/Api/TEACHER/helpdesk_api.dart';
import 'package:school_management_system/Model/PUBLIC/login/academic_group_model.dart';
import 'package:school_management_system/Model/STUDENT/helpdesk/stu_helpdesk_model.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:school_management_system/Singletones/app_data.dart';
import 'package:school_management_system/Utils/api%20structure/payloads.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../Api/STUDENT/profile/stu_profile_api.dart';
import '../../../Config/config.dart';
import '../../../Model/PUBLIC/searchSchool/site_list_model.dart';
import '../../../Utils/utils.dart';

class TeachHelpDeskController extends GetxController {
  static TeachHelpDeskController get to => Get.find();

  /// variable declaration
  var token = "".obs;
  var siteListModel = SitelistModel().obs;
  var stuHelpdeskModelList = <HelpDeskModel>[].obs;
  var clickedEduSiteHelpDeskSetting = EduSiteHelpDeskSetting().obs;
  var youtubePlayerController = YoutubePlayerController(initialVideoId: "").obs;
  var currentGroupModel = AcademicGroup();

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
  void dispose() {
    youtubePlayerController.value.dispose();
    super.dispose();
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
    currentGroupModel = await AppLocalDataFactory.mGetAcademicGroupModel();
  }

  _mGetProfileInfo() async {
    // kLog("api key: ${AppData.api_access_key}   token: ${token.value}");
    stuHelpdeskModelList.value =
        await TeachHelpdeskApi.mGeTeachHelpDeskModelList(
            PayLoads.teachHelpDesk(
                api_access_key: AppData.api_access_key,
                academic_group_id: currentGroupModel.id.toString()),
            token.value);
    // kLog("stuHelpdeskModelList Length: ${stuHelpdeskModelList.length}");
  }

  void _mInitializeYtbPlayerController() {
    if (clickedEduSiteHelpDeskSetting.value.videoLink != null) {
      youtubePlayerController.value = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(
            clickedEduSiteHelpDeskSetting.value.videoLink!)!,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );
    } else {
      showError("No Video file");
    }
  }
}
