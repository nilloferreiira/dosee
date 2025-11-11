import 'package:dosee/components/ui/buttons/app_elevated_button.dart';
import 'package:dosee/components/ui/buttons/app_outlined_button.dart';
import 'package:dosee/components/ui/inputs/input.dart';
import 'package:dosee/components/ui/inputs/week_day_time_input.dart';
import 'package:dosee/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CreateReminder extends StatefulWidget {
  const CreateReminder({super.key});

  @override
  State<CreateReminder> createState() => _CreateReminderState();
}

class _CreateReminderState extends State<CreateReminder> {
  final _formKey = GlobalKey<FormState>();
  final _labelController = TextEditingController();
  final _descriptionController = TextEditingController();
  List<int> selectedWeekdays = [];
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  @override
  void dispose() {
    _labelController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String label = _labelController.text;
      String description = _descriptionController.text;
      // logic to transform the array day to datetimes
      int hour = selectedTime.hour;
      int minute = selectedTime.minute;
      // notifcation logic

      NotificationService().scheduleWeeklyNotifications(
        id: 3,
        title: label,
        body: description,
        hour: hour,
        minute: minute,
        weekdays: selectedWeekdays,
      );
      // hive logic
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
                  onPressed: _submitForm,
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
