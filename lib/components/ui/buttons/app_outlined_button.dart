import 'package:dosee/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final double? padding;
  final VoidCallback? onPressed;
  const AppOutlinedButton({
    required this.text,
    this.fontSize = 20,
    this.fontWeight = FontWeight.bold,
    this.onPressed,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(color: AppColors.blueSecondary, width: 2),
        foregroundColor: AppColors.blueLight1,
        padding: EdgeInsets.symmetric(vertical: padding ?? 16),
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
