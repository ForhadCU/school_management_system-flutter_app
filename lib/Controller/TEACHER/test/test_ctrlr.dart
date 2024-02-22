import 'package:get/get.dart';

class TeachTestCtrlr extends GetxController {
  static TeachTestCtrlr get to => Get.find();

  var textValue = 'TextFromGlobal'.obs;

  @override
  void onInit() {
    super.onInit();
    textValue.value = "TextFromInit";
  }

  /*   mGetAcademicGroupModel() async {
    await AppLocalDataFactory.mGetAcademicGroupModel()
        .then((value) => academicGroupId.value = value.id.toString());
    kLog(academicGroupId.value);
  }

  mGetToken() async {
    token.value = await AppLocalDataFactory.mGetToken();
  }

  mGetVersionYearShiftModel() async {
    await mGetToken();
    await mGetAcademicGroupModel();
    kLog("Goupt id from common ctrlr: ${academicGroupId.value}");
    academicYearList.clear();
    await CommonApis.mGetVersionYearShiftModel(
            PayLoads.academic_version_year_shift_list(
                api_access_key: AppData.api_access_key,
                academic_group_id: academicGroupId.value),
            token.value)
        .then((value) {
      if (value.academicYearList != null &&
          value.academicShiftList != null &&
          value.academicYearList!.isNotEmpty &&
          value.academicShiftList!.isNotEmpty) {
        academicYearList.value = value.academicYearList!;
        // academicYearList.addAll(value.academicYearList!);
        academicShiftList.value = value.academicShiftList!;
        selectedAcademicYear.value = value.academicYearList!.first;
        selectedAcademicShift.value = value.academicShiftList!.first;
        selectedAcademicVersion.value = value.academicVersionlist!.first;
      } else {
        canContinue.value = false;
      }
    });
    // return academicYearList;

    kLog("AcademicYearList: ${academicYearList.length}");

  } */
}
