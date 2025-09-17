import 'package:bording_week1/common/const/appimages.dart';
import 'package:bording_week1/common/const/styles/texts/semibold.dart';
import 'package:flutter/material.dart';

class ItemInfoRow extends StatelessWidget {
  const ItemInfoRow({
    super.key,
    required this.textScale,
    required this.screenWidth,
    required this.text,
  });

  final double textScale;
  final double screenWidth;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Appimages.groecy,
          width: 16 * textScale,
          height: 16 * textScale,
        ),
        SizedBox(width: screenWidth * 0.0107), // 4 / 375 ≈ 0.0107
        SemiBold(text: text, fontsize: 10 * textScale),
      ],
    );
  }
}
