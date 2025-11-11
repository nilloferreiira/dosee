import 'package:flutter/material.dart';
import 'package:dosee/styles/app_colors.dart';

class WeekdayTimeInput extends StatefulWidget {
  final TimeOfDay? initialTime;
  final List<int>? initialWeekdays; // 1=segunda, 7=domingo
  final void Function(TimeOfDay, List<int>)? onChanged;

  const WeekdayTimeInput({
    super.key,
    this.initialTime,
    this.initialWeekdays,
    this.onChanged,
  });

  @override
  State<WeekdayTimeInput> createState() => _WeekdayTimeInputState();
}

class _WeekdayTimeInputState extends State<WeekdayTimeInput> {
  TimeOfDay? _selectedTime;
  List<int> _selectedWeekdays = [];

  final List<String> _weekdays = [
    'Seg',
    'Ter',
    'Qua',
    'Qui',
    'Sex',
    'Sáb',
    'Dom',
  ];

  @override
  void initState() {
    super.initState();
    _selectedTime = widget.initialTime;
    _selectedWeekdays = widget.initialWeekdays ?? [];
  }

  Future<void> _pickTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.dark(
            primary: AppColors.bluePrimary,
            onPrimary: Colors.white,
            surface: AppColors.zinc900,
            onSurface: Colors.white,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
      widget.onChanged?.call(_selectedTime!, _selectedWeekdays);
    }
  }

  void _toggleWeekday(int weekday) {
    setState(() {
      if (_selectedWeekdays.contains(weekday)) {
        _selectedWeekdays.remove(weekday);
      } else {
        _selectedWeekdays.add(weekday);
      }
    });
    if (_selectedTime != null) {
      widget.onChanged?.call(_selectedTime!, _selectedWeekdays);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Escolha o horário:', style: TextStyle(color: Colors.white)),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () => _pickTime(context),
          child: AbsorbPointer(
            child: TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: _selectedTime == null
                    ? 'Selecione o horário'
                    : '${_selectedTime!.hour.toString().padLeft(2, '0')}:${_selectedTime!.minute.toString().padLeft(2, '0')}',
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.black12,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.blueSecondary,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.bluePrimary,
                    width: 2.5,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.blueSecondary),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 16,
                ),
                suffixIcon: Icon(Icons.access_time, color: Colors.white54),
              ),
            ),
          ),
        ),
        SizedBox(height: 24),
        Text('Dias da semana:', style: TextStyle(color: Colors.white)),
        Wrap(
          spacing: 8,
          children: List.generate(7, (i) {
            final weekday = i + 1; // 1=segunda, 7=domingo
            return FilterChip(
              label: Text(_weekdays[i]),
              selected: _selectedWeekdays.contains(weekday),
              onSelected: (_) => _toggleWeekday(weekday),
              selectedColor: AppColors.bluePrimary,
              checkmarkColor: Colors.white,
              backgroundColor: AppColors.zinc900,
              labelStyle: TextStyle(color: Colors.white),
            );
          }),
        ),
      ],
    );
  }
}
