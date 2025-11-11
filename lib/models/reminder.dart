import 'package:flutter/material.dart';

class Reminder {
  int? id;
  String title;
  String description;
  List<int> weekdays; // 1=segunda, 7=domingo
  TimeOfDay time; // horário do lembrete
  bool isCompleted = false;

  Reminder({
    this.id,
    required this.title,
    required this.description,
    required this.weekdays,
    required this.time,
    this.isCompleted = false,
  });
}
