import 'package:dosee/components/ui/buttons/app_elevated_button.dart';
import 'package:dosee/components/ui/buttons/app_outlined_button.dart';
import 'package:dosee/components/ui/inputs/input.dart';
import 'package:dosee/components/ui/inputs/week_day_time_input.dart';
import 'package:dosee/models/reminder.dart';
import 'package:dosee/services/notification_service.dart';
import 'package:dosee/services/reminders_service.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CreateReminder extends StatefulWidget {
  final VoidCallback? onSaved;

  const CreateReminder({super.key, this.onSaved});

  @override
  State<CreateReminder> createState() => _CreateReminderState();
}

class _CreateReminderState extends State<CreateReminder> {
  final _formKey = GlobalKey<FormState>();
  final _labelController = TextEditingController();
  final _descriptionController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  List<int> selectedWeekdays = [];

  @override
  void dispose() {
    _labelController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  // Future<Reminder> _createReminder() async {
  //   String label = _labelController.text;
  //   String description = _descriptionController.text;

  //   return Reminder(
  //     title: label,
  //     description: description,
  //     weekdays: selectedWeekdays,
  //     time: selectedTime,
  //   );
  // }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String label = _labelController.text;
      String description = _descriptionController.text;

      // hive logic
      Reminder reminder = await RemindersService().addReminder(
        Reminder(
          title: label,
          description: description,
          weekdays: selectedWeekdays,
          time: selectedTime,
        ),
      );

      // notifcation logic
      NotificationService().scheduleWeeklyNotifications(
        id: reminder.id!,
        title: reminder.title,
        body: reminder.description,
        hour: reminder.time.hour,
        minute: reminder.time.minute,
        weekdays: reminder.weekdays,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: 450,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Input(
              controller: _labelController,
              fontSize: 16,
              hintText: 'Do que você quer lembrar?',
              validator: (value) => value == null || value.isEmpty
                  ? 'Por favor, insira o nome do lembrete'
                  : null,
            ),
            Gap(16),
            Input(
              controller: _descriptionController,
              fontSize: 16,
              hintText: 'Descrição',
              validator: (value) => value == null || value.isEmpty
                  ? 'Por favor, insira o nome do lembrete'
                  : null,
            ),
            Gap(16),
            WeekdayTimeInput(
              onChanged: (time, weekdays) {
                // Salve ou use time e weekdays como quiser
                setState(() {
                  selectedWeekdays = weekdays;
                  selectedTime = time;
                });
                print('Horário: $selectedTime, Dias: $selectedWeekdays');
              },
            ),
            Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppOutlinedButton(
                  text: "Cancelar",
                  padding: 8,
                  onPressed: Navigator.of(context).pop,
                ),
                Gap(16),
                AppElevatedButton(
                  text: "Salvar",
                  onPressed: () async {
                    try {
                      await _submitForm();
                      if (widget.onSaved != null) widget.onSaved?.call();
                      // ignore: use_build_context_synchronously
                      if (mounted) Navigator.of(context).pop();
                    } catch (e, stack) {
                      debugPrint('Erro ao salvar lembrete: $e\n$stack');
                      if (mounted) {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Erro ao salvar lembrete. Tente novamente.',
                            ),
                          ),
                        );
                      }
                    }
                  },
                  padding: 8,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
