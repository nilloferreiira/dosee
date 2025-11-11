import 'package:dosee/components/ui/card/reminder_card.dart';
import 'package:dosee/models/reminder.dart';
import 'package:dosee/services/notification_service.dart';
import 'package:dosee/services/reminders_service.dart';
import 'package:flutter/material.dart';

class RemindersList extends StatelessWidget {
  final List<Reminder> items;
  final VoidCallback? onSaved;

  const RemindersList({super.key, required this.items, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final Reminder item = items[index];

          return Dismissible(
            key: Key(item.id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) async {
              await RemindersService().deleteReminder(item.id!);
              for (final weekday in item.weekdays) {
                final notificationId = item.id! * 10 + weekday;
                await NotificationService().cancelNotifications(notificationId);
              }
              if (onSaved != null) onSaved!();

              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('${item.title} removido')));
            },
            background: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(bottom: 4, right: 4, top: 4),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: ReminderCard(
              title: item.title,
              description: item.description,
              time: item.time,
              weekdays: item.weekdays,
              isCompleted: item.isCompleted,
              onCompleted: () async {
                item.isCompleted = !item.isCompleted;
                await RemindersService().updateReminder(item);
                if (onSaved != null) onSaved!();
              },
            ),
          );
        },
      ),
    );
  }
}
