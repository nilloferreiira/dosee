import 'package:dosee/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ReminderCard extends StatelessWidget {
  final String title;
  final String description;
  //TODO mudar para date?
  final DateTime alarmTime;

  const ReminderCard({
    super.key,
    required this.title,
    required this.description,
    required this.alarmTime,
  });

  String formatDateTime(DateTime dateTime) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    String day = twoDigits(dateTime.day);
    String month = twoDigits(dateTime.month);
    String year = dateTime.year.toString();
    String hour = twoDigits(dateTime.hour);
    String minute = twoDigits(dateTime.minute);

    return '$day/$month/$year $hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: AppColors.zinc900,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Gap(8),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                  ),
                  Gap(8),
                  Text(
                    formatDateTime(alarmTime),
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
