import 'package:get/get.dart';
import 'package:school_management_system/Api/PUBLIC/academic_calendar_api.dart';
import 'package:school_management_system/Model/PUBLIC/academicCalendar/academic_grp_api_model.dart';
import 'package:school_management_system/Model/PUBLIC/academicCalendar/monthwise_event_cal_api_model.dart';
import 'package:school_management_system/Model/PUBLIC/searchSchool/site_list_model.dart';
import 'package:school_management_system/Singletones/app_data.dart';
import 'package:school_management_system/Utils/api%20structure/payloads.dart';

import 'landing_controller.dart';

class AcademicCalendarController extends GetxController {
  static AcademicCalendarController get to => Get.find();

  var focusDay = DateTime.now().obs;
  var lastDay = DateTime.now().add(
    const Duration(
      days: 364,
    ),
  );
  var firstDay = DateTime.now().subtract(Duration(days: 364));
  // var colorableDateList = [].obs;
  // Rx<DateTime?> selectedDay = Rx<DateTime?>(null);
  var eventDateListModelList = <List<EventDateList>>[].obs;
  var academicGroupModeList = <AcademicGroupModel>[].obs;
  var siteListModel = SitelistModel().obs;
  var selectedAcademicGroupModel = AcademicGroupModel().obs;
  var currentPageIndex = 0.obs;

  var academicGrpDropdownValue = AcademicGroupModel().obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    _mInitialization();
    await mGetAcademicGroupList();
  }

  void _mInitialization() {
    siteListModel.value = LandingController.to.siteListModel.value;
    print("site id: ${siteListModel.value.id}");
  }

  mGetAcademicGroupList() async {
    academicGroupModeList.value =
        await AcademicCalendarApi.mGetAcademicGroupList(
            PayLoads.academicGroupList(
                api_access_key: AppData.api_access_key,
                site_id: siteListModel.value.id.toString()));
    academicGroupModeList.isNotEmpty
        ? {
            selectedAcademicGroupModel.value = academicGroupModeList.first,
            academicGrpDropdownValue.value =
                selectedAcademicGroupModel.value,
            await mGetEventDateList()
          }
        : null;
  }

  mUpdateAcademicGroupSelection(AcademicGroupModel model) async {
    selectedAcademicGroupModel.value = model;
    academicGrpDropdownValue.value =
        selectedAcademicGroupModel.value;
    await mGetEventDateList();
  }

  mGetEventDateList() async {
    eventDateListModelList.value = await AcademicCalendarApi.mGetEventDateList(
        PayLoads.monthWiseCalendarList(
            api_access_key: AppData.api_access_key,
            site_id: siteListModel.value.id.toString(),
            academic_group_id: selectedAcademicGroupModel.value.id.toString(),
            monthIncrement: currentPageIndex.value.toString()));

    /* for (var element in eventDateListModel) {
      print(element.first.startDate);
    } */
  }
}
