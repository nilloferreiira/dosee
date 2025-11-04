import 'package:dosee/helpers/permission_helper.dart';
import 'package:dosee/screens/about_app/about_screen.dart';
import 'package:dosee/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:dosee/screens/auth/login_screen.dart';
import 'package:dosee/screens/auth/welcome_screen.dart';
import 'package:dosee/screens/home_screen.dart';
import 'package:dosee/screens/team/team_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // init notifications
  NotificationService().initNotifications();

  // Ask for notifications permission
  await notificationPermissionHandler();

  // MultiProvider

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ME Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black, // fundo mais escuro
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      // se tiver login no context ent redireciona direto para /home
      initialRoute: "/welcome",
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/': (context) => HomeScreen(),
        '/team': (context) => TeamScreen(),
        '/about': (context) => AboutScreen(),
      },
    );
  }
}
