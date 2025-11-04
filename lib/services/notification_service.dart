import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  //Initialize
  Future<void> initNotifications() async {
    if (_isInitialized) return; // prevent initialization

    // // android init settings
    // const initSettingsAndroid = AndroidInitializationSettings(
    //   '@mipmap/ic_launcher',
    // );
    // // ios init settings
    // const initSettingsIOS = DarwinInitializationSettings(
    //   resquertAlertPermission: true,
    // )
  }

  //Notifications Detail setup
}
