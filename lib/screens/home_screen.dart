import 'package:dosee/components/create_reminder.dart';
import 'package:dosee/components/reminders.dart';
import 'package:dosee/components/reminders_list.dart';
import 'package:dosee/components/ui/dialog/dialog.dart';
import 'package:dosee/models/reminder.dart';
import 'package:dosee/services/notification_service.dart';
import 'package:dosee/services/reminders_service.dart';
import 'package:dosee/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:dosee/components/ui/private/app_bar_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _remindersService = RemindersService();
  bool _isLoading = true;
  List<Reminder> reminders = [];

  @override
  void initState() {
    super.initState();
    _loadReminders();
  }

  Future<void> _loadReminders() async {
    final loaded = await _remindersService.getAllReminders();
    setState(() {
      reminders = loaded;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    onPressed() {
      showDialog(
        context: context,
        builder: (BuildContext context) => AppDialog(
          title: 'Cadastrar lembrete',
          children: CreateReminder(onSaved: _loadReminders),
        ),
        //TODO implementar actions
      );
    }

    return AppBarPage(
      title: "Meus lembretes",
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppColors.blueLight1),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Equipe'),
              onTap: () {
                Navigator.pushNamed(context, '/team');
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Sobre'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            //TODO remover esse botao
            ListTile(
              leading: Icon(Icons.dangerous),
              title: Text('Cancelar todas as notificações'),
              onTap: () {
                NotificationService().cancelAllNotifications();
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sair'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/welcome");
              },
            ),
          ],
        ),
      ),
      showLeading: false,
      children: Stack(
        alignment: Alignment.topCenter,
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : reminders.isEmpty
                ? Center(child: Text("Nenhum lembrete"))
                : RemindersList(items: reminders, onSaved: _loadReminders),
          ),
          Positioned(
            bottom: 50,
            right: 32,
            child: FloatingActionButton(
              onPressed: onPressed,
              backgroundColor: AppColors.blueLight1,

              child: (Icon(Icons.add)),
            ),
          ),
        ],
      ),
    );
  }
}
