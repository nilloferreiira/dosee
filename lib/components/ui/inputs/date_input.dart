import 'package:flutter/material.dart';
import 'package:dosee/styles/app_colors.dart';

class DateInput extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final double? fontSize;
  final EdgeInsets? padding;

  const DateInput({
    super.key,
    required this.controller,
    this.hintText,
    this.validator,
    this.fontSize = 20,
    this.padding,
  });

  Future<void> _pickDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
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
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
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
      if (pickedTime != null) {
        final dateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        controller.text =
            "${dateTime.day.toString().padLeft(2, '0')}/"
            "${dateTime.month.toString().padLeft(2, '0')}/"
            "${dateTime.year} "
            "${pickedTime.hour.toString().padLeft(2, '0')}:"
            "${pickedTime.minute.toString().padLeft(2, '0')}";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickDateTime(context),
      child: AbsorbPointer(
        child: TextFormField(
          controller: controller,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: hintText ?? 'Selecione data e hora',
            hintStyle: TextStyle(color: Colors.white54),
            filled: true,
            fillColor: Colors.black12,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.blueSecondary, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.bluePrimary, width: 2.5),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.blueSecondary),
            ),
            contentPadding:
                padding ?? EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            suffixIcon: Icon(Icons.calendar_today, color: Colors.white54),
          ),
          validator: validator,
        ),
      ),
    );
  }
}
