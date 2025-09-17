import 'package:bording_week1/common/const/appimages.dart';
import 'package:bording_week1/common/const/styles/texts/semibold.dart';
import 'package:flutter/material.dart';

class OfferBadge extends StatelessWidget {
  const OfferBadge({
    super.key,
    required this.screenWidth,
    required this.textScale,
  });

  final double screenWidth;
  final double textScale;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: screenWidth * 0.200), // 70 / 375 ≈ 0.187
        Image.asset(
          Appimages.percenticon,
          width: 16 * textScale,
          height: 16 * textScale,
        ),
        SizedBox(width: screenWidth * 0.0133), // 5 / 375 ≈ 0.0133
        SemiBold(text: "Upto 10% OFF", fontsize: 10 * textScale),
      ],
    );
  }
}
