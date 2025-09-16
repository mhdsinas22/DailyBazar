import 'package:flutter/material.dart';

class MediumFont extends StatelessWidget {
  final String text;
  final double fontsize;
  final TextAlign textAlign;
  final Color color;

  const MediumFont({
    super.key,
    required this.text,
    this.fontsize = 14,
    this.textAlign = TextAlign.center,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: FontWeight.w600, // ithil w600 set cheythu
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}
