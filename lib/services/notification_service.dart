import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  // Initialize
  Future<void> initNotifications() async {
    if (_isInitialized) return; // prevent initialization

    // android init settings
    const initSettingsAndroid = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    // ios init settings
    const initSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    // init setup

    const initSettings = InitializationSettings(
      android: initSettingsAndroid,
      iOS: initSettingsIOS,
    );

    // initialize the plugin
    await notificationPlugin.initialize(initSettings);
  }

  // Notifications Detail setup

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel_id',
        'Daily Notificaitions',
        channelDescription: 'Daily Notification Channel',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  // Show notification method
  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    // return notificationPlugin.show(id, title, body, notificationDetails());
    try {
      print('Tentando mostrar notificação: id=$id, title=$title, body=$body');
      final details = notificationDetails();
      print('NotificationDetails: $details');
      await notificationPlugin.show(id, title, body, details);
      print('Notificação enviada!');
    } catch (e, s) {
      print('Erro ao mostrar notificação: $e');
      print('Stacktrace: $s');
    }
  }
}
