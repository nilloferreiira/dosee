import 'package:permission_handler/permission_handler.dart';

Future<void> notificationPermissionHandler() async {
  var status = await Permission.notification.status;
  if (!status.isGranted) {
    await Permission.notification.request();
  }
}
