import 'package:bording_week1/common/const/appcolors.dart';
import 'package:bording_week1/common/const/styles/texts/bold_text.dart';
import 'package:flutter/material.dart';

class NotifcationCountContianer extends StatelessWidget {
  final String count;
  const NotifcationCountContianer({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: Appcolors.notfcaitonred,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: BoldText(text: "2", fontsize: 10, color: Colors.white),
      ),
    );
  }
}
