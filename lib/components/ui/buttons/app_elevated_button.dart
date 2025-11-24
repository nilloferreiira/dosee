import 'package:dosee/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double? padding;
  final VoidCallback? onPressed;
  const AppElevatedButton({
    required this.text,
    this.fontSize = 20,
    this.color = AppColors.blueLight1,
    this.fontWeight = FontWeight.w500,
    this.onPressed,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: padding ?? 16, horizontal: 20),
        minimumSize: Size(64, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
