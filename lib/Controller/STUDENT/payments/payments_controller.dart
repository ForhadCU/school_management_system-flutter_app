import 'dart:io';
import 'dart:typed_data';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:school_management_system/Api/STUDENT/payments/payments_api.dart';
import 'package:school_management_system/Model/STUDENT/payments/fee_details.dart';
import 'package:school_management_system/Singletones/app_data.dart';
import 'package:school_management_system/Utils/api%20structure/payloads.dart';
import 'package:school_management_system/Utils/local_notification.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../../Config/config.dart';
import '../../../Utils/custom_utils.dart';

class StuPaymentsController extends GetxController {
  static StuPaymentsController get to => Get.find();

  /// variable declaration
  var isBkashBtnClicked = false.obs;
  var isNagadBtnClicked = false.obs;
  var isCellFinBtnClicked = false.obs;
  var isFeeDetails = false.obs;
  // var isFeeDetails = true.obs;
  var selectedPaymentMethod = "Academic Payment (by Transaction id)".obs;

  var isMakePaymentTabActive = true.obs;
  var isPaymentHistoryTabActive = false.obs;

  var isFeeDetailsActive = false.obs;
  var isPaymentByTransactionId = true.obs;
  // var isByWalet = true.obs;
  var isPaymentByWalet = false.obs;
  var paymentHistoryList = Rxn<List<Map<String, dynamic>>>();
  var dateFrom = DateTime.now().obs;
  var dateTo = DateTime.now().subtract(const Duration(days: 7)).obs;
  var token = "";

  var feeDetailsModel = Rxn<StuFeeDetailsModel>();
  // late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  var localPathOfDemandSlip = "".obs;
  var localPathOfBankSlip = "".obs;
  var localPath = "".obs;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  var isInitial = true.obs;
  var isDemandSlipFound = false.obs;
  var isBankSlipFound = false.obs;
  var isVisibleButtonsAndMethod = false.obs;

  @override
  void onInit() async {
    super.onInit();
    kLog("Payments View");
    token = await AppLocalDataFactory.mGetToken();

    // await mLocalNotificationInitialization();

    await mGetPaymentHistory();
    await mGetFeeDetails();
    await mGetDemandSlipPdf();
    await mGetBankSlipPdf();
    mListenNotification();
  }

  @override
  void onClose() {
    super.onClose();
    // LocalNotification().onClickNotificationBehavior.done;
  }

  void mClickedBkashBtn() {
    isNagadBtnClicked.value = false;
    isCellFinBtnClicked.value = false;
    isBkashBtnClicked.value = true;
  }

  void mClickedNagadBtn() {
    isBkashBtnClicked.value = false;
    isCellFinBtnClicked.value = false;
    isNagadBtnClicked.value = true;
  }

  void mClickedCellfinBtn() {
    isNagadBtnClicked.value = false;
    isBkashBtnClicked.value = false;
    isCellFinBtnClicked.value = true;
  }

  mGetPaymentHistory() async {
    paymentHistoryList.value = [
      {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"},
      /*   {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"},
      {"item": "item1"}, */
    ];
  }

  mSelectDateFrom() async {
    DateTime? pickedDate = await showDatePicker(
      context: kGlobContext,
      initialDate: dateFrom.value,
      firstDate: DateTime.now().subtract(const Duration(days: 364)),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      dateFrom.value = pickedDate;
    }
  }

  String mGetFormatDate(dynamic dateFrom, [String? dateFormat]) {
    // return Utils().getTimeFromTimeStamp(dateFrom.toString(), "dd-MM-yyyy");
    return Utils().getTimeFromTimeStamp(
        dateFrom.toString(), dateFormat ?? kAppDateFormat);
  }

  mSelectDateTo() async {
    DateTime? pickedDate = await showDatePicker(
      context: kGlobContext,
      initialDate: dateTo.value,
      firstDate: DateTime.now().subtract(const Duration(days: 364)),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      dateTo.value = pickedDate;
    }
  }

  void mUpdateFeeDetails() {
    isFeeDetails.value = !isFeeDetails.value;
  }

  void mUpdateMakePaymentTabItem() {
    isMakePaymentTabActive.value = true;
    isPaymentHistoryTabActive.value = false;
  }

  void mUpdatePaymentHistoryTabItem() {
    isMakePaymentTabActive.value = false;
    isPaymentHistoryTabActive.value = true;
  }

  mGetFeeDetails() async {
    feeDetailsModel.value = await PaymentsApi.mGetFeeDetails(
        PayLoads.stuPaymentDemandSlip(api_access_key: AppData.api_access_key),
        token);
    if (feeDetailsModel.value == null) {
      isVisibleButtonsAndMethod.value = false;
    } else {
      isVisibleButtonsAndMethod.value = true;
    }
  }

  /////////////Dowload Bank Slip Pdf////////////////
  var demandSlipPdfResponse = Rxn<Uint8List>().obs;
  var bankSlipPdfResponse = Rxn<Uint8List>().obs;
/* 
  mGetExamRoutinePdf() async {
    demandSlipPdfResponse.value.value = await PaymentsApi.mGetBankSlipPdf({
      "api_access_key": AppData.api_access_key,
    }, token);

    /*  routinePdfResponse.value.value != null &&
            routinePdfResponse.value.value!.isNotEmpty
        ? {
            isFoundRoutinePdf.value = true,
            documentList.add("Examination Routine Pdf")
          }
        : false; */
  } */

//////////////Local Notification////////////////////////
  /* Future<void> showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('pdf_download_channel', 'PDF Download',
            /* 'PDF Download Notification' */
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker',
            playSound: false,
            enableVibration: false);

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
        0, 'PDF Downloaded', 'Click to open PDF', platformChannelSpecifics,
        payload: /* 'item x' */ localPath.value);
  }

  /*  Future<void> */ mLocalNotificationInitialization() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (defaultValue) async {
      await onDidReceiveNotificationResponse();
    });
  }

  onDidReceiveNotificationResponse() async {
    // Handle notification tap
    print("Notification Tapped!");
    // Check if the PDF file exists
    if (localPath.value != "") {
      // Open PDF file
      await OpenFilex.open(localPath.value);
      kLog(localPath.value);
    } else {
      print("PDF file not found.");
    }
  } */

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

  mGetDemandSlipPdf() async {
    demandSlipPdfResponse.value.value = await PaymentsApi.mGetDemandSlipPdf({
      "api_access_key": AppData.api_access_key,
    }, token);
    if (demandSlipPdfResponse.value.value != null) {
      isDemandSlipFound.value = true;
    }
  }

  mGetBankSlipPdf() async {
    bankSlipPdfResponse.value.value = await PaymentsApi.mGetBankSlipPdf({
      "api_access_key": AppData.api_access_key,
    }, token);
    if (bankSlipPdfResponse.value.value != null) {
      isBankSlipFound.value = true;
    }
  }

  mDownloadDemandSlipPdf() async {
    showLoading("Downloading...");

    demandSlipPdfResponse.value.value = await PaymentsApi.mGetDemandSlipPdf({
      "api_access_key": AppData.api_access_key,
    }, token);
    if (demandSlipPdfResponse.value.value != null) {
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
          "${downloadDirectory.path}/demand_slip ${DateTime.now().millisecondsSinceEpoch}.pdf";

      File file = File(filePath);

      try {
        if (Platform.isAndroid) {
          final androidInfo = await DeviceInfoPlugin().androidInfo;

          // kLogger.d(androidInfo.version.sdkInt);
          if (androidInfo.version.sdkInt <= 32) {
            if (await Permission.storage.request().isGranted) {
              kLog('permission granted');
              await file.writeAsBytes(demandSlipPdfResponse.value.value!);
              // localPathOfDemandSlip.value = file.path;
              // await showNotification();
              isInitial.value = false;

              await LocalNotification().mShowNotification(payload: file.path);
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
          } else {
            if (await Permission.photos.request().isGranted &&
                await Permission.notification.request().isGranted) {
              kLog('permission granted');
              await file.writeAsBytes(demandSlipPdfResponse.value.value!);
              // localPathOfDemandSlip.value = file.path;
              // await showNotification();
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
        showError("Download failed");
      }
      // kLog(pdfPath);
    } else {
      kLog("Response Null");
      showError("Not Found");
    }
  }

  mDownloadBankSlipPdf() async {
    showLoading("Downloading...");

    bankSlipPdfResponse.value.value = await PaymentsApi.mGetBankSlipPdf({
      "api_access_key": AppData.api_access_key,
    }, token);
    if (bankSlipPdfResponse.value.value != null) {
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
          "${downloadDirectory.path}/bank_slip ${DateTime.now().millisecondsSinceEpoch}.pdf";

      File file = File(filePath);

      try {
        if (Platform.isAndroid) {
          final androidInfo = await DeviceInfoPlugin().androidInfo;

          // kLogger.d(androidInfo.version.sdkInt);
          if (androidInfo.version.sdkInt <= 32) {
            if (await Permission.storage.request().isGranted) {
              kLog('permission granted');
              await file.writeAsBytes(bankSlipPdfResponse.value.value!);
              // localPathOfDemandSlip.value = file.path;
              // await showNotification();
              isInitial.value = false;

              await LocalNotification().mShowNotification(payload: file.path);
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
          } else {
            if (await Permission.photos.request().isGranted &&
                await Permission.notification.request().isGranted) {
              kLog('permission granted');
              await file.writeAsBytes(bankSlipPdfResponse.value.value!);
              // localPathOfDemandSlip.value = file.path;
              // await showNotification();
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
        showError("Download failed");
      }
      // kLog(pdfPath);
    } else {
      kLog("Response Null");
      showError("Not Found");
    }
  }

/*   void mLocalNotificationInitialization() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOS = IOSInitializationSettings();
    final initSettings = InitializationSettings(android, iOS);

    flutterLocalNotificationsPlugin.initialize(initSettings,
        onSelectNotification: _onSelectNotification);
  }

  Future<void> _onSelectNotification(String json) async {
    // todo: handling clicked notification
  } */
}
