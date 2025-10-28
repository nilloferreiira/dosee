import 'package:dosee/components/ui/card/reminder_card.dart';
import 'package:dosee/models/reminder.dart';
import 'package:flutter/material.dart';

class RemindersList extends StatefulWidget {
  final List<Reminder> items;

  const RemindersList({super.key, required this.items});

  @override
  State<RemindersList> createState() => _RemindersListState();
}

class _RemindersListState extends State<RemindersList> {
  late List<Reminder> items;

  @override
  void initState() {
    super.initState();
    items = List.from(widget.items);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Dismissible(
            key: Key(item.id), // precisa de uma chave única
            direction: DismissDirection
                .endToStart, // direção do swipe (ex: direita → esquerda)
            onDismissed: (direction) {
              // ação quando o item for arrastado
              // por exemplo, remover da lista
              setState(() {
                items.remove(item);
              });

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
              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: ReminderCard(
              title: item.title,
              description: item.description,
              alarmTime: item.alarmTime,
            ),
          );
        },
      ),
    );
  }
}
