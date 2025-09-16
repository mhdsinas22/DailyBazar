import 'package:flutter/material.dart';

class TrendingCatgoery extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String storelocation;
  final String ratingandtime;
  const TrendingCatgoery({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.storelocation,
    required this.ratingandtime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(image, width: 80, height: 88, fit: BoxFit.cover),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                ),
                Text(
                  storelocation,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                ),
                Row(
                  children: [
                    Icon(Icons.star, size: 10),
                    Text(
                      ratingandtime,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
