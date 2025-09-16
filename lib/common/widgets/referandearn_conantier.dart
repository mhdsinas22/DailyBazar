import 'package:bording_week1/common/const/appcolors.dart';
import 'package:bording_week1/common/const/appimages.dart';
import 'package:flutter/material.dart';

class Referandearncontanier extends StatelessWidget {
  const Referandearncontanier({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          width: screenWidth * 0.9,
          height: screenHeight * 0.10,
          decoration: BoxDecoration(
            color: Appcolors.appgreen,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    "Refer & Earn",
                    style: TextStyle(
                      fontSize: 20,
                      color: Appcolors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    "Invite your friends & earn 15% off",
                    style: TextStyle(
                      color: Appcolors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(Icons.arrow_circle_right, color: Appcolors.white),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: screenWidth * 0.07, // instead of fixed 60 px
          top: screenHeight * 0.01,
          child: Image.asset(
            width: screenWidth * 0.174,
            height: screenHeight * 0.084,
            Appimages.referearngift,
          ),
        ),
      ],
    );
  }
}
