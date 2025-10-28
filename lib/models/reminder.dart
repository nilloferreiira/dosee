class Reminder {
  final String id;
  final String title;
  final String description;
  final DateTime alarmTime;
  final bool isCompleted;

  Reminder({
    required this.id,
    required this.title,
    required this.description,
    required this.alarmTime,
    this.isCompleted = false,
  });
}
