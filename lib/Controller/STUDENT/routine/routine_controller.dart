import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:school_management_system/Api/STUDENT/routine/routine_api.dart';

import '../../../Api/STUDENT/result/result_api.dart';
import '../../../Config/config.dart';
import '../../../Model/STUDENT/routine/period_type_model.dart';
import '../../../Singletones/app_data.dart';
import '../../../Utils/api structure/payloads.dart';
import '../../../Utils/utils.dart';

class StuRoutineController extends GetxController {
  static StuRoutineController get to => Get.find();

  var periodicTypeList = <PeriodicTypeModel>[].obs;
  var selectedPeriodicTypeModel = Rxn(PeriodicTypeModel());

  RxString token = "".obs;
  // RxString pageOrientation = PageOrientation.portrait.obs;
  Rx<String> pdfFilePath = "".obs;
  late Rx<PDFViewController> pdfController;
  RxBool isRoutineFound = true.obs;

  /// variable declaration

  @override
  void onInit() async {
    super.onInit();
    token.value = await AppLocalDataFactory.mGetToken();
    await mGetPeriodicTypeList();

    await mGetRoutinePdf();
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
    mResetPdfFilePath();
    Uint8List? response = await RoutineApis.mGetRoutinePdf(
        PayLoads.stuRoutinePdf(
          api_access_key: AppData.api_access_key,
          academic_period_type_id:
              selectedPeriodicTypeModel.value!.id.toString(),
        ),
        token.value);

    if (response != null) {
      kLog("Response not null: $response");
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
      /*    await file.writeAsBytes(response);
      pdfFilePath.value = filePath; */

      try {
        if (await Permission.storage.request().isGranted) {
          kLog('permission granted');

          await file.writeAsBytes(response);
          pdfFilePath.value = filePath;

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
      }
      // kLog(pdfPath);
    } else {
      kLog("Response Null");
      isRoutineFound.value = false;
    }
  }

  mDownload() async {
    showLoading("Downloading...");

    Uint8List? response = await RoutineApis.mGetRoutinePdf(
        PayLoads.stuRoutine(
          api_access_key: AppData.api_access_key,
          academic_period_type_id:
              selectedPeriodicTypeModel.value!.id.toString(),
        ),
        token.value);

    if (response != null) {
      kLog("Response not null: $response");
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
          "${downloadDirectory.path}/${selectedPeriodicTypeModel.value!.typeName} Routine.pdf";

      File file = File(filePath);
      /*    await file.writeAsBytes(response);
      pdfFilePath.value = filePath; */

      try {
        if (await Permission.storage.request().isGranted) {
          kLog('permission granted');

          await file.writeAsBytes(response);
          // pdfFilePath.value = filePath;

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
      }
      // kLog(pdfPath);
    } else {
      kLog("Response Null");
      isRoutineFound.value = false;
    }

    /* 
    Directory downloadDirectory;

    if (Platform.isIOS) {
      downloadDirectory = await getApplicationDocumentsDirectory();
    } else {
      downloadDirectory = Directory('/storage/emulated/0/Download');
      if (!await downloadDirectory.exists())
        downloadDirectory = (await getExternalStorageDirectory())!;
    }

    String filePathName =
        "${downloadDirectory.path}/${selectedExamModel.value.examinationName}";
    File savedFile = File(filePathName);
    bool fileExists = await savedFile.exists();

    if (fileExists) {
      ScaffoldMessenger.of(kGlobContext).showSnackBar(const SnackBar(
          content:
              Text("File already downloaded: /storage/emulated/0/Download")));
    } else {
      try {
        if (await Permission.storage.request().isGranted) {
          await savedFile.writeAsBytes(response);
          pdfFilePath.value = file.path;
          kLog('permission granted');

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
      }
    }
  */
  }

  void mUpdateSelectedPeriodicType(PeriodicTypeModel? selectedModel) {
    selectedPeriodicTypeModel.value = selectedModel;
  }

  void mResetPdfFilePath() {
    pdfFilePath.value = '';
    if (pdfFilePath.value.isEmpty) {
      kLog("Empty");
    } else {
      kLog("Not Empty");
    }
  }
}
