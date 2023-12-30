import 'package:get/get.dart';
import 'package:school_management_system/Api/STUDENT/subjects/subjects_api.dart';
import 'package:school_management_system/Model/STUDENT/subjects/subject_model.dart';
import 'package:school_management_system/Singletones/app_data.dart';
import 'package:school_management_system/Utils/api%20structure/payloads.dart';
import 'package:school_management_system/Utils/utils.dart';

class StuSubjectsController extends GetxController {
  static StuSubjectsController get to => Get.find();

  /// variable declaration
  RxString token = "".obs;
  RxList<StuSubjectModel> stuSubjectList = <StuSubjectModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    token.value = await AppLocalDataFactory.mGetToken();
    await mGetSubjectList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// code goes here
  mGetSubjectList() async {
    stuSubjectList.value = await StuSubjectsApis.mGetSubjectList(
        PayLoads.mStuSubjectList(api_access_key: AppData.api_access_key),
        token.value);
  }
}
