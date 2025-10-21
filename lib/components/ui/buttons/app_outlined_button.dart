import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? padding;
  const AppOutlinedButton({
    required this.text,
    this.onPressed,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.deepPurpleAccent.shade700.withValues(
          alpha: 0.2,
        ),
        side: BorderSide(color: Colors.deepPurpleAccent, width: 2),
        foregroundColor: Colors.deepPurpleAccent,
        padding: EdgeInsets.symmetric(vertical: padding ?? 16),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
