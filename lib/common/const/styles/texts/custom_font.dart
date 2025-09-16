import 'package:flutter/material.dart';

class CustomFont extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final Color color;

  const CustomFont({
    super.key,
    required this.text,
    this.fontsize = 14,
    this.fontWeight = FontWeight.w500, // default normal
    this.textAlign = TextAlign.center,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: fontWeight,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}
