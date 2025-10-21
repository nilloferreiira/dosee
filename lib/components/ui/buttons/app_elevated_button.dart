import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? padding;
  const AppElevatedButton({
    required this.text,
    this.onPressed,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
