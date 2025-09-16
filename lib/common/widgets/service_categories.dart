import 'package:bording_week1/common/const/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceCategories extends StatelessWidget {
  final String title;
  final String image;
  final bool isoffer;
  const ServiceCategories({
    super.key,
    required this.title,
    required this.image,
    required this.isoffer,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 70,
              height: 70,
              child: PhysicalModel(
                elevation: 4,
                color: Colors.white,
                // ignore: deprecated_member_use
                shadowColor: Colors.black.withOpacity(0.3),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                child: Center(child: SvgPicture.asset(image)),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        if (isoffer)
          Positioned(
            top: 5,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Appcolors.purple,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                "10% Off",
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ),
      ],
    );
  }
}
