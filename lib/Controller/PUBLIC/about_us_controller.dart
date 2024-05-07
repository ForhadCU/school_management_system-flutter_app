import 'package:get/get.dart';
import 'package:school_management_system/Api/PUBLIC/about_us_api.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/PUBLIC/landing_controller.dart';
import 'package:school_management_system/Model/PUBLIC/searchSchool/site_list_model.dart';
import 'package:school_management_system/Model/PUBLIC/siteHistory/about_us_api_model.dart';
import 'package:school_management_system/Singletones/app_data.dart';
import 'package:school_management_system/Utils/api%20structure/payloads.dart';
import 'package:school_management_system/Utils/utils.dart';

class AboutUsController extends GetxController {
  static AboutUsController get to => Get.find();
  var siteListModel = SitelistModel().obs;
  var aboutUsData = AboutUs().obs;
  var modifiedAboutUsDesc = "".obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    _mInitialization();
    await mGetSiteHistory();
  }

  void _mInitialization() {
    siteListModel.value = LandingController.to.siteListModel.value;
  }

  mGetSiteHistory() async {
    aboutUsData.value = await AboutUsApi.mGetAboutUsData(PayLoads.aboutUs(
        site_id: siteListModel.value.id.toString(),
        api_access_key: AppData.api_access_key));
    aboutUsData.value.description != null ? mModifyHtmlContent() : null;

/*     String originalString =
        '<p><img alt="" src="https://eduworld.eduworlderp.com/uploads/files/156/624bbf7760e85.jpg" style="width:100%" />';

    // Using regular expression to replace any percentage with "400"

    print(aboutUsData.value.description!);
    String newString =
        aboutUsData.value.description!.replaceAll(RegExp(r'\d+%'), '400');

    print(newString); */
  }

  mModifyHtmlContent() {
    modifiedAboutUsDesc.value = aboutUsData.value.description!.replaceAll(
        RegExp(r'\d+%'), AppScreenSize.mGetWidth(kGlobContext, 100).toString());
  }
}
