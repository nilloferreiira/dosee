import 'package:flutter/material.dart';

class DoseeLogo extends StatelessWidget {
  final double size;
  final Color textColor;
  final double fontSize;

  const DoseeLogo({
    super.key,
    this.size = 64,
    this.textColor = Colors.white,
    this.fontSize = 48,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: Image.asset('assets/images/pill-3.png'),
        ),
        SizedBox(width: 16),
        Text(
          'Dosee',
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
