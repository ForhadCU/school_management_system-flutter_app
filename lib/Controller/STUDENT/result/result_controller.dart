import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:school_management_system/Api/STUDENT/result/result_api.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Model/STUDENT/result/history_model.dart';
import 'package:school_management_system/Model/STUDENT/result/result_type_model.dart';
import 'package:school_management_system/Singletones/app_data.dart';
import 'package:school_management_system/Utils/api%20structure/payloads.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:path/path.dart' as path;

import '../../../Model/STUDENT/exam/exam_model.dart';

class StuResultController extends GetxController {
  static StuResultController get to => Get.find();

  /// variable declaration
  RxList<StuResultTypeModel> stuResultModelList = <StuResultTypeModel>[].obs;
/*   RxList<StuResultDetailsModel> stuResultDetailsModel =
      <StuResultDetailsModel>[].obs; */
  RxList<StuHistoryModel> stuHistoryList = <StuHistoryModel>[].obs;
  Rx<StuHistoryModel> selectedStudentHistory = StuHistoryModel().obs;
  Rx<StuResultTypeModel> selectedResultModel = StuResultTypeModel().obs;
  RxString token = "".obs;
  // RxString pageOrientation = PageOrientation.portrait.obs;
  Rx<String> pdfFilePath = "".obs;
  late Rx<PDFViewController> pdfController;
  RxBool isResultFound = true.obs;

  @override
  void onInit() async {
    super.onInit();
    token.value = await AppLocalDataFactory.mGetToken();
    await mGetStudentHistoryList();
    await mGetResultTypeList();
    await mGetResultPdf();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// code goes here
  mChangeClassDropdownValue(StuHistoryModel value) {
    selectedStudentHistory.value = value;
  }

  mChangeResultTypeDropdownValue(StuResultTypeModel value) {
    selectedResultModel.value = value;
  }

  mGetStudentHistoryList() async {
    stuHistoryList.value = await ResultApis.mGetStudentHistoryList(
        PayLoads.stuHistoryList(api_access_key: AppData.api_access_key),
        token.value);
    if (stuHistoryList.isNotEmpty) {
      selectedStudentHistory.value = stuHistoryList.first;
    } else {
      kLog("stuHistoryList is empty");
    }
  }

  mGetResultTypeList() async {
    stuResultModelList.value = await ResultApis.mGetResultTypeList(
        PayLoads.stuPrimaryResultList(
            api_access_key: AppData.api_access_key,
            student_history_id: selectedStudentHistory.value.id.toString()),
        token.value);
    if (stuResultModelList.isNotEmpty) {
      selectedResultModel.value = stuResultModelList.first;
    } else {
      kLog("stuResultTypeModelList is empty");
    }
  }

  mGetResultPdf() async {
    Uint8List? response = await ResultApis.mGetResultPdf(
        PayLoads.stuPrimaryResultDetailsPdf(
            api_access_key: AppData.api_access_key,
            // student_history_id: selectedStudentHistory.value.id.toString(),
            student_history_id: 39851.toString(),
            academic_result_primary_type_id:
                // selectedExamModel.value.id.toString(),
                20.toString(),
            page_orientaion: PageOrientation.portrait),
        token.value);

    if (response != null) {
      kLog("Response not null: $response");
      var dir = await getApplicationDocumentsDirectory();
      var filePath =
          "${dir.path}/${selectedResultModel.value.name} ${selectedStudentHistory.value.studentRollNumber}.pdf";

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
      isResultFound.value = false;
    }
  }

  mDownloadPortraitResult() async {
    showLoading("Downloading...");

    Uint8List? response = await ResultApis.mGetResultPdf(
        PayLoads.stuPrimaryResultDetailsPdf(
            api_access_key: AppData.api_access_key,
            student_history_id: selectedStudentHistory.value.id.toString(),
            // student_history_id: 39851.toString(),
            academic_result_primary_type_id:
                selectedResultModel.value.id.toString(),
            // 20.toString(),
            page_orientaion: PageOrientation.portrait),
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
          "${downloadDirectory.path}/${selectedResultModel.value.name} ${selectedStudentHistory.value.studentRollNumber} (Potrait).pdf";

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
      isResultFound.value = false;
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

  mDownloadLandscapeResult() async {
    Uint8List? response = await ResultApis.mGetResultPdf(
        PayLoads.stuPrimaryResultDetailsPdf(
            api_access_key: AppData.api_access_key,
            // student_history_id: selectedStudentHistory.value.id.toString(),
            student_history_id: 39851.toString(),
            academic_result_primary_type_id:
                // selectedExamModel.value.id.toString(),
                20.toString(),
            page_orientaion: PageOrientation.landscape),
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
          "${downloadDirectory.path}/${selectedResultModel.value.name} ${selectedStudentHistory.value.studentRollNumber} (Landscape).pdf";

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
      isResultFound.value = false;
    }
  }

  void mUpdateSelectedStuExam(StuResultTypeModel? selectedModel) {
    selectedResultModel.value = selectedModel!;
  }

  void mUpdateSelectedStuHistory(StuHistoryModel? selectedModel) {
    selectedStudentHistory.value = selectedModel!;
  }
}
