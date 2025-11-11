import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/standalone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

class NotificationService {
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  // Initialize
  Future<void> initNotifications() async {
    if (_isInitialized) return; // prevent initialization

    // init timezone handling
    tz.initializeTimeZones();
    final currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone.identifier));
    // print(tz.local);
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
    final details = notificationDetails();
    await notificationPlugin.show(id, title, body, details);
  }

  //Schedule a notification at a specfic time
  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required int hour,
    required int minute,
  }) async {
    // Get the currente date/time
    final now = tz.TZDateTime.now(tz.local);

    // Create date/time for today the specified hour
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    if (scheduledDate.isBefore(now) || scheduledDate == now) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    print(now);
    print([id, title, body, scheduledDate]);
    // Schedule the notification
    await notificationPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      notificationDetails(),

      // Android specific configurations

      // para testes use exactAllowWhileIdle; em produção pode preferir inexactAllowWhileIdle
      // androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,

      // Make notification repeat DAILY at the same time
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );

    // Debug: listar notificações agendadas
    final pending = await notificationPlugin.pendingNotificationRequests();
    print('Pending notifications (${pending.length}):');
    for (final p in pending) {
      print(
        '  id:${p.id} title:${p.title} body:${p.body} payload:${p.payload}',
      );
    }

    print("Notification scheduled");
  }

  Future<void> scheduleWeeklyNotifications({
    required int id,
    required String title,
    required String body,
    required int hour,
    required int minute,
    required List<int> weekdays, // dias da semana selecionados pelo usuário
  }) async {
    final now = tz.TZDateTime.now(tz.local);

    for (final weekday in weekdays) {
      // Calcula a próxima ocorrência do dia da semana
      tz.TZDateTime scheduledDate = _nextInstanceOfWeekday(
        hour,
        minute,
        weekday,
        now,
      );

      final notificationId = id * 10 + weekday;

      // Use um id diferente para cada dia
      await notificationPlugin.zonedSchedule(
        notificationId,
        title,
        body,
        scheduledDate,
        notificationDetails(),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      );

      print(
        'Agendada notificação para $scheduledDate (weekday=$weekday, id=$id)',
      );
    }

    // Debug: listar notificações agendadas
    final pending = await notificationPlugin.pendingNotificationRequests();
    print('Pending notifications (${pending.length}):');
    for (final p in pending) {
      print(
        '  id:${p.id} title:${p.title} body:${p.body} payload:${p.payload}',
      );
    }
  }

  // Função utilitária para calcular a próxima ocorrência de um dia da semana
  tz.TZDateTime _nextInstanceOfWeekday(
    int hour,
    int minute,
    int weekday,
    tz.TZDateTime now,
  ) {
    tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    // weekday: 1=segunda, 7=domingo
    while (scheduledDate.weekday != weekday || scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  // Cancel all notificattions
  Future<void> cancelAllNotifications() async {
    await notificationPlugin.cancelAll();
  }

  // Cancel an specific notification
  Future<void> cancelNotifications(int id) async {
    if (id == 0) return;

    await notificationPlugin.cancel(id);
  }

  // Get all notifications
  Future<List<PendingNotificationRequest>> getPendingNotifications() {
    return notificationPlugin.pendingNotificationRequests();
  }
}
