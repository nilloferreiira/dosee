import 'package:dosee/components/create_reminder.dart';
import 'package:dosee/components/reminders_list.dart';
import 'package:dosee/components/ui/buttons/app_elevated_button.dart';
import 'package:dosee/components/ui/buttons/app_outlined_button.dart';
import 'package:dosee/components/ui/dialog/dialog.dart';
import 'package:dosee/models/reminder.dart';
import 'package:dosee/services/notification_service.dart';
import 'package:dosee/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:dosee/components/ui/private/app_bar_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    onPressed() {
      showDialog(
        context: context,
        builder: (BuildContext context) =>
            AppDialog(title: 'Cadastrar lembrete', children: CreateReminder()),
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
            child: Column(
              children: [
                SizedBox(
                  height: 64,
                  width: 96,
                  child: AppElevatedButton(
                    text: 'receba',
                    color: AppColors.bluePrimary,
                    onPressed: () {
                      NotificationService().showNotification(
                        title: 'receba',
                        body: 'É o cara da luva passando',
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 64,
                  width: 200,
                  child: AppOutlinedButton(
                    text: 'receba na hora exata pae',
                    onPressed: () async {
                      NotificationService().scheduleNotification(
                        id: 3,
                        title: 'receba',
                        body:
                            'É notificação passando no horario agendado as 23:07',
                        hour: 23,
                        minute: 07,
                      );
                    },
                  ),
                ),
                RemindersList(
                  items: [
                    Reminder(
                      id: '1',
                      title: 'Rivotril',
                      description: 'Tá no armário',
                      alarmTime: DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                        19, // hora
                        0, // minuto
                      ),
                    ),
                    Reminder(
                      id: '2',
                      title: 'Dipirona',
                      description: 'Depois do almoço',
                      alarmTime: DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                        13, // hora
                        0, // minuto
                      ),
                    ),
                  ],
                ),
              ],
            ),
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


// Column(
//             children: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/login');
//                 },
//                 child: Text('login'),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/team');
//                 },
//                 child: Text('equipe'),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/about');
//                 },
//                 child: Text('about'),
//               ),
//             ],
//           )