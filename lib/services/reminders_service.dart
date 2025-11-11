import 'package:dosee/models/reminder.dart';
import 'package:hive_ce/hive.dart';

class RemindersService {
  static final String boxName = "REMINDERS_BOX";
  static Box<Reminder>? _box;

  static Future<Box<Reminder>> getBox() async {
    if (_box?.isOpen == true) return _box!;
    _box = await Hive.openBox<Reminder>(boxName);
    return _box!;
  }

  Future<Reminder> addReminder(Reminder reminder) async {
    final box = await getBox();
    final reminderId = await box.add(reminder);
    reminder.id = reminderId;
    await box.put(reminderId, reminder);

    return reminder;
  }

  Future<List<Reminder>> getAllReminders() async {
    final box = await getBox();
    return box.values.toList();
  }

  Future<void> deleteReminder(int key) async {
    final box = await getBox();
    await box.delete(key);
  }

  Future<void> clearReminders() async {
    final box = await getBox();
    await box.clear();
  }

  Future<void> updateReminder(Reminder reminder) async {
    final box = await getBox();
    if (reminder.id != null) {
      await box.put(reminder.id, reminder);
    }
  }
}
