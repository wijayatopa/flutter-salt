part of "services.dart";

class NotificationService {
  final FlutterLocalNotificationsPlugin localNotif =
      FlutterLocalNotificationsPlugin();
  void init(
      Future<dynamic> Function(int, String?, String?, String?)? onDidReceive) {
    final AndroidInitializationSettings androidSettings =
        const AndroidInitializationSettings(appIcon);

    final DarwinInitializationSettings iosSetting =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: onDidReceive,
    );

    final InitializationSettings initSetting =
        InitializationSettings(android: androidSettings, iOS: iosSetting);

    initLocalNotif(initSetting);
  }

  void initLocalNotif(InitializationSettings initSetting) async {
    await localNotif.initialize(initSetting);
  }

  void showNotif(String message) async {
    AndroidNotificationDetails androidNotifDetail =
        const AndroidNotificationDetails(channelId, 'Belajar Salt');

    await localNotif.show(12345, "Hayyyy", message,
        NotificationDetails(android: androidNotifDetail));
  }
}
