import 'package:dosee/components/reminders_list.dart';
import 'package:dosee/models/reminder.dart';
import 'package:dosee/services/reminders_service.dart';
import 'package:flutter/material.dart';

class Reminders extends StatefulWidget {
  const Reminders({super.key});

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
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
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    } else {
      if (reminders.isEmpty) {
        return Center(child: Text("Nenhum lembrete"));
      }
      return RemindersList(items: reminders);
    }
  }
}
