import 'package:get/get.dart';
import 'package:school_management_system/Api/STUDENT/calendar/stu_calendar_api.dart';
import 'package:school_management_system/Model/STUDENT/calendar/stu_calendar_model.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../../Model/PUBLIC/searchSchool/site_list_model.dart';
import '../../../Model/STUDENT/calendar/stu_acdemic_grp_model.dart';
import '../../../Singletones/app_data.dart';
import '../../../Utils/api structure/payloads.dart';

class StuCalendarController extends GetxController {
  static StuCalendarController get to => Get.find();

  var toDay = DateTime.now().obs;
  var lastDay = DateTime.now().add(
    const Duration(
      days: 364,
    ),
  );
  var firstDay = DateTime.now().subtract(Duration(days: 364));
  // var colorableDateList = [].obs;
  // Rx<DateTime?> selectedDay = Rx<DateTime?>(null);
  var eventDateListModelList = <List<StuEventDateList>>[].obs;
  var academicGroupModeList = <StuAcademicGroupModel>[].obs;
  var siteListModel = SitelistModel().obs;
  var token = "".obs;
  var selectedAcademicGroupModel = StuAcademicGroupModel().obs;
  var currentPageIndex = 0.obs;

  var academicGrpDropdownValue = StuAcademicGroupModel().obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await _mInitialization();
    // await mGetAcademicGroupList();
    await mGetEventDateList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  _mInitialization() async {
    siteListModel.value = await AppLocalDataFactory.mGetSiteListModel();
    token.value = await AppLocalDataFactory.mGetToken();
    print("site id: ${siteListModel.value.id}");
  }

  /*  mGetAcademicGroupList() async {
    academicGroupModeList.value = await StuCalendarApis.mGetAcademicGroupList(
        PayLoads.stuAcademicGroupList(
            api_access_key: AppData.api_access_key,
            site_id: siteListModel.value.id.toString()),
        token.value);
    academicGroupModeList.isNotEmpty
        ? {
            selectedAcademicGroupModel.value = academicGroupModeList.first,
            academicGrpDropdownValue.value = selectedAcademicGroupModel.value,
            await mGetEventDateList()
          }
        : null;
  }

  mUpdateAcademicGroupSelection(StuAcademicGroupModel model) async {
    selectedAcademicGroupModel.value = model;
    academicGrpDropdownValue.value = selectedAcademicGroupModel.value;
    await mGetEventDateList();
  }
 */
  mGetEventDateList() async {
    eventDateListModelList.value = await StuCalendarApis.mGetEventDateList(
      PayLoads.stuCalendarList(
          api_access_key: AppData.api_access_key,
          monthIncrement: currentPageIndex.value.toString()),
      token.value,
    );

    /* for (var element in eventDateListModel) {
      print(element.first.startDate);
    } */
  }

  /// code goes here
}
