import 'dart:io';
import 'dart:typed_data';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:school_management_system/Api/TEACHER/routine_api.dart';
import 'package:school_management_system/Model/TEACHER/version_year_shift_model.dart';

import '../../../Api/STUDENT/routine/routine_api.dart';
import '../../../Config/config.dart';
import '../../../Model/STUDENT/routine/period_type_model.dart';
import '../../../Singletones/app_data.dart';
import '../../../Utils/api structure/payloads.dart';
import '../../../Utils/local_notification.dart';
import '../../../Utils/utils.dart';
import '../../common/common_controller.dart';

class TeachRoutineController extends GetxController {
  static TeachRoutineController get to => Get.find();
  late final CommonController _commonController = CommonController.to;

  var periodicTypeList = <PeriodicTypeModel>[].obs;
  var selectedPeriodicTypeModel = Rxn(PeriodicTypeModel());

  // RxString pageOrientation = PageOrientation.portrait.obs;
  Rx<String> pdfFilePath = "".obs;
  late Rx<PDFViewController> pdfController;
  RxBool isRoutineFound = false.obs;
  var academicGroupId = ''.obs;
  var token = ''.obs;
  var isInitial = true.obs;
  var isLoading = true.obs;
  Uint8List? routineResponse;

  /// variable declaration

  @override
  void onInit() async {
    super.onInit();
    showLoading("Please wait");
    await mGetToken();
    await mGetAcademicGroupModel();
    await _mGetInitialDataForDropdowns();
    await mGetRoutinePdf();
    isLoading.value = false;
    mListenNotification();
  }

  @override
  void onClose() {
    super.onClose();
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

  mGetAcademicGroupModel() async {
    await AppLocalDataFactory.mGetAcademicGroupModel()
        .then((value) => academicGroupId.value = value.id.toString());
    kLog(academicGroupId.value);
  }

  mGetToken() async {
    token.value = await AppLocalDataFactory.mGetToken();
  }

  _mGetInitialDataForDropdowns() async {
    await mGetPeriodicTypeList();
    await _commonController.mGetVersionYearShiftModel();
  }

  mGetPeriodicTypeList() async {
    periodicTypeList.value = await TeachRoutineApis.mGetPeriodicTypeList(
        PayLoads.teachPeriodType(
          api_access_key: AppData.api_access_key,
          academic_group_id: academicGroupId.value,
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
    routineResponse = await TeachRoutineApis.mGetRoutinePdf(
        PayLoads.teachRoutinePdf(
          api_access_key: AppData.api_access_key,
          academic_period_type_id:
              selectedPeriodicTypeModel.value!.id.toString(),
          academic_group_id: academicGroupId.value,
          academic_year_id:
              _commonController.selectedAcademicYear.value.id.toString(),
        ),
        token.value);

    if (routineResponse != null) {
      kLog("Response not null: $routineResponse");
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
      */

      try {
        if (await Permission.storage.request().isGranted) {
          kLog('permission granted');
          await file.writeAsBytes(routineResponse!);
          isLoading.value = false;
          // localPathOfDemandSlip.value = file.path;
          // await showNotification();
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
        if (Platform.isAndroid) {
          final androidInfo = await DeviceInfoPlugin().androidInfo;

          // kLogger.d(androidInfo.version.sdkInt);
          if (androidInfo.version.sdkInt <= 32) {
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
          } else {
            if (await Permission.photos.request().isGranted &&
                await Permission.notification.request().isGranted) {
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
                Permission.photos,
                Permission.notification,
              ].request();
              kLog(statuses[Permission.photos].toString());
              await Permission.photos.request();
              await Permission.notification.request();
              kLog('request permission');
            }
          }
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

  void mUpdateSelectedAcademicYear(AcademicYear? selectedModel) async {
    // await _commonController.mUpdateSelectedAcademicYear(selectedModel);
    if (_commonController.selectedAcademicYear.value != selectedModel) {
      _commonController.selectedAcademicYear.value = selectedModel!;
    }
  }
}
