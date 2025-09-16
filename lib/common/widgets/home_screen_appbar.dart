import 'package:bording_week1/common/const/appcolors.dart';
import 'package:bording_week1/common/const/styles/texts/semibold.dart';
import 'package:flutter/material.dart';

class HomeScreenappabr extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenappabr({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
      title: Row(
        children: [
          Icon(Icons.location_on, color: Appcolors.appgreen, size: 26),
          SizedBox(width: 5),
          SemiBold(
            text: "ABCD, New Delhi",
            fontsize: screenWidth < 350 ? 14 : 16,
            overflow: TextOverflow.ellipsis,
          ),
          Icon(Icons.keyboard_arrow_down, color: Appcolors.appgreen),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
