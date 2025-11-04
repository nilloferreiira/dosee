import 'package:permission_handler/permission_handler.dart';

Future<void> notificationPermissionHelper() async {
  var status = await Permission.notification.status;
  if (!status.isGranted) {
    await Permission.notification.request();
  }
}
