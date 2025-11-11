import 'package:hive_ce/hive.dart';
import 'package:dosee/models/reminder.dart';
import 'package:flutter/material.dart';

class ReminderAdapter extends TypeAdapter<Reminder> {
  @override
  final int typeId = 2;

  @override
  Reminder read(BinaryReader reader) {
    return Reminder(
      id: reader.readInt(),
      title: reader.readString(),
      description: reader.readString(),
      weekdays: reader.readList().cast<int>(),
      time: reader.read() as TimeOfDay,
      isCompleted: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, Reminder obj) {
    writer.writeInt(obj.id ?? 0);
    writer.writeString(obj.title);
    writer.writeString(obj.description);
    writer.writeList(obj.weekdays);
    writer.write(obj.time);
    writer.writeBool(obj.isCompleted);
  }
}
