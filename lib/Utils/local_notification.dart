import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:school_management_system/Config/config.dart';

class LocalNotification {
  // make this class singleton
  LocalNotification._internal();
  static final LocalNotification _singleton = LocalNotification._internal();
  factory LocalNotification() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final onClickNotificationBehavior = BehaviorSubject<String>();

  // on tap any Notificaiton
  Future mOnClickNotification(NotificationResponse notificationResponse) async {
    if (notificationResponse.payload != null) {
      onClickNotificationBehavior.add(notificationResponse.payload!);
    } else {
      kLog("Notification Payload is Empty");
    }
  }

//initialize Local Notification
  Future mInit() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    /*   final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification: (id, title, body, payload) => null);
    final LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification'); */
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      // iOS: initializationSettingsDarwin,
      // linux: initializationSettingsLinux
    );
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        mOnClickNotification(notificationResponse);
      },
     /*  onDidReceiveBackgroundNotificationResponse:
          (NotificationResponse notificationResponse) {
        mOnClickNotification(notificationResponse);
      }, */
    );
  }

  ////Show Notification//////
  Future mShowNotification({
    String? title,
    String? body,
    required String payload,
  }) async {
    kLog("Payload: $payload");
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('pdf_download_channel', 'PDF Download',
            channelDescription: body ?? '',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    kLog("Pass");
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    kLog("Pass");
    await flutterLocalNotificationsPlugin.show(
        0, 'PDF Downloaded', 'Click to open PDF', notificationDetails,
        payload: payload);
  }
}
