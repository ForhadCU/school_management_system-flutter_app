import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:school_management_system/Api/STUDENT/exam/exam_api.dart';
import 'package:school_management_system/Model/STUDENT/exam/exam_model.dart';

import '../../../Api/STUDENT/result/result_api.dart';
import '../../../Config/config.dart';
import '../../../Model/STUDENT/result/history_model.dart';
import '../../../Singletones/app_data.dart';
import '../../../Utils/api structure/payloads.dart';
import '../../../Utils/custom_statusbar.dart';
import '../../../Utils/utils.dart';

class StuExamController extends GetxController {
  var isFoundDocuments = false.obs;
  var isFoundRoutinePdf = false.obs;
  var isFoundAdmitCardPdf = false.obs;
  var documentList = <String>[].obs;

  static StuExamController get to => Get.find();

  /// variable declaration
  RxList<StuExamTypeModel> stuExamTypeList = <StuExamTypeModel>[].obs;
  RxList<StuHistoryModel> stuHistoryList = <StuHistoryModel>[].obs;
  Rx<StuHistoryModel> selectedStudentHistory = StuHistoryModel().obs;
  Rx<StuExamTypeModel> selectedExamTypeModel = StuExamTypeModel().obs;
  RxString token = "".obs;
  var routinePdfResponse = Rxn<Uint8List>().obs;
  var admitCardPdfResponse = Rxn<Uint8List>().obs;
  var isExamDetailsActive = true.obs;
  var isExamOnlineActive = false.obs;

  @override
  void onInit() async {
    super.onInit();
    // CustomStatusBar.mDarkStatusBar();

    token.value = await AppLocalDataFactory.mGetToken();
    await mGetStudentHistoryList();
    await mGetExamTypeList();
    await mGetExamRoutinePdf();
    await mGetExamAdmitCardPdf();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// code goes here
  mChangeClassDropdownValue(StuHistoryModel value) async {
    if (selectedStudentHistory.value != value) {
      mResetPreviousDocs();
      selectedStudentHistory.value = value;
      await mGetExamTypeList();
    }
  }

  void mUpdateExamDetailsTabItem() {
    isExamDetailsActive.value = true;
    isExamOnlineActive.value = false;
  }

  void mUpdateExamOnlineTabItem() {
    isExamDetailsActive.value = false;
    isExamOnlineActive.value = true;
  }

  mChangeExamTypeDropdownValue(StuExamTypeModel value) {
    if (selectedExamTypeModel.value != value) {
      mResetPreviousDocs();
      kLog(value.id!);
      selectedExamTypeModel.value = value;
    }
  }

  mGetStudentHistoryList() async {
    stuHistoryList.value = await ExamApis.mGetStudentHistoryList(
        PayLoads.stuHistoryList(api_access_key: AppData.api_access_key),
        token.value);
    if (stuHistoryList.isNotEmpty) {
      selectedStudentHistory.value = stuHistoryList.first;
    } else {
      kLog("stuHistoryList is empty");
    }
  }

  mGetExamTypeList() async {
    stuExamTypeList.value = await ExamApis.mGetExamTypeList(
        PayLoads.stuExamTypeList(
            api_access_key: AppData.api_access_key,
            student_history_id: selectedStudentHistory.value.id.toString()),
        token.value);
    if (stuExamTypeList.isNotEmpty) {
      selectedExamTypeModel.value = stuExamTypeList.first;
    } else {
      kLog("stuExamTypeList is empty");
    }
  }

  /// code goes here
  mGetExamRoutinePdf() async {
    routinePdfResponse.value.value = await ExamApis.mGetExamRoutinePdf(
        PayLoads.stuExamSubjectRoutineList(
          api_access_key: AppData.api_access_key,
          student_history_id: selectedStudentHistory.value.id.toString(),
          // student_history_id: 39851.toString(),
          examination_id: selectedExamTypeModel.value.id.toString(),
          // examination_id: 9.toString(),
        ),
        token.value);

    routinePdfResponse.value.value != null &&
            routinePdfResponse.value.value!.isNotEmpty
        ? {
            isFoundRoutinePdf.value = true,
            documentList.add("Examination Routine Pdf")
          }
        : false;
  }

  mGetExamAdmitCardPdf() async {
    admitCardPdfResponse.value.value = await ExamApis.mGetExamAdmitCardPdf(
        PayLoads.stuExamAdmitCard(
          api_access_key: AppData.api_access_key,
          student_history_id: selectedStudentHistory.value.id.toString(),
          // student_history_id: 39851.toString(),
          examination_id: selectedExamTypeModel.value.id.toString(),
          // examination_id: 9.toString(),
        ),
        token.value);

    admitCardPdfResponse.value.value != null &&
            admitCardPdfResponse.value.value!.isNotEmpty
        ? {
            isFoundAdmitCardPdf.value = true,
            documentList.add("Your Admit Card Pdf")
          }
        : false;
  }

  mDownloadRoutinePdf() async {
    if (routinePdfResponse.value.value != null) {
      /*  Directory downloadDirectory;
      if (Platform.isIOS) {
        downloadDirectory = await getApplicationDocumentsDirectory();
      } else {
        downloadDirectory = Directory('/storage/emulated/0/Download');
        if (!await downloadDirectory.exists()) {
          downloadDirectory = (await getExternalStorageDirectory())!;
        }
      } */
      Directory downloadDirectory;
      if (Platform.isIOS) {
        downloadDirectory = await getApplicationDocumentsDirectory();
      } else {
        downloadDirectory = Directory('/storage/emulated/0/Download');
        if (!await downloadDirectory.exists()) {
          downloadDirectory = (await getExternalStorageDirectory())!;
        } else {
          kLog("Download Dir already existed");
        }
      }

      final filePath =
          "${downloadDirectory.path}/${selectedExamTypeModel.value.examinationName} Routine.pdf";

      File file = File(filePath);

      try {
        if (await Permission.storage.request().isGranted) {
          kLog('permission granted');
          showLoading("Downloading...");
          await file.writeAsBytes(routinePdfResponse.value.value!);
          showSuccess("Downloaded");
        } else {
          Map<Permission, PermissionStatus> statuses = await [
            Permission.storage,
          ].request();
          kLog(statuses[Permission.storage].toString());
          // showLoading("Downloading...");

          await Permission.storage.request();
          kLog('request permission');
        }
      } catch (error) {
        kLog(error);
        showError("Download failed");
      }
      // kLog(pdfPath);
    } else {
      kLog("Response Null");
      showError("Not Found");
    }
  }

  mDownloadAdmitCardPdf() async {
    if (admitCardPdfResponse.value.value != null) {
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
          "${downloadDirectory.path}/${selectedExamTypeModel.value.examinationName} Admit card.pdf";

      File file = File(filePath);

      try {
        if (await Permission.storage.request().isGranted) {
          kLog('permission granted');
          showLoading("Downloading...");
          await file.writeAsBytes(admitCardPdfResponse.value.value!);
          showSuccess("Downloaded");
        } else {
          Map<Permission, PermissionStatus> statuses = await [
            Permission.storage,
          ].request();
          kLog(statuses[Permission.storage].toString());
          // showLoading("Downloading...");

          await Permission.storage.request();
          kLog('request permission');
        }
      } catch (error) {
        kLog(error);
        showError("Download failed");
      }
      // kLog(pdfPath);
    } else {
      kLog("Response Null");
      showError("Not Found");
    }
  }

  void mResetPreviousDocs() {
    documentList.clear();
    isFoundRoutinePdf.value = false;
    isFoundAdmitCardPdf.value = false;
  }
}
