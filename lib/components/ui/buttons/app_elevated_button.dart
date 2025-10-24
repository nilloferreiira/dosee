import 'package:dosee/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final double? padding;
  final VoidCallback? onPressed;
  const AppElevatedButton({
    required this.text,
    this.fontSize = 20,
    this.fontWeight = FontWeight.bold,
    this.onPressed,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blueSecondary,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }
}
