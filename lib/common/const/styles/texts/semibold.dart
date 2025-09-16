import 'package:flutter/material.dart';

class SemiBold extends StatelessWidget {
  final String text;
  final double fontsize;
  final TextAlign textAlign;
  final Color color;
  final TextOverflow? overflow;
  const SemiBold({
    super.key,
    this.fontsize = 20,
    required this.text,
    this.textAlign = TextAlign.center,
    this.color = Colors.black,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 1,
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: FontWeight.w700,
        color: color,
      ),
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}
