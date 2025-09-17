import 'package:bording_week1/common/const/appcolors.dart';
import 'package:bording_week1/common/const/styles/texts/semibold.dart';
import 'package:bording_week1/common/widgets/Offer_badge_widget.dart';
import 'package:bording_week1/common/widgets/item_Inforow_widget.dart';
import 'package:flutter/material.dart';

class NearbyStoresWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String siteno;
  final String rating;
  final String minutes;

  const NearbyStoresWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.siteno,
    required this.rating,
    required this.minutes,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // scale factors for responsiveness
    double textScale = screenWidth / 375; // 375px = base design width
    double imageSize = screenWidth * 0.18; // 15% of screen width

    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      padding: EdgeInsets.all(screenWidth * 0.02),
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Store Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  image,
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(width: screenWidth * 0.03),

              // Text details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SemiBold(text: title, fontsize: 14 * textScale),
                    Text(subtitle, style: TextStyle(fontSize: 12 * textScale)),
                    Text(siteno, style: TextStyle(fontSize: 12 * textScale)),
                    SizedBox(height: screenHeight * 0.005),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Appcolors.whitegrey,
                      ),
                      child: Text(
                        "Top Store",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10 * textScale,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),

                    SizedBox(height: screenHeight * 0.005),
                  ],
                ),
              ),
              // Right side rating + time
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    rating,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14 * textScale,
                    ),
                  ),
                  Text(
                    minutes,
                    style: TextStyle(
                      color: Appcolors.yelloworage,
                      fontSize: 12 * textScale,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: screenHeight * 0.0080), // 6 / 812 ≈ 0.0074
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: screenWidth * 0.70,
                    height: 1,
                    color: Appcolors.divdercolor,
                  ),
                ),
                SizedBox(height: screenHeight * 0.0074), // 6 / 812 ≈ 0.0074
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OfferBadge(screenWidth: screenWidth, textScale: textScale),
                    SizedBox(width: screenWidth * 0.080), // 10 / 375 ≈ 0.027
                    Flexible(
                      child: ItemInfoRow(
                        text: "3400+ items available",
                        textScale: textScale,
                        screenWidth: screenWidth,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
