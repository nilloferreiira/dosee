import 'package:dosee/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ReminderCard extends StatelessWidget {
  final String title;
  final String description;
  final List<int> weekdays; // 1=segunda, 7=domingo
  final TimeOfDay time; // horário do lembrete
  final bool isCompleted;
  final VoidCallback? onCompleted;

  const ReminderCard({
    super.key,
    required this.title,
    required this.description,
    required this.weekdays,
    required this.time,
    required this.isCompleted,
    this.onCompleted,
  });

  String formatWeekdays(List<int> weekdays) {
    const names = ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'];
    return weekdays.map((d) => names[d - 1]).join(', ');
  }

  String formatTime(TimeOfDay time) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return '${twoDigits(time.hour)}:${twoDigits(time.minute)}';
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
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: AppColors.blueLight4,
                        size: 20,
                      ),
                      Gap(6),
                      Text(
                        formatTime(time),
                        style: TextStyle(
                          color: AppColors.blueLight4,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                  Gap(4),
                  Wrap(
                    spacing: 6,
                    children: weekdays.map((d) {
                      const names = [
                        'Seg',
                        'Ter',
                        'Qua',
                        'Qui',
                        'Sex',
                        'Sáb',
                        'Dom',
                      ];
                      return Chip(
                        label: Text(
                          names[d - 1],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: AppColors.bluePrimary,
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        visualDensity: VisualDensity.compact,
                      );
                    }).toList(),
                  ),
                  Gap(8),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isCompleted ? Colors.greenAccent : Colors.grey,
                size: 28,
              ),
              onPressed: () {
                // Chame o callback para marcar como concluído
                if (onCompleted != null) onCompleted!();
              },
            ),
          ],
        ),
      ),
    );
  }
}
