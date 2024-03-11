import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:school_management_system/Api/STUDENT/routine/routine_api.dart';

import '../../../Api/STUDENT/result/result_api.dart';
import '../../../Config/config.dart';
import '../../../Model/STUDENT/routine/period_type_model.dart';
import '../../../Singletones/app_data.dart';
import '../../../Utils/api structure/payloads.dart';
import '../../../Utils/local_notification.dart';
import '../../../Utils/utils.dart';

class StuRoutineController extends GetxController {
  static StuRoutineController get to => Get.find();

  var periodicTypeList = <PeriodicTypeModel>[].obs;
  var selectedPeriodicTypeModel = Rxn(PeriodicTypeModel());

  RxString token = "".obs;
  // RxString pageOrientation = PageOrientation.portrait.obs;
  Rx<String> pdfFilePath = "".obs;
  late Rx<PDFViewController> pdfController;
  RxBool isRoutineFound = false.obs;
  var isInitial = true.obs;
  var isLoading = true.obs;
  Uint8List? routineResponse;

  /// variable declaration

  @override
  void onInit() async {
    super.onInit();
    showLoading("Please wait");
    token.value = await AppLocalDataFactory.mGetToken();
    await mGetPeriodicTypeList();
    await mGetRoutinePdf();
    isLoading.value = false;
    mListenNotification();
  }

  ////listen Notification when click////
  void mListenNotification() {
    LocalNotification()
        .onClickNotificationBehavior
        .stream
        .listen((event) async {
      // localPathOfDemandSlip.value = event;
      kLog("Notification Clicekd");
      // kLog("Path: ${localPathOfDemandSlip.value}");
/* 
      if (localPathOfDemandSlip.value != "") {
        // Open PDF file
        await OpenFilex.open(localPathOfDemandSlip.value);
        kLog(localPathOfDemandSlip.value);
      }  */
      kLog("Event: $event");
      if (event != "" && !isInitial.value) {
        // Open PDF file
        await OpenFilex.open(event);
        print("PDF file found.");

        // kLog(localPathOfDemandSlip.value);
      } else {
        print("PDF file not found.");
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  mChangeResultTypeDropdownValue(PeriodicTypeModel value) {
    selectedPeriodicTypeModel.value = value;
  }

  mGetPeriodicTypeList() async {
    periodicTypeList.value = await RoutineApis.mGetPeriodicTypeList(
        PayLoads.stuPeriodicType(
          api_access_key: AppData.api_access_key,
        ),
        token.value);
    if (periodicTypeList.isNotEmpty) {
      selectedPeriodicTypeModel.value = periodicTypeList.first;
    } else {
      kLog("periodicTypeList is empty");
    }
  }

  /// code goes here
  mGetRoutinePdf() async {
    // isLoading.value = true;
    routineResponse = await RoutineApis.mGetRoutinePdf(
        PayLoads.stuRoutinePdf(
          api_access_key: AppData.api_access_key,
          academic_period_type_id:
              selectedPeriodicTypeModel.value!.id.toString(),
        ),
        token.value);
    // isLoading.value = false;

    if (routineResponse != null) {
      isRoutineFound.value = true;
      // kLog("Response not null: $response");
      var dir = await getApplicationDocumentsDirectory();
      var filePath =
          "${dir.path}/${selectedPeriodicTypeModel.value!.typeName} ${selectedPeriodicTypeModel.value!.id}.pdf";

      /*  Directory downloadDirectory;
      if (Platform.isIOS) {
        downloadDirectory = await getApplicationDocumentsDirectory();
      } else {
        downloadDirectory = Directory('/storage/emulated/0/Download');
        if (!await downloadDirectory.exists()) {
          downloadDirectory = (await getExternalStorageDirectory())!;
        }
      }
      final filePath =
          "${downloadDirectory.path}/${selectedExamModel.value.examinationName}.pdf"; */

      File file = File(filePath);
      pdfFilePath.value = filePath;
      isRoutineFound.value = true;
      /*    await file.writeAsBytes(response);
      pdfFilePath.value = filePath; */

      try {
        if (await Permission.storage.request().isGranted) {
          kLog('permission granted');

          await file.writeAsBytes(routineResponse!);
          isLoading.value = false;

          /* pdfPath.set(file.path);
            showBottomSheet(context!, invoiceRef, pdfPath.value); */
        } else {
          Map<Permission, PermissionStatus> statuses = await [
            Permission.storage,
          ].request();
          kLog(statuses[Permission.storage].toString());
          await Permission.storage.request();
          kLog('request permission');
        }
      } catch (error) {
        kLog(error);
        isLoading.value = false;
        isRoutineFound.value = false;
      }
      // kLog(pdfPath);
    } else {
      kLog("Response Null");
      isRoutineFound.value = false;
      isLoading.value = false;
    }
  }

  mDownload() async {
    showLoading("Downloading...");

    if (routineResponse != null) {
      kLog("Response not null: $routineResponse");
/*       var dir = await getApplicationDocumentsDirectory();
      var filePath =
          "${dir.path}/${selectedExamModel.value.examinationName} ${selectedStudentHistory.value.studentRollNumber} (Landscape).pdf";
 */
      Directory downloadDirectory;
      if (Platform.isIOS) {
        downloadDirectory = await getApplicationDocumentsDirectory();
      } else {
        downloadDirectory = Directory('/storage/emulated/0/Download');
        if (!await downloadDirectory.exists()) {
          downloadDirectory = (await getExternalStorageDirectory())!;
        }
      }
      final filePath =
          "${downloadDirectory.path}/${selectedPeriodicTypeModel.value!.typeName} Routine ${DateTime.now().millisecond}.pdf";

      File file = File(filePath);
      /*    await file.writeAsBytes(response);
      pdfFilePath.value = filePath; */

      try {
        if (await Permission.storage.request().isGranted) {
          kLog('permission granted');

          await file.writeAsBytes(routineResponse!);
          // pdfFilePath.value = filePath;

          /* pdfPath.set(file.path);
            showBottomSheet(context!, invoiceRef, pdfPath.value); */
          isInitial.value = false;

          await LocalNotification().mShowNotification(payload: file.path);
          showSuccess("Downloaded");
        } else {
          Map<Permission, PermissionStatus> statuses = await [
            Permission.storage,
          ].request();
          kLog(statuses[Permission.storage].toString());
          await Permission.storage.request();
          kLog('request permission');
        }
      } catch (error) {
        kLog(error);
      }
      // kLog(pdfPath);
    } else {
      kLog("Response Null");
      hideLoading();
      // isRoutineFound.value = false;
    }

  }

  void mUpdateSelectedPeriodicType(PeriodicTypeModel? selectedModel) {
    if (selectedPeriodicTypeModel.value != selectedModel) {
    /*   isLoading.value = true;
      isRoutineFound.value = true; */
      selectedPeriodicTypeModel.value = selectedModel;
    }
  }
}
